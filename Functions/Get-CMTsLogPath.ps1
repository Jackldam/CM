function Get-CMTsLogPath {
    [CmdletBinding()]
    param (

    )
    try {
        $(Get-MECMVariable -Name:"_SMSTSLogPath")
    }
    catch {
        throw "$($_.exception.Message)"
    }
}