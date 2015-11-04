function Enter-JiraSession
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Uri]$ConnectionUri,
		
		[Parameter(Mandatory = $true, Position = 1)]
		[Management.Automation.Credential()]
		[Management.Automation.PSCredential]$Credential
	)
	
process {
	[Uri]$soapUri = $ConnectionUri.AbsoluteUri.TrimEnd('/') + "/rpc/soap/jirasoapservice-v2?wsdl"
	$proxy = New-WebServiceProxy -Uri $soapUri -Credential $Credential -Namespace ThomyKay.Jira -Class JiraProxy
	$token = $proxy.login($Credential.GetNetworkCredential().UserName, $Credential.GetNetworkCredential().Password)

	$session = New-Object ThomyKay.Jira.JiraSession -property @{
		Token = $token;
		Proxy = $proxy;
		Credential = $Credential;
		ConnectionUri = $ConnectionUri
	}
	
	$JiraSessionManager.Enter($session)
	
}
	
}