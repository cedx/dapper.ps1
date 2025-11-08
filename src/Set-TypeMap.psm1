using namespace Dapper

<#
.SYNOPSIS
	Sets a custom mapping for a type deserializer.
.PARAMETER Type
	The entity type to override.
.PARAMETER Map
	The mapping rules implementation, or `$null` to remove the custom mapping.
#>
function Set-TypeMap {
	[CmdletBinding()]
	[OutputType([void])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[type] $Type,

		[Parameter(Mandatory, Position = 1)]
		[AllowNull()]
		[ITypeMap] $Map
	)

	[SqlMapper]::SetTypeMap($Type, $Map)
}
