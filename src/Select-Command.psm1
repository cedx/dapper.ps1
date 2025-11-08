using namespace Dapper
using namespace System.Data

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns a sequence of objects whose properties correspond to the columns.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.PARAMETER AsArray
	Value indicating whether to convert the resulting collection to an array.
.OUTPUTS
	[System.Collections.Generic.IEnumerable[object]] The sequence of objects whose properties correspond to the returned columns.
.OUTPUTS
	[object[]] The array of objects whose properties correspond to the returned columns.
#>
function Select-Command {
	[CmdletBinding()]
	[OutputType([object])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[ValidateScript({ $_ -is [IDbConnection] })]
		[object] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[Parameter(Position = 2)]
		[ValidateNotNull()]
		[hashtable] $Parameters = @{},

		[Parameter()]
		[switch] $AsArray
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }
	$rows = [SqlMapper]::Query($Connection, $Command, $dynamicParameters)
	$AsArray ? $rows.ToArray() : $rows
}
