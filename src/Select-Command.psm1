using namespace System.Data

<#
.SYNOPSIS
	TODO
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.PARAMETER AsArray
	Value indicating whether to convert the resulting collection to an array.
.OUTPUTS
	[System.Collections.Generic.IEnumerable[object]] TODO
.OUTPUTS
	[object[]] TODO
#>
function Select-Command {
	[CmdletBinding()]
	[OutputType([object])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[IDbConnection] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

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
