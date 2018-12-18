. .\Variables.ps1

if (-Not (Parameters['managedDisks']) -And (Parameters['DiskType'] -eq "StandardSSD_LRS") {
    Write-Error "Standard SSDs and Unmanaged disks are not supported in Azure"
    Exit
}

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
