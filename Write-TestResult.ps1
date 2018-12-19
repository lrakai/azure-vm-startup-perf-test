function Write-TestResult {
    param (
        [Parameter(Mandatory = $true)]
        $Parameters
    )

    $deploymentState = (Get-AzureRmResourceGroupDeployment `
        -Name $Parameters['virtualMachineName'] `
        -ResourceGroupName $Parameters['resourceGroupName'] `
    ).ProvisioningState

    if ($deploymentState -ne "Succeeded") {
        Write-Host "$($Parameters['virtualMachineName']) state is $($deploymentState)"
        return
    }

    $operations = Get-AzureRmResourceGroupDeploymentOperation `
        -Name $Parameters['virtualMachineName'] `
        -ResourceGroupName $Parameters['resourceGroupName'] `
        | ForEach-Object { $_ `
            | Add-Member `
                -NotePropertyName StartTime `
                -NotePropertyValue (([DateTime]$_.Properties.timestamp).Add( - [Xml.XmlConvert]::ToTimeSpan($_.properties.duration))) `
                -PassThru `
            | Add-Member `
                -NotePropertyName EndTime `
                -NotePropertyValue (([DateTime]$_.Properties.timestamp)) `
                -PassThru `
        }

    $startTime = ($operations `
        | Sort-Object -Property StartTime `
        | Select-Object -First 1).StartTime
    
    $endTime = [DateTime]($operations `
        | Sort-Object -Property EndTime `
        | Select-Object -Last 1).EndTime
    
    $deploymentDuration = $endTime - $startTime

    $vmDuration = [Xml.XmlConvert]::ToTimeSpan(($operations `
        | Where-Object { $_.properties.targetResource.resourceName -eq $Parameters['virtualMachineName']} `
        ).properties.duration)

    Write-Host "$($Parameters['virtualMachineName'])," `
        "$([math]::Round($deploymentDuration.TotalSeconds,1))," `
        "$([math]::Round($vmDuration.TotalSeconds,1))"
}