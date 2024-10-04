Logout-AzAccount
#Visual Studio - LAB:
Connect-AzAccount -Tenant 3da350d5-6b6c-4c4c-b9c1-6cddbb692040 -UseDeviceAuthentication

Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Get-AzContext

# go to the root of the AMBA Repo and execute the following:
$location = "westeurope"
$pseudoRootManagementGroup = "AzureCAF"
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json" -TemplateParameterFile ".\patterns\alz\alzArm.param.json"

https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json
https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/refs/heads/main/patterns/alz/alzArm.json?token=GHSAT0AAAAAACYODO42KBGPD3YYY2OBMXWIZX7UPQQ

https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/refs/heads/main/patterns/alz/alzArm.json
"https://raw.githubusercontent.com/Azure/azure-monitor-baseline-alerts/2024-09-02/patterns/alz/alzArm.json" -TemplateParameterFile ".\patterns\alz\alzArm.param.json"


patterns/alz/alzArm.json