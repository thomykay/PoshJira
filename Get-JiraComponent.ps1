function Get-JiraComponent
{
    [CmdletBinding()]
    param (
		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[ThomyKay.Jira.JiraSession]$Session = (Get-JiraSession -Current)
    )
begin
{
}
process
{
}
end
{
}    
}