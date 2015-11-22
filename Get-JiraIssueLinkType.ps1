function Get-JiraIssueLinkType
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.IssueLinkType")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/issueLinkType"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
	    | % {$_.issueLinkTypes} `
        | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.IssueLinkType")
                $url = (Get-JiraServerInfo).BaseUrl + "/secure/admin/EditLinkType!default.jspa?id=" + $_.ID
                Add-Member -InputObject $_ -NotePropertyName view -NotePropertyValue $url
                $_
            }
}
end
{
}
}