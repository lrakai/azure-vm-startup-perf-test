function New-Test {
    param (
        [Parameter(Mandatory = $true)]
        $Parameters
    )

    if (-Not ($Parameters['managedDisks']) -And ($Parameters['diskType'] -eq "StandardSSD_LRS")) {
        Write-Error "Standard SSDs and Unmanaged disks are not supported in Azure"
        Exit
    }
    
    #Create or check for existing resource group
    $resourceGroup = Get-AzureRmResourceGroup -Name $Parameters['resourceGroupName'] -ErrorAction SilentlyContinue
    if (!$resourceGroup) {
        Write-Host "Creating resource group "$Parameters['resourceGroupName']" in location "$Parameters['location'];
        New-AzureRmResourceGroup -Name $Parameters['resourceGroupName'] -Location $Parameters['location']
    }
    else {
        Write-Host "Using existing resource group " $Parameters['resourceGroupName'];
    }

    $deploymentParameters = @{
        Name                  = $Parameters['virtualMachineName']
        ResourceGroupName     = $Parameters['resourceGroupName']
        TemplateFile          = $Parameters['templateFile']
        TemplateParameterFile = $Parameters['templateParameterFile']
        virtualMachineName    = $Parameters['virtualMachineName']
        managedDisks          = $Parameters['managedDisks']
        osDiskType            = $Parameters['osDiskType']
        virtualMachineSize    = $Parameters['virtualMachineSize']
        AsJob                 = $true
    }

    if ($Parameters['bootstrapScript']) {

        $deploymentParameters['bootstrapScript'] = $Parameters['bootstrapScript']
    }

    New-AzureRmResourceGroupDeployment @deploymentParameters
}