# TODO: Define your module here.
Add-Type -Path "$psScriptRoot\JiraSession.cs", "$psScriptRoot\JiraSessionManager.cs"

$Script:JiraSessionManager = New-Object ThomyKay.Jira.JiraSessionManager

# Common cmdlets
. $psScriptRoot\Enter-JiraSession.ps1
. $psScriptRoot\Get-JiraSession.ps1

