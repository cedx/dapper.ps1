using namespace Dapper
using namespace System.Data
using module ./Mapping/ConvertFrom-Dictionary.psm1

<#
.SYNOPSIS
	Executes a parameterized SQL query and returns a sequence of objects whose properties correspond to the columns.
.PARAMETER Connection
	The connection to the data source.
.PARAMETER Command
	The SQL query to be executed.
.PARAMETER Parameters
	The parameters of the SQL query.
.PARAMETER SplitOn
	The field we should split and read the second object from.
.PARAMETER Map
	The function to map row types to the return type.
.PARAMETER AsHashtable
	Value indicating whether to convert the rows to a hash table.
.OUTPUTS
	[hashtable[]] The sequence of hash tables whose keys correspond to the returned columns.
.OUTPUTS
	[psobject[]] The sequence of custom objects whose properties correspond to the returned columns.
#>
function Invoke-Query {
	[CmdletBinding(DefaultParameterSetName = "Default")]
	[OutputType([hashtable[]], [psobject[]])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[IDbConnection] $Connection,

		[Parameter(Mandatory, Position = 1)]
		[string] $Command,

		[Parameter(Position = 2)]
		[ValidateNotNull()]
		[hashtable] $Parameters = @{},

		[Parameter(ParameterSetName = "SplitOn")]
		[string[]] $SplitOn = @("Id"),

		[Parameter(Mandatory, ParameterSetName = "SplitOn")]
		[scriptblock] $Map,

		[Parameter()]
		[switch] $AsHashtable
	)

	$dynamicParameters = [DynamicParameters]::new()
	foreach ($key in $Parameters.Keys) { $dynamicParameters.Add($key, $Parameters.$key) }

	if ($PSCmdlet.ParameterSetName -eq "SplitOn") { $records = [SqlMapper]::Query($Connection, $Command, $Map, $dynamicParameters, $null, $true, $SplitOn -join ", ") }
	else { $records = [SqlMapper]::Query($Connection, $Command, $dynamicParameters) }
	$records.ForEach{ ConvertFrom-Dictionary $_ -AsHashtable:$AsHashtable }
}
