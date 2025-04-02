<#
.SYNOPSIS
    Checks if a specific drive is mapped and if two machine-level environment variables have the expected values.
.DESCRIPTION
    This script verifies that a given drive letter is mapped and that two specified machine-level environment variables
    are set to the desired values. It outputs "Compliant" and exits with code 0 if all checks pass, otherwise it outputs
    "Non-compliant" and exits with code 1.
.PARAMETER DriveLetter
    The drive letter to check (e.g., "R"). Do not include the colon.
.PARAMETER EnvVar1Name
    The name of the first environment variable.
.PARAMETER EnvVar1Value
    The expected value of the first environment variable.
.PARAMETER EnvVar2Name
    The name of the second environment variable.
.PARAMETER EnvVar2Value
    The expected value of the second environment variable.
.EXAMPLE
    .\DetectionScript.ps1 -DriveLetter R -EnvVar1Name "TSDRIVE" -EnvVar1Value "R" -EnvVar2Name "NCI_CITRIX_SRV" -EnvVar2Value "YES"
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$DriveLetter,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar1Name,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar1Value,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar2Name,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar2Value
)

# Construct the drive path string (e.g., "R:\")
$drivePath = "${DriveLetter}:\"

# Check if the drive is mapped
$driveMapped = Test-Path $drivePath

# Retrieve the machine-level environment variables
$currentEnvVar1 = [System.Environment]::GetEnvironmentVariable($EnvVar1Name, "Machine")
$currentEnvVar2 = [System.Environment]::GetEnvironmentVariable($EnvVar2Name, "Machine")

# Evaluate conditions: if any check fails, mark as non-compliant.
if (-not $driveMapped -or $currentEnvVar1 -ne $EnvVar1Value -or $currentEnvVar2 -ne $EnvVar2Value) {
    Write-Output "Non-compliant"
    exit 1
} else {
    Write-Output "Compliant"
    exit 0
}
