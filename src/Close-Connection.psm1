using namespace System.Data

<#
.SYNOPSIS
	Closes the specified database connection.
.PARAMETER Connection
	The connection to the data source.
.INPUTS
	The connection to the data source.
#>
function Close-Connection {
	[CmdletBinding()]
	[OutputType([void])]
	param (
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[IDbConnection] $Connection
	)

	process {
		$connection.Close()
	}
}
