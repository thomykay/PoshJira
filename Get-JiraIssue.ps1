function Get-JiraIssue
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/issue/"
	Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session )
}
end
{
}
}