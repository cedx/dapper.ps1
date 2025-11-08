using namespace Dapper
using namespace System.Reflection

<#
.SYNOPSIS
	Returns the version number of the Dapper assembly.
.OUTPUTS
	The version number of the Dapper assembly.
#>
function Get-Version {
	[OutputType([version])] param ()
	$assembly = [Assembly]::GetAssembly([SqlMapper])
	[CustomAttributeExtensions]::GetCustomAttribute[AssemblyFileVersionAttribute]($assembly).Version
}
