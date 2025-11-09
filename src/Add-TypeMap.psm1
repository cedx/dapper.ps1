using namespace Dapper

<#
.SYNOPSIS
	Adds a custom mapping for a type deserializer.
.PARAMETER Type
	The entity type to override.
.PARAMETER Map
	The mapping rules implementation.
#>
function Add-TypeMap {
	[CmdletBinding()]
	[OutputType([void])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[type] $Type,

		[Parameter(Mandatory, Position = 1)]
		[ITypeMap] $Map
	)

	[SqlMapper]::SetTypeMap($Type, $Map)
}
