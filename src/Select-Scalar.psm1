using namespace Dapper
using namespace System.Data

<#
.SYNOPSIS
	Executes a parameterized SQL query that selects a single value.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.OUTPUTS
	The value of the first field returned.
#>
function Select-Scalar {
	[CmdletBinding()]
	[OutputType([object])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[IDbConnection] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[ValidateNotNull()]
		[hashtable] $Parameters = @{}
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }
	[SqlMapper]::ExecuteScalar($Connection, $Command, $dynamicParameters)
}
