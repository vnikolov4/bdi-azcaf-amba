# go to the root of the AMBA Repo and execute the following:
$location = "Your Azure location of choice"
$pseudoRootManagementGroup = "The pseudo root management group id parenting the Platform and Landing Zones management groups"
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/Azure/azure-monitor-baseline-alerts/2024-09-02/patterns/alz/alzArm.json" -TemplateParameterFile ".\patterns\alz\alzArm.param.json"
