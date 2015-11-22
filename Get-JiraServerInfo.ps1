function Get-JiraServerInfo
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.ServerInfo")]
	param (
		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/serverInfo/"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.ServerInfo")
                $_
            }
}
end
{
}
}