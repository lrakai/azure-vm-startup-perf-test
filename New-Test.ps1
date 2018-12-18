function New-Test {
    param (
        $Parameters
    )

    if (-Not (Parameters['managedDisks']) -And (Parameters['DiskType'] -eq "StandardSSD_LRS")) {
        Write-Error "Standard SSDs and Unmanaged disks are not supported in Azure"
        Exit
    }
    
    #Create or check for existing resource group
    $resourceGroup = Get-AzureRmResourceGroup -Name $Parameters['resourceGroupName'] -ErrorAction SilentlyContinue
    if (!$resourceGroup) {
        Write-Host "Creating resource group '$resourceGroupName' in location " $Parameters['location'];
        New-AzureRmResourceGroup -Name $resourceGroupName -Location $Parameters['location']
    }
    else {
        Write-Host "Using existing resource group '$resourceGroupName'";
    }

    New-AzureRmResourceGroupDeployment `
        -ResourceGroupName $Parameters['resourceGroupName'] `
        -TemplateFile .\infra\arm-template.json `
        -TemplateParameterFile .\infra\commonParameters.json `
        -TemplateParameterObject $Parameters
}