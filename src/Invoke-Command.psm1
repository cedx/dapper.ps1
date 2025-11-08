using namespace Dapper
using namespace System.Data

<#
.SYNOPSIS
	Executes a parameterized SQL query.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.OUTPUTS
	The number of rows affected.
#>
function Invoke-Command {
	[CmdletBinding()]
	[OutputType([int])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[ValidateScript({ $_ -is [IDbConnection] })]
		[object] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[Parameter(Position = 2)]
		[ValidateNotNull()]
		[hashtable] $Parameters = @{}
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }
	[SqlMapper]::Execute($Connection, $Command, $dynamicParameters)
}
