function New-JiraProjectRole
{
	[CmdletBinding(SupportsShouldProcess = $true)]
	param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [string]$Name,

        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, Position = 1)]
        [string]$Description,

		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
    $projectCategory = @{}
    $projectCategory.name = $Name
    if ($Description) {$projectCategory.description = $Description}
    $projectCategoryJson = ConvertTo-Json $projectCategory

	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/role"
    if ($PSCmdlet.ShouldProcess("Create project category '$Name'"))
    {
        $headers = GetHeaders $Session
	    Invoke-WebRequest -Uri $uri -Method Post -headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($projectCategoryJson)) -ContentType "application/json; charset=utf-8"
    }
}
end
{
}

}