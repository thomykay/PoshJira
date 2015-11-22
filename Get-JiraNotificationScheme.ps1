function Get-JiraNotificationScheme
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.NotificationScheme")]
	param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
        [string]$Name = "*",

		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/notificationscheme/"

    Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session) `
        | %{$_.values} `
	    | Where-Object {$_.name -like $Name} `
        | % {
                $_.PSObject.TypeNames.Add("ThomyKay.Jira.NotificationScheme")
                $_
            }
}
end
{
}
}