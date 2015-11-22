function Get-JiraStatusCategory
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.StatusCategory")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/statuscategory"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_} `
	    | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.StatusCategory")
                $_
            }
}
end
{
}
}