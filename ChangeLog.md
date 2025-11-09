# Changelog

## Version [0.3.0](https://github.com/cedx/dapper.ps1/compare/v0.2.0...v0.3.0)
- Breaking change: renamed the `Invoke-Command` cmdlet to `Invoke-NonQuery`.
- Breaking change: renamed the `Select-First` cmdlet to `Get-First`.
- Breaking change: renamed the `Select-Multiple` cmdlet to `Invoke-MultipleQuery`.
- Breaking change: renamed the `Select-Object` cmdlet to `Invoke-Query`.
- Breaking change: renamed the `Select-Reader` cmdlet to `Invoke-Reader`.
- Breaking change: renamed the `Select-Scalar` cmdlet to `Get-Scalar`.
- Breaking change: renamed the `Select-Single` cmdlet to `Get-Single`.
- Breaking change: renamed the `Set-TypeMap` cmdlet to `Add-TypeMap`.
- Added the `Close-Connection` and `Remove-TypeMap` cmdlets.
- Fixed the type of the objects returned from the query cmdlets.

## Version [0.2.0](https://github.com/cedx/dapper.ps1/compare/v0.1.0...v0.2.0)
- Breaking change: removed the `ConvertFrom-Reader` and `ConvertFrom-Record` functions.
- Breaking change: removed the `Select-FirstOrDefault` and `Select-SingleOrDefault` functions.
- Breaking change: renamed the `Select-Command` cmdlet to `Select-Object`.
- Added the `Select-Multiple` and `Set-TypeMap` cmdlets.
- Fixed the `Unable to find type [IDbConnection]` error.

## Version 0.1.0
- Initial release.
