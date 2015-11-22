function Get-JiraDashboard
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Dashboard")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/dashboard"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_.dashboards} `
        | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.Dashboard")
                $_
            }
}
end
{
}
}