function New-JiraProject
{
	[CmdletBinding()]
	param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [string]$Key,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
        [string]$Name,

		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
    $project = @{}
    $project.key = $Key
    $project.name = $Name
    $project.description = ""
    $project.projectTemplateKey = "com.atlassian.jira-legacy-project-templates:jira-blank-item";
    $projectJson = ConvertTo-Json $project

	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/project"
	Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session ) -Method Post -Body $projectJson
}
end
{
}

}