using namespace Dapper
using namespace System.Collections.Generic

<#
.SYNOPSIS
	Converts the specified data record to a custom object.
.PARAMETER InputObject
	The data record to be converted.
.INPUTS InputObject
	The data record to be converted.
.OUTPUTS
	The custom object corresponding to the specified data record.
#>
function ConvertFrom-Record {
	[OutputType([psobject])]
	param (
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[IDictionary[string, object]] $InputObject
	)

	process {
		$properties = @{}
		foreach ($keyValue in $InputObject) { $properties[$keyValue.Key] = $keyValue.Value }
		[PSCustomObject] $properties
	}
}
