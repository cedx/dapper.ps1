using namespace Dapper

<#
.SYNOPSIS
	Removes a custom mapping for a type deserializer.
.PARAMETER Type
	The entity type that was overridden.
#>
function Remove-TypeMap {
	[CmdletBinding()]
	[OutputType([void])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[object] $Type
	)

	[SqlMapper]::SetTypeMap($Type -is [type] ? $Type : [type]::GetType($Type), $null)
}
