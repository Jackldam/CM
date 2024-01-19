function Get-CMTsLastActionName {
    [CmdletBinding()]
    param (

    )
    try {
        $(Get-MECMVariable -Name:"_SMSTSLastActionName")
    }
    catch {
        throw "$($_.exception.Message)"
    }
}