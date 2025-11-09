using namespace Dapper
using namespace System.Data
using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Executes a parameterized SQL statement.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL statement to be executed.
.PARAMETER Parameters
	The parameters of the SQL statement.
.OUTPUTS
	The number of rows affected.
#>
function Invoke-NonQuery {
	[CmdletBinding()]
	[OutputType([int])]
	[SuppressMessage("PSAvoidOverwritingBuiltInCmdlets", "")]
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
