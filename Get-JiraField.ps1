function Get-JiraField
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Field")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/field"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_} `
        | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.Field")
                $_
            }
}
end
{
}
}