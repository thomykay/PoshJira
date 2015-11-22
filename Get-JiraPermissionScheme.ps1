function Get-JiraPermissionScheme
{
	[CmdletBinding()]
	param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
        [string]$Name = "*",

		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/permissionscheme"
    #currently gives a 500
    $result = Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session)
	$result | Where-Object {$_.name -like $Name}
}
end
{
}
}