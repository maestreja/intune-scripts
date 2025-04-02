<#
.SYNOPSIS
    Ensures a drive is mapped and sets machine-level environment variables to desired values.
.DESCRIPTION
    This script checks if a given drive letter is mapped and if two specified machine-level environment variables
    have the expected values. If the drive is not mapped, it maps the drive to the provided UNC path.
    If an environment variable does not have the desired value, it is updated.
.PARAMETER DriveLetter
    The drive letter to check (e.g., "Z"). Do not include the colon.
.PARAMETER DrivePath
    The UNC path to map the drive to (e.g., "\\server\share").
.PARAMETER EnvVar1Name
    The name of the first environment variable.
.PARAMETER EnvVar1Value
    The desired value for the first environment variable.
.PARAMETER EnvVar2Name
    The name of the second environment variable.
.PARAMETER EnvVar2Value
    The desired value for the second environment variable.
.EXAMPLE
    .\RemediationScript.ps1 -DriveLetter Z -DrivePath "\\server\share" -EnvVar1Name "SOMEDRIVE" -EnvVar1Value "P" -EnvVar2Name "PowerBI_root" -EnvVar2Value "YES"
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$DriveLetter,

    [Parameter(Mandatory=$true)]
    [string]$DrivePath,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar1Name,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar1Value,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar2Name,

    [Parameter(Mandatory=$true)]
    [string]$EnvVar2Value
)

# Construct the drive path string (e.g., "Z:\")
$mappedDrive = "${DriveLetter}:\"

# Check and remediate drive mapping
if (-not (Test-Path $mappedDrive)) {
    Write-Output "$DriveLetter drive is not mapped. Mapping now..."
    New-PSDrive -Name $DriveLetter -PSProvider FileSystem -Root $DrivePath -Persist -ErrorAction Stop
    Write-Output "$DriveLetter drive mapped to $DrivePath."
} else {
    Write-Output "$DriveLetter drive is already mapped."
}

# Check and remediate the first environment variable
$currentEnvVar1 = [System.Environment]::GetEnvironmentVariable($EnvVar1Name, "Machine")
if ($currentEnvVar1 -ne $EnvVar1Value) {
    Write-Output "$EnvVar1Name is not set to $EnvVar1Value. Setting now..."
    [System.Environment]::SetEnvironmentVariable($EnvVar1Name, $EnvVar1Value, "Machine")
    Write-Output "$EnvVar1Name set to $EnvVar1Value."
} else {
    Write-Output "$EnvVar1Name is already set to $EnvVar1Value."
}

# Check and remediate the second environment variable
$currentEnvVar2 = [System.Environment]::GetEnvironmentVariable($EnvVar2Name, "Machine")
if ($currentEnvVar2 -ne $EnvVar2Value) {
    Write-Output "$EnvVar2Name is not set to $EnvVar2Value. Setting now..."
    [System.Environment]::SetEnvironmentVariable($EnvVar2Name, $EnvVar2Value, "Machine")
    Write-Output "$EnvVar2Name set to $EnvVar2Value."
} else {
    Write-Output "$EnvVar2Name is already set to $EnvVar2Value."
}

Write-Output "Remediation completed."
exit 0
