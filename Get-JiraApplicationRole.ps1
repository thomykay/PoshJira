﻿function Get-JiraApplicationRole
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.ApplicationRole")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/applicationrole"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_} `
	    | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.ApplicationRole")
                $_
            }

}
end
{
}
}