using namespace Dapper
using namespace System.Data
using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns a sequence of objects whose properties correspond to the columns.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.OUTPUTS
	The sequence of objects whose properties correspond to the returned columns.
#>
function Invoke-Query {
	[CmdletBinding()]
	[OutputType([psobject[]])]
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

	$records = [SqlMapper]::Query($Connection, $Command, $dynamicParameters)
	foreach ($record in $records) {
		$properties = @{}
		foreach ($keyValue in $record) { $properties[$keyValue.Key] = $keyValue.Value }
		[PSCustomObject] $properties
	}
}
