function Get-CMTsDeploymentType {
    <#
.SYNOPSIS
    Check if SMSTSDeploymentType is either BC, DEV or PRD
.DESCRIPTION
    This script is to check wether a TSDeployment is one of the following type's
        1. Build and capture Deployment = BC
        2. Development Deployment = DEV
        3. Production Deployment = PRD

    The check is done by checking the last part of the TSDeployment Name
    
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
    [CmdletBinding()]
    param (
    )
    try {
        switch ($(Get-MECMPackageName)) {
            { $_ -like '*_BC' } {
                #If in the name BC is found output BC to indicate Build and Capture Run
                $Answer = "BC"
            }
            { $_ -like '*_DEV' } {
                #If in the name DEV is found output DEV to indicate Development Run
                $Answer = "DEV"
            }
            { $_ -like '*_PRD' } {
                #If in the name PRD  is found output PRD to indicate Production Run
                $Answer = "PRD"
            }
            Default {
                #Default if no TS name found with an ending like PRD, DEV or BD
                #in the name PRD  is found output PRD to indicate Production Run
                $Answer = "PRD"
            }
        }
        #Return the annswer
        return $Answer

    }
    catch {
        throw "$($_.exception.Message)"
    }
}