function New-JiraIssue
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]$ProjectKey,
		
		[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Summary,
		
		[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
		[string]$Description,
		
		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
	)
begin
{
}
process
{
	[Uri]$uri = (GetRestEndpoint $Session).OriginalString + "/issue/"
    $issue = @{
            fields = @{
                project = @{
                    key = $ProjectKey
                };
                summary = $Summary;
                description = $Description;
                issuetype = @{
                    name="Bug"
                }
            }           
        } | ConvertTo-Json
    
	Invoke-RestMethod -Uri $uri -Headers (GetHeaders $Session ) -Method Post -Body $issue -ContentType "application/json"
}
end
{
}
}