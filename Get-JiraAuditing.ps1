function Get-JiraAuditing
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/auditing/record"
	$records = Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session )
    $records.records
}
end
{
}
}