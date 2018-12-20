$Parameters = @{
    # Variable Parameters (Change for each $Tests test case)
    virtualMachineName = "b2smanhdd"
    virtualMachineSize = "Standard_B2s"
    managedDisks = $true
    osDiskType = "Standard_LRS" # Standard_LRS (HDD), Premium_LRS, StandardSSD_LRS

    # Fixed Parameters (Stay the same each test run)
    location = "SouthCentralUS"
    resourceGroupName = "vm-perf-test"
    templateFile = ".\infra\arm-template.scriptExtension.json"
    templateParameterFile = ".\infra\commonParameters.json"
    bootstrapScript = "bootstrap.vlite.ps1" # For arm-template.scriptExtension.json
}

$Tests = @(
    ,@("a2unmanhdd", "Standard_A2", $false, "Standard_LRS")
    ,@("a2unmanpssd", "Standard_A2", $false, "Premium_LRS")
    ,@("a2manhdd", "Standard_A2", $true, "Standard_LRS")
    ,@("a2mansssd", "Standard_A2", $true, "StandardSSD_LRS")
    ,@("a2manpssd", "Standard_A2", $true, "Premium_LRS")
    ,@("a2v2unmanhdd", "Standard_A2_v2", $false, "Standard_LRS")
    ,@("a2v2unmanpssd", "Standard_A2_v2", $false, "Premium_LRS")
    ,@("a2v2manhdd", "Standard_A2_v2", $true, "Standard_LRS")
    ,@("a2v2mansssd", "Standard_A2_v2", $true, "StandardSSD_LRS")
    ,@("a2v2manpssd", "Standard_A2_v2", $true, "Premium_LRS")
    ,@("b2sunmanhdd", "Standard_B2s", $false, "Standard_LRS")
    ,@("b2sunmanpssd", "Standard_B2s", $false, "Premium_LRS")
    ,@("b2smanhdd", "Standard_B2s", $true, "Standard_LRS")
    ,@("b2smansssd", "Standard_B2s", $true, "StandardSSD_LRS")
    ,@("b2smanpssd", "Standard_B2s", $true, "Premium_LRS")
    ,@("b2msunmanhdd", "Standard_B2ms", $false, "Standard_LRS")
    ,@("b2msunmanpssd", "Standard_B2ms", $false, "Premium_LRS")
    ,@("b2msmanhdd", "Standard_B2ms", $true, "Standard_LRS")
    ,@("b2msmansssd", "Standard_B2ms", $true, "StandardSSD_LRS")
    ,@("b2msmanpssd", "Standard_B2ms", $true, "Premium_LRS")
    ,@("ds1v2unmanhdd", "Standard_DS1_v2", $false, "Standard_LRS")
    ,@("ds1v2unmanpssd", "Standard_DS1_v2", $false, "Premium_LRS")
    ,@("ds1v2manhdd", "Standard_DS1_v2", $true, "Standard_LRS")
    ,@("ds1v2mansssd", "Standard_DS1_v2", $true, "StandardSSD_LRS")
    ,@("ds1v2manpssd", "Standard_DS1_v2", $true, "Premium_LRS")
    ,@("f1sunmanhdd", "Standard_F1s", $false, "Standard_LRS")
    ,@("f1sunmanpssd", "Standard_F1s", $false, "Premium_LRS")
    ,@("f1smanhdd", "Standard_F1s", $true, "Standard_LRS")
    ,@("f1smansssd", "Standard_F1s", $true, "StandardSSD_LRS")
    ,@("f1smanpssd", "Standard_F1s", $true, "Premium_LRS")
)