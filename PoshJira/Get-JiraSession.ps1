function Get-JiraSession
{
	[CmdletBinding()]
	param (
	)
process {
	$JiraSessionManager.Sessions
}	
}