function New-JiraProject
{
	[CmdletBinding(SupportsShouldProcess = $true)]
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
    $project.projectTypeKey = "business"
    $project.description = "aa"
    $project.projectTemplateKey = "com.atlassian.jira-legacy-project-templates:jira-blank-item"
    # $project.issueSecurityScheme = 10001
    $project.permissionScheme = 10000
    $project.notificationScheme = 10000
    $project.lead = "admin"
    $project.assigneeType = "PROJECT_LEAD"
    $project.avatarId = 10011
    $project.categoryId = 10001
    $project.url = "http://atlassian.com"
    $project.issueSecurityScheme = 10000
    $projectJson = ConvertTo-Json $project

	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/project"
    if ($PSCmdlet.ShouldProcess("Create project '$Name' (project key $Key)"))
    {
        $headers = GetHeaders $Session
        $headers.Add("Content-Type","application/json")
	    Invoke-RestMethod -Uri $uri -Headers $headers -Method Post -Body $projectJson
    }
}
end
{
}

}