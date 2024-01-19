function Get-CMTsVariable {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $Name,
        # Parameter help description
        [Parameter()]
        [switch]
        $List
    )
    try {
        if (!([bool]$List)) {
            Write-Verbose "$([bool]$List)"
            $(New-Object -ComObject:"Microsoft.SMS.TSEnvironment" -ErrorAction:Stop).Value("$Name")
        }
        else {
            $(New-Object -ComObject:"Microsoft.SMS.TSEnvironment" -ErrorAction:Stop).GetVariables() | ForEach-Object {
                [pscustomobject]@{
                    Name  = $($_)
                    Value = $(New-Object -ComObject:"Microsoft.SMS.TSEnvironment"-ErrorAction:Stop ).Value("$_")
                }
                
            }
        }
    }
    catch {
        throw "$($_.exception.Message)"
    }
}