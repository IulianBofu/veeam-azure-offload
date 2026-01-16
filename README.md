# 🚀 Veeam CE → Azure Offload Demo ($3/mo for 300GB)

**Low-cost hybrid backup for SMEs: Free Veeam + Fast AzCopy + Cheap Azure.**

## 🎯 Value Proposition
| Traditional | CyberBuild Solutions|
|-------------|-------------------|
| Veeam license €1000/yr | **Veeam CE FREE** |
| Full uploads (slow) | **AzCopy deltas** |
| 300GB = €100/mo | **300GB = $3/mo** |

## 🧪 Quick Test
```powershell
# Dry-run first
.\Upload-VeeamBackupsToAzure.ps1 -LocalBackupPath "C:\Backups" -AzureContainerSasUrl "https://mystorage.blob.core.windows.net/backups?<SAS>" -WhatIf

# Production run
.\Upload-VeeamBackupsToAzure.ps1 -VeeamJobName "Daily-HyperV" -LocalBackupPath "C:\Backups" -AzureContainerSasUrl "https://mystorage.blob.core.windows.net/backups?<SAS>"
