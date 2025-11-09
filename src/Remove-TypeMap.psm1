using namespace Dapper
using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Removes a custom mapping for a type deserializer.
.PARAMETER Type
	The entity type that was overridden.
#>
function Remove-TypeMap {
	[CmdletBinding()]
	[OutputType([void])]
	[SuppressMessage("PSUseShouldProcessForStateChangingFunctions", "")]
	param (
		[Parameter(Mandatory, Position = 0)]
		[object] $Type
	)

	[SqlMapper]::SetTypeMap($Type -is [type] ? $Type : [type]::GetType($Type), $null)
}
