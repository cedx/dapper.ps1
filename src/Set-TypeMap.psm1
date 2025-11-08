using namespace Dapper

<#
.SYNOPSIS
	TODO
.PARAMETER Type
	TODO
.PARAMETER Map
	TODO
#>
function Set-TypeMap {
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
