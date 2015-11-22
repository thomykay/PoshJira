function Get-JiraStatus
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Status")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/status"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
	    | %{$_} `
        | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.Status")
                $_
            }
#TODO: Add StatusCategory to properties
#TODO: Make view working again
}
end
{
}
}