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
	Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session )
}
end
{
}
}