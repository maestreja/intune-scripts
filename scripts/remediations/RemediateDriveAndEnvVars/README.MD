# Drive Mapping and Environment Variable Remediation Scripts

This folder contains two PowerShell scripts designed to help you ensure that a specific drive mapping and machine-level environment variables are correctly configured on Windows systems. These scripts are fully parameterized to allow for customization, 

## Overview

- **Detection Script (`Detection.ps1`):**  
  Checks if:
  - A specified drive (e.g., R:) is mapped.
  - Two machine-level environment variables are set to the expected values.

  The script outputs "Compliant" and exits with code 0 if all checks pass; otherwise, it outputs "Non-compliant" and exits with code 1.

- **Remediation Script (`Remediation.ps1`):**  
  Ensures that:
  - The specified drive is mapped to a provided UNC path.
  - The two machine-level environment variables are set to their expected values.

  The script remediates any issues found and exits with code 0 once remediation is complete.

## Getting Started

### Prerequisites

- Windows PowerShell (preferably version 5.1 or later)
- Administrative privileges (required for setting machine-level environment variables and mapping drives system-wide)

### Usage

#### Detection Script

Run the detection script with the following parameters:

- `-DriveLetter`: The drive letter to check (do not include the colon).
- `-EnvVar1Name`: The name of the first environment variable.
- `-EnvVar1Value`: The expected value for the first environment variable.
- `-EnvVar2Name`: The name of the second environment variable.
- `-EnvVar2Value`: The expected value for the second environment variable.

Example:
```powershell
.\DetectionScript.ps1 -DriveLetter Z -EnvVar1Name "SOMEDRIVE" -EnvVar1Value "P" -EnvVar2Name "PowerBI_root" -EnvVar2Value "YES"
