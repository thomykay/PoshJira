function Get-JiraProject
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/project/"
    $userName = $Session.Credential.GetNetworkCredential().UserName
    $password = $Session.Credential.GetNetworkCredential().Password
	$headers = @{Authorization="Basic " + [Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${userName}:$password"))}
	Invoke-RestMethod -Uri $uri -Headers $headers
}
end
{
}
}