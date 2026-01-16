<#
.SYNOPSIS
    Low-cost hybrid offload: Veeam CE → Azure Blob via AzCopy ($3/300GB/mo)
.DESCRIPTION
    1. Veeam Community Edition = free local backups
    2. AzCopy sync = upload deltas only (fast)
    3. Azure Blob Cool = $0.01/GB/month
.AUTHOR
    Iulian Bofu, CyberBuild Solutions S.R.L. | Bucharest
#>

param([string]$VeeamJobName="",[Parameter(Mandatory)][string]$LocalBackupPath,[Parameter(Mandatory)][string]$AzureContainerSasUrl,[string]$AzureSubFolder="",[string]$AzCopyPath="azcopy",[switch]$WhatIf)

function Write-Log{param([string]$Msg,[string]$Level="INFO");$ts=(Get-Date).ToString("yyyy-MM-dd HH:mm:ss");Write-Host "[$ts] [$Level] $Msg"}

if($VeeamJobName){try{Add-PSSnapin VeeamPSSnapIn -EA Stop;$job=Get-VBRJob -Name $VeeamJobName;Write-Log "⏳ Waiting for $VeeamJobName...";do{Start-Sleep 60}while((Get-VBRBackupSession -JobName $VeeamJobName|Sort EndTime -Desc|Select -1).State -notin@("Stopped","Failed","Warning"))}catch{Write-Log "Skip Veeam monitoring (normal for CE)" "WARN"}}

if(!(Test-Path $LocalBackupPath)){Write-Log "❌ Path not found: $LocalBackupPath";exit 1}
$dest=$AzureContainerSasUrl;if($AzureSubFolder -and $dest[-1] -ne"/"){$dest+="/";}$dest+=$AzureSubFolder;Write-Log "📤 Sync: $LocalBackupPath → $dest"

$args=@("sync","`"$LocalBackupPath`"", "`"$dest`"", "--recursive");if($WhatIf){Write-Host "azcopy $($args -join ' ')" -F Yellow;exit}
$proc=Start-Process $AzCopyPath $args -Wait -PassThru;if($proc.ExitCode){Write-Log "❌ AzCopy failed $($proc.ExitCode)";exit $proc.ExitCode}
Write-Log "✅ SUCCESS! Backups offloaded to Azure Blob ($3/300GB Cool tier)";Write-Log "💼 CyberBuild Solutions S.R.L."
