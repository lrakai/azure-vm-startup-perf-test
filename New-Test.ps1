. .\Variables.ps1

if (Parameters['Unmanaged'] && Parameters['DiskType'] == "StandardSSD") {
    Write-Error "Standard SSDs and Unmanaged disks are not supported"
    Exit
}

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location
