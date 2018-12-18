$ErrorActionPreference = "Stop"

. .\Parameters.ps1
. .\New-Test.ps1

function Set-Parameters {
    param (
        $Parameters,
        $TestParams
    )
    $Parameters['virtualMachineName'] = $TestParams[0]
    $Parameters['virtualMachineSize'] = $TestParams[1]
    $Parameters['managedDisks'] = $TestParams[2]
    $Parameters['diskType'] = $TestParams[3]
}

$Tests = @(
    ,@("b2sunmanhdd", "Standard_B2s", $false, "Standard_LRS")
    ,@("b2sunmanpssd", "Standard_B2s", $false, "Premium_LRS")
    ,@("b2smanhdd", "Standard_B2s", $true, "Standard_LRS")
    ,@("b2smansssd", "Standard_B2s", $true, "StandardSSD_LRS")
    ,@("b2smanpssd", "Standard_B2s", $true, "Premium_LRS")
)

foreach ($test in $tests) {
    Set-Parameters $Parameters $test
    Write-Host "Running " $Parameters['virtualMachineName']
    New-Test $Parameters
}