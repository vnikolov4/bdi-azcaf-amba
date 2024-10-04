Logout-AzAccount
#Visual Studio - LAB:
Connect-AzAccount -Tenant 3da350d5-6b6c-4c4c-b9c1-6cddbb692040 -UseDeviceAuthentication

Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Get-AzContext

$pseudoRootManagementGroup = "AzureCAF"

./Start-AMBACleanup.ps1 -pseudoRootManagementGroup $pseudoRootManagementGroup -WhatIf
./Start-AMBACleanup.ps1 -pseudoRootManagementGroup $pseudoRootManagementGroup

