$Parameters = @{
    virtualMachineName = "b2sunmanhdd"
    virtualMachineSize = "Standard_B2s"
    managedDisks = $true
    osDiskType = "Standard_LRS" # Standard_LRS (HDD), Premium_LRS, StandardSSD_LRS

    location = "SouthCentralUS"
    resourceGroupName = "vm-perf-test"
}
