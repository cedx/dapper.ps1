using namespace Dapper
using namespace System.Data

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns the single row.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.OUTPUTS
	The single row.
	If not found: throws an error if `-ErrorAction` is set to `Stop`, otherwise returns `$null`.
#>
function Get-Single {
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
		[hashtable] $Parameters = @{}
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }

	if ($ErrorActionPreference -eq "Stop") { [SqlMapper]::QuerySingle($Connection, $Command, $dynamicParameters) }
	else { [SqlMapper]::QuerySingleOrDefault($Connection, $Command, $dynamicParameters) }
}
