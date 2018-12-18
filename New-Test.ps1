. .\Variables.ps1

if (Parameters['Unmanaged'] && Parameters['DiskType'] == "StandardSSD") {
    Write-Error "Standard SSDs and Unmanaged disks are not supported"
    Exit
}

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location

$VmCred = Get-Credential
$Vm1 = "SampleVMName"
$Rg = "SampleRgName"
$Loc = "eastus"
$Nic1 = Get-AzureRmNetworkInterface -Name "Nic1" -ResourceGroupName $Rg
$OsDisk1Name = $Vm1 + "OsDisk"
$StorageAccount = ($RgPrefix + "Storage").ToLower()
$StorageAccountType = "Standard_LRS"

# Create storage account
$StgAcct = New-AzureRmStorageAccount -ResourceGroupName $Rg -Name $StorageAccount -Type $StorageAccountType -Location $Loc

# Set up a pretty name for the VM's disk in the storage account
$OSDisk1Uri = $($StgAcct.PrimaryEndpoints.Blob.ToString() + "vhds/" + $OsDisk1Name + ".vhd").ToLower()

# Create PSVirtualMachine objects for New-AzureRmVm using
#  Windows Server 2012 R2 image from Azure marketplace on
#  unmanaged disks in a storage account
$Vm1Config = New-AzureRmVMConfig -VMName $Vm1 -VMSize Standard_B2MS | `
    Set-AzureRmVMOperatingSystem -Windows -ComputerName $Vm1 -Credential $VmCred | `
    Set-AzureRmVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-Datacenter -Version latest | `
    Add-AzureRmVMNetworkInterface -Id $Nic1.Id | `
    Set-AzureRmVMOSDisk -Name "$Vm1.vhd"-VhdUri $OSDisk1Uri -CreateOption FromImage | `
    Set-AzureRmVMBootDiagnostics -Disable

# Create the virtual machine
New-AzureRmVM -ResourceGroupName $Rg -Location $Loc -VM $Vm1Config

New-AzureRmVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" 
    -VM

New-AzureRmVMConfig -VMName