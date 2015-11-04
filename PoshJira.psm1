# TODO: Define your module here.
Add-Type -Path "$psScriptRoot\JiraSession.cs", "$psScriptRoot\JiraSessionManager.cs"

$Script:JiraSessionManager = New-Object ThomyKay.Jira.JiraSessionManager

. $psScriptRoot\SharedScripts.ps1

# Common cmdlets
. $psScriptRoot\Enter-JiraSession.ps1
. $psScriptRoot\Get-JiraSession.ps1

. $psScriptRoot\Get-JiraPriority.ps1

. $psScriptRoot\Get-JiraProject.ps1
. $psScriptRoot\New-JiraProject.ps1

. $psScriptRoot\Get-JiraIssue.ps1
. $psScriptRoot\New-JiraIssue.ps1

. $psScriptRoot\Invoke-JiraItem.ps1
