function Get-JiraProject
{
	[CmdletBinding()]
    [OutputType("ThomyKay.Jira.Project")]
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
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/project/"
	$result = Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session )
    $result | % {
            $_.PSObject.TypeNames.Add("ThomyKay.Jira.Project")
            $_
          } | Where-Object {$_.Name -like $Name}
}
end
{
}
}