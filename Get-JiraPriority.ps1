﻿function Get-JiraPriority
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Priority")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/priority/"
    #why does it only work with the intermediate result?
    $result = Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session)
	$result `
        | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.Priority")
                $_
            }

}
end
{
}
}