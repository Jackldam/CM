function Set-CMTsVariable {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Name,
        [Parameter(Mandatory)]
        [string]
        $Value
    )
    try {
        $(New-Object -ComObject:"Microsoft.SMS.TSEnvironment" -ErrorAction:Stop).Value("$Name") = $Value
        $GetValue = $(New-Object -ComObject:"Microsoft.SMS.TSEnvironment" -ErrorAction:Stop).Value("$Name")
        if ($GetValue -eq $Value){

        }
        else{
            throw "Value wasn't set properly"
        }
    }
    catch {
        throw "$($_.exception.Message)"
    }
    
}