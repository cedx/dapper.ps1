<#
.SYNOPSIS
	Creates a new database connection.
.PARAMETER Type
	The type of connection class to instantiate.
.PARAMETER ConnectionString
	The connection string used to open the database.
.PARAMETER Open
	Value indicating whether to open the connection.
.INPUTS
	The connection string used to open the database.
.OUTPUTS
	The newly created connection.
#>
function New-Connection {
	[CmdletBinding()]
	[OutputType([object])]
	param (
		[Parameter(Mandatory, Position = 0)]
		[object] $Type,

		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[string] $ConnectionString,

		[Parameter()]
		[switch] $Open
	)

	process {
		$connection = New-Object ($Type -is [type] ? $Type.FullName : $Type) $ConnectionString
		if ($Open) { $connection.Open() }
		$connection
	}
}
