using namespace Dapper
using namespace System.Diagnostics.CodeAnalysis

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
	[SuppressMessage("PSUseShouldProcessForStateChangingFunctions", "")]
	param (
		[Parameter(Mandatory, Position = 0)]
		[object] $Type,

		[Parameter(Mandatory, Position = 1)]
		[AllowNull()]
		[ITypeMap] $Map
	)

	[SqlMapper]::SetTypeMap($Type -is [type] ? $Type : [type]::GetType($Type), $Map)
}
