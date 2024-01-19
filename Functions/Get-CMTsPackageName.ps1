function Get-CMTsPackageName {
    [CmdletBinding()]
    param (

    )
    try {
        $(Get-MECMVariable -Name:"_SMSTSPackageName")
    }
    catch {
        throw "$($_.exception.Message)"
    }
}