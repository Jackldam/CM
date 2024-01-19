function Get-CMTsMachineName {
    [CmdletBinding()]
    param (

    )
    try {
        $(Get-MECMVariable -Name:"_SMSTSMachineName")
    }
    catch {
        throw "$($_.exception.Message)"

    }
}