function Get-JiraSession
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$false)]
		[switch]$Current
	)
process {
	if ($Current.IsPresent)
		{
			$JiraSessionManager.CurrentSession
		}
		else
		{
			$JiraSessionManager.Sessions
		}
}	
}