using namespace Dapper
using namespace System.Collections.Generic

<#
.SYNOPSIS
	Converts the specified dictionary to a custom object.
.PARAMETER InputObject
	The dictionary to be converted.
.PARAMETER AsHashtable
	Value indicating whether to convert the dictionary to a hash table.
.INPUTS
	The dictionary to be converted.
.OUTPUTS
	[hashtable] The hash table corresponding to the specified dictionary.
.OUTPUTS
	[psobject] The custom object corresponding to the specified dictionary.
#>
function ConvertFrom-Dictionary {
	[OutputType([hashtable], [psobject])]
	param (
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[IDictionary[string, object]] $InputObject,

		[Parameter()]
		[switch] $AsHashtable
	)

	process {
		$properties = @{}
		foreach ($keyValue in $InputObject) { $properties[$keyValue.Key] = $keyValue.Value }
		$AsHashtable ? $properties : [PSCustomObject] $properties
	}
}
