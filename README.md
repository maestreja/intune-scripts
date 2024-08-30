# Intune Scripts Repository

Welcome to the Intune Scripts Repository! This repository contains various PowerShell or Python scripts and related resources to help automate and manage tasks in Microsoft Intune. It has placeholders for future scripts as well.

## Table of Contents

- [Intune Scripts Repository](#intune-scripts-repository)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Folder Structure](#folder-structure)
  - [Getting Started](#getting-started)
  - [Scripts](#scripts)
  - [Contributing](#contributing)
  - [License](#license)

## Overview

This repository is designed to streamline Intune management through automation. Each script is contained within its own directory, complete with documentation and any necessary supporting files.

## Folder Structure

```plaintext
IntuneScripts/
├── README.md
├── LICENSE
├── scripts/
│   ├── device-management-scripts/
│   │   ├── README.md
│   │   ├── download_device_management_scripts.ps1
│   │   └── config.json
│   ├── another-script-group/
│   │   ├── README.md
│   │   ├── script.ps1
│   │   └── script-helper.ps1
│   └── shared/
│       ├── common-module.psm1
│       └── logging.psm1
└── docs/
    ├── setup-guide.md
    ├── usage-guide.md
    └── troubleshooting.md
```

- **scripts/**: This directory contains individual scripts, each within its own folder. Each script folder has a README with specific instructions.
- **shared/**: This directory contains modules and functions shared across multiple scripts.
- **docs/**: This directory contains additional documentation, such as setup guides and troubleshooting tips.

## Getting Started

To use any of the scripts in this repository, follow these steps:

1. **Clone the Repository**:
2. 
    ```bash
    git clone https://github.com/maestreja/IntuneScripts.git
    cd IntuneScripts
    ```

3. **Navigate to the Desired Script**:
4. 
   - Each script is organized in its own directory under `scripts/`. Navigate to the script folder and refer to the `README.md` within that folder for detailed instructions.

5. **Run the Script**:

   - Ensure you have the necessary permissions and prerequisites as described in the script's documentation.
   - Example to Execute the script using PowerShell:
     ```bash
     ./scripts/device-management-scripts/download_device_management_scripts.ps1
     ```

## Scripts

This repository includes the following script categories:

- **[Device Management Scripts](scripts/device-management-scripts/README.md)**: Scripts related to managing devices in Intune.

- **[Another Script Group](scripts/another-script-group/README.md)**: Other Intune-related scripts.

For detailed information about each script, please refer to the individual README files within the respective script folders.

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and create a pull request. Be sure to follow the contribution guidelines:

- Write clear commit messages.
- Ensure your code follows the repository's coding standards.
- Update documentation as needed.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

