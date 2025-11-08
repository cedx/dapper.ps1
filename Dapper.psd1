@{
	DefaultCommandPrefix = "Dapper"
	ModuleVersion = "0.1.0"
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
		"ConvertFrom-Reader"
		"ConvertFrom-Record"
		"Get-Version"
	)

	NestedModules = @(
		"src/ConvertFrom-Reader.psm1"
		"src/ConvertFrom-Record.psm1"
	)

	RequiredAssemblies = @(
		"bin/Dapper.dll"
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/cedx/dapper.ps1/blob/main/License.md"
			ProjectUri = "https://github.com/cedx/dapper.ps1"
			ReleaseNotes = "https://github.com/cedx/dapper.ps1/releases"
			Tags = "ado.net", "dapper", "orm", "sql"
		}
	}
}
