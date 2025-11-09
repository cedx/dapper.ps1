using namespace Dapper
using namespace System.Data
using module ./ConvertFrom-Dictionary.psm1

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns the single row.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.PARAMETER AsHashtable
	Value indicating whether to convert the row to a hash table.
.OUTPUTS
	[hashtable] The single row as a hash table. If not found: throws an error if `-ErrorAction` is set to `Stop`, otherwise returns `$null`.
.OUTPUTS
	[psobject] The single row as a custom object. If not found: throws an error if `-ErrorAction` is set to `Stop`, otherwise returns `$null`.
#>
function Get-Single {
	[CmdletBinding()]
	[OutputType([hashtable], [psobject])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[IDbConnection] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[Parameter(Position = 2)]
		[ValidateNotNull()]
		[hashtable] $Parameters = @{},

		[Parameter()]
		[switch] $AsHashtable
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }

	if ($ErrorActionPreference -eq "Stop") { $record = [SqlMapper]::QuerySingle($Connection, $Command, $dynamicParameters) }
	else { $record = [SqlMapper]::QuerySingleOrDefault($Connection, $Command, $dynamicParameters) }
	$record ? (ConvertFrom-Dictionary $record -AsHashtable:$AsHashtable) : $null
}
