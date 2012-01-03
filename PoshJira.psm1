function Install-PoshJira
{
	Uninstall-PoshJira
	cp '~\Documents\Visual Studio 2010\Projects\PoshJira\PoshJira\' ~\Documents\WindowsPowerShell\Modules -Force -Recurse
}

function Uninstall-PoshJira
{
	rmdir ~\Documents\WindowsPowerShell\Modules\PoshJira -ErrorAction Continue -Recurse
}