$Parameters = @{
    # Variable Parameters (Change for each $Tests test case)
    virtualMachineName = "b2smanhdd"
    virtualMachineSize = "Standard_B2s"
    managedDisks = $true
    osDiskType = "Standard_LRS" # Standard_LRS (HDD), Premium_LRS, StandardSSD_LRS

    # Fixed Parameters (Stay the same each test run)
    location = "SouthCentralUS"
    resourceGroupName = "vm-perf-test"
}

$Tests = @(
    ,@("b2sunmanhdd", "Standard_B2s", $false, "Standard_LRS")
    ,@("b2sunmanpssd", "Standard_B2s", $false, "Premium_LRS")
    ,@("b2smanhdd", "Standard_B2s", $true, "Standard_LRS")
    ,@("b2smansssd", "Standard_B2s", $true, "StandardSSD_LRS")
    ,@("b2smanpssd", "Standard_B2s", $true, "Premium_LRS")
)