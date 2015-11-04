#
# Script.ps1
#

function GetRestEndpoint([ThomyKay.Jira.JiraSession]$Session)
{
	return [Uri]($Session.ConnectionUri.OriginalString + "/rest/api/latest")
}

function GetHeaders([ThomyKay.Jira.JiraSession]$Session)
{
    $userName = $Session.Credential.GetNetworkCredential().UserName
    $password = $Session.Credential.GetNetworkCredential().Password
	$headers = @{Authorization="Basic " + [Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${userName}:$password"))}
	return $headers
}