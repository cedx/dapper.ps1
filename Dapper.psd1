@{
	DefaultCommandPrefix = "Dapper"
	ModuleVersion = "0.2.0"
	PowerShellVersion = "7.4"
	RootModule = "src/Main.psm1"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "A high performance micro-ORM supporting MariaDB, PostgreSQL, SQL Server, SQLite and more."
	GUID = "73f259d4-477b-4162-8bc7-af02221cef9c"

	AliasesToExport = @()
	CmdletsToExport = @()
	VariablesToExport = @()

	FunctionsToExport = @(
		"Invoke-Command"
		"Get-Version"
		"New-Connection"
		"Select-Command"
		"Select-First"
		"Select-FirstOrDefault"
		"Select-Reader"
		"Select-Scalar"
		"Select-Single"
		"Select-SingleOrDefault"
		"Set-TypeMap"
	)

	NestedModules = @(
		"src/Invoke-Command.psm1"
		"src/New-Connection.psm1"
		"src/Select-Command.psm1"
		"src/Select-First.psm1"
		"src/Select-FirstOrDefault.psm1"
		"src/Select-Reader.psm1"
		"src/Select-Scalar.psm1"
		"src/Select-Single.psm1"
		"src/Select-SingleOrDefault.psm1"
		"src/Set-TypeMap.psm1"
	)

	RequiredAssemblies = @(
		"bin/Dapper.dll"
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/cedx/dapper.ps1/blob/main/License.md"
			ProjectUri = "https://github.com/cedx/dapper.ps1"
			ReleaseNotes = "https://github.com/cedx/dapper.ps1/releases"
			Tags = "ado.net", "dapper", "data", "orm", "sql"
		}
	}
}
