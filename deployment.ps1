# =========================================== Generic
Logout-AzAccount
#Visual Studio - LAB:
Connect-AzAccount -Tenant 3da350d5-6b6c-4c4c-b9c1-6cddbb692040 -UseDeviceAuthentication
Get-AzContext | FL


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
git remote add origin https://vnikolov4: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@github.com/vnikolov4/bdi-azcaf-amba.git

https://github.com/vnikolov4/bdi-azcaf-amba.git

# check for: 
# Az.Accounts
# Az.Resources
Get-InstalledModule -Name "Az.Accounts" 
Get-InstalledModule -Name "Az.Resources" 
# ===========================================
#Dev
# =========================================== Perform alzArm.json deployment
# Configuring variables for deployment
$location = "westeurope"
$pseudoRootManagementGroup = "AzureCAF"

#New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/Azure/azure-monitor-baseline-alerts/2024-03-01/patterns/alz/alzArm.json" -TemplateParameterFile ".\patterns\alz\alzArm.param.json"
# Deployment for Dev Branch
https://raw.githubusercontent.com/vnikolov4/amba/dev/patterns/alz/alzArm.json
https://raw.githubusercontent.com/vnikolov4/amba/dev/patterns/alz/alzArm.param.json
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/vnikolov4/amba/dev/patterns/alz/alzArm.json" -TemplateParameterUri "https://raw.githubusercontent.com/vnikolov4/amba/dev/patterns/alz/alzArm.param.json"
# Deployment for main branch
https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json
https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.param.json
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json" -TemplateParameterUri "https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.param.json"

C:\DevOps\amba\bdi-azcaf-amba\patterns\alz\alzArm.json
C:\DevOps\amba\bdi-azcaf-amba\patterns\alz\alzArm.param.json
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateFile "C:\DevOps\amba\bdi-azcaf-amba\patterns\alz\alzArm.json" -TemplateParameterFile "C:\DevOps\amba\bdi-azcaf-amba\patterns\alz\alzArm.param.json"
# ===========================================

# =========================================== Perform Policy remediation
$pseudoRootManagementGroup = "The pseudo root management group id parenting the identity, management and connectivity management groups"
$identityManagementGroup = "The management group id for Identity"
$managementManagementGroup = "The management group id for Management"
$connectivityManagementGroup = "The management group id for Connectivity"
$LZManagementGroup="AzureCAF"

.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $managementManagementGroup -policyName Alerting-Management
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $connectivityManagementGroup -policyName Alerting-Connectivity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $identityManagementGroup -policyName Alerting-Identity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-LandingZone
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $pseudoRootManagementGroup -policyName Alerting-ServiceHealth
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $pseudoRootManagementGroup -policyName Notification-Assets

# ===========================================

# ============================================= Build policies.json file. Regardless you’re modifying existing policies or adding new ones, you need to update the policies.bicep file.
bicep build .\patterns\alz\templates\policies.bicep --outfile .\patterns\alz\policyDefinitions\policies.json  
# ===========================================