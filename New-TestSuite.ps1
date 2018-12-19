$ErrorActionPreference = "Stop"

. .\Parameters.ps1
. .\New-Test.ps1
. .\Write-TestResult.ps1
. .\Remove-Test.ps1

function Get-ResourceGroupName {
    param (
        $TestParams
    )
    "vm-perf-test-" + $TestParams[0]
}

function Set-Parameters {
    param (
        $Parameters,
        $TestParams
    )
    $Parameters['virtualMachineName'] = $TestParams[0]
    $Parameters['resourceGroupName'] = Get-ResourceGroupName $TestParams
    $Parameters['virtualMachineSize'] = $TestParams[1]
    $Parameters['managedDisks'] = $TestParams[2]
    $Parameters['diskType'] = $TestParams[3]
}

foreach ($test in $tests) {
    Set-Parameters $Parameters $test
    Write-Host "Running " $Parameters['resourceGroupName']
    New-Test $Parameters
}

# Wait until all tests complete
Get-Job | Wait-Job | Remove-Job

Write-Host "Analyzing test results (in seconds) in CSV format"
foreach ($test in $tests) {
    Set-Parameters $Parameters $test
    Write-TestResult $Parameters
}

Write-Host "Removing resources"
foreach ($test in $tests) {
    Set-Parameters $Parameters $test
    Remove-Test $Parameters
}

# Wait until all removals are complete
Get-Job | Wait-Job | Remove-Job