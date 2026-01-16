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

📦 Requirements
Veeam Community Edition (Up to 10 workloads)

AzCopy v10 (Executable added to System PATH)

Azure Storage Account (Cool or Archive tier recommended)

🤖 Automation
Set up a Windows Task Scheduler trigger to run this script 1 hour after your daily Veeam job completes, or use it as a Post-Job script in Veeam.

CyberBuild Solutions S.R.L. | IT for SMEs

Contact: Iulian Bofu

Email: iulian@cyberbuildsolutions.com

Location: Bucharest, Romania

Web: cyberbuild.com

Need a custom implementation? Contact us 👈
