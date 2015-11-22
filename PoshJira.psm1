# TODO: Define your module here.
# https://docs.atlassian.com/jira/REST/latest/
Add-Type -Path "$psScriptRoot\JiraSession.cs", "$psScriptRoot\JiraSessionManager.cs"

$Script:JiraSessionManager = New-Object ThomyKay.Jira.JiraSessionManager

. $psScriptRoot\SharedScripts.ps1

# Common cmdlets
. $psScriptRoot\Get-JiraServerInfo.ps1


. $psScriptRoot\Enter-JiraSession.ps1
. $psScriptRoot\Get-JiraSession.ps1

. $psScriptRoot\Get-JiraDashboard.ps1
. $psScriptRoot\Get-JiraConfiguration.ps1

. $psScriptRoot\Get-JiraField.ps1

. $psScriptRoot\Get-JiraIssueLinkType.ps1

. $psScriptRoot\Get-JiraNotificationScheme.ps1
. $psScriptRoot\Get-JiraPermissionScheme.ps1

. $psScriptRoot\Get-JiraProjectCategory.ps1
. $psScriptRoot\Get-JiraProjectType.ps1

. $psScriptRoot\Get-JiraRole.ps1

. $psScriptRoot\Get-JiraStatus.ps1
. $psScriptRoot\Get-JiraStatusCategory.ps1

. $psScriptRoot\Get-JiraWorkflow.ps1

. $psScriptRoot\Get-JiraFilter.ps1

. $psScriptRoot\Get-JiraPriority.ps1
. $psScriptRoot\Get-JiraResolution.ps1

. $psScriptRoot\Get-JiraProject.ps1
. $psScriptRoot\New-JiraProject.ps1

. $psScriptRoot\Get-JiraIssue.ps1
. $psScriptRoot\New-JiraIssue.ps1

. $psScriptRoot\Invoke-JiraItem.ps1
