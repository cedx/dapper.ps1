using namespace Dapper
using namespace System.Reflection

<#
.SYNOPSIS
	Returns the file version of the Dapper assembly.
.OUTPUTS
	The file version of the Dapper assembly.
#>
function Get-Version {
	[CmdletBinding()]
	[OutputType([version])] param ()

	$assembly = [Assembly]::GetAssembly([SqlMapper])
	$fileVersion = [CustomAttributeExtensions]::GetCustomAttribute[AssemblyFileVersionAttribute]($assembly)
	[version] $fileVersion.Version
}
