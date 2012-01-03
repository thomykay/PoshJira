#
# Script.ps1
#

function GetRestEndpoint([ThomyKay.Jira.JiraSession]$Session)
{
	return [Uri]($Session.ConnectionUri.OriginalString + "/rest/api/latest")
}