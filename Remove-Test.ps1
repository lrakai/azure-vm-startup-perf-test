function Remove-Test {
    param (
        [Parameter(Mandatory = $true)]
        $Parameters
    )

    Remove-AzureRmResourceGroup `
        -Name $Parameters['resourceGroupName'] `
        -Force `
        -AsJob
}