using namespace Dapper
using namespace System.Data
using module ./Mapping/ConvertFrom-Record.psm1

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns the first row.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.OUTPUTS
	The first row.
	If not found: throws an error if `-ErrorAction` is set to `Stop`, otherwise returns `$null`.
#>
function Get-First {
	[CmdletBinding()]
	[OutputType([psobject])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[IDbConnection] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[Parameter(Position = 2)]
		[ValidateNotNull()]
		[hashtable] $Parameters = @{}
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }

	if ($ErrorActionPreference -eq "Stop") { $record = [SqlMapper]::QueryFirst($Connection, $Command, $dynamicParameters) }
	else { $record = [SqlMapper]::QueryFirstOrDefault($Connection, $Command, $dynamicParameters) }
	$record ? (ConvertFrom-Record $record) : $null
}
