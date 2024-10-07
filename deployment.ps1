# =========================================== Generic
Logout-AzAccount
#BDI:
Connect-AzAccount -Tenant 43881547-223e-4de0-9ff7-dc777c8d73f1 -UseDeviceAuthentication
Get-AzContext | FL


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
$location = "eastus"
$pseudoRootManagementGroup = "mg-bdi-azcaf"

# Deployment for main branch
https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json
https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.param.json
New-AzManagementGroupDeployment -Name "amba-GeneralDeployment" -ManagementGroupId $pseudoRootManagementGroup -Location $location -TemplateUri "https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.json" -TemplateParameterUri "https://raw.githubusercontent.com/vnikolov4/bdi-azcaf-amba/main/patterns/alz/alzArm.param.json"
# ===========================================

# =========================================== Perform Policy remediation
$pseudoRootManagementGroup = "mg-bdi-azcaf"
$identityManagementGroup = "The management group id for Identity"
$managementManagementGroup = "The management group id for Management"
$connectivityManagementGroup = "The management group id for Connectivity"
$LZManagementGroup="mg-bdi-azcaf"

#Run the following commands to initiate remediation
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $pseudoRootManagementGroup -policyName Notification-Assets
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $pseudoRootManagementGroup -policyName Alerting-ServiceHealth
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $connectivityManagementGroup -policyName Alerting-Connectivity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $identityManagementGroup -policyName Alerting-Identity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $managementManagementGroup -policyName Alerting-Management
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-KeyManagement
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-LoadBalancing
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-NetworkChanges
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-RecoveryServices
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-HybridVM
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-Storage
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-VM
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-Web
# ===========================================

# ============================================= Build policies.json file. Regardless you’re modifying existing policies or adding new ones, you need to update the policies.bicep file.
bicep build .\patterns\alz\templates\policies.bicep --outfile .\patterns\alz\policyDefinitions\policies.json  
# ===========================================