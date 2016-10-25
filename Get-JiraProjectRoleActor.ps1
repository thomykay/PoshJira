function Get-JiraProjectRoleActor
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.ProjectRole")]
	param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [ValidateNotNull()]
        $Project,

		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/project/$($Project.key)/role"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session)
}
end
{
}
}