function Get-JiraResolution
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Resolution")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/resolution"
    #why does it only work with the intermediate result?
    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_} `
	    | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.Resolution")
                $_
            }
}
end
{
}
}