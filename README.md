# Intune Device Management Scripts

This repository contains scripts for managing device configurations via the Microsoft Graph API in an Intune environment.

## download_device_management_scripts.py

### Summary:
This script interacts with the Microsoft Graph API to list, download, and decode device management scripts in an Intune environment. It prompts the user for an access token, retrieves the scripts' IDs and display names, sanitizes the filenames, and saves the decoded scripts as `.ps1` files. Additionally, it creates a CSV file containing the display names and script IDs.

### Usage:
1. Ensure you have the necessary permissions and an access token for the Microsoft Graph API. 
	#### DeviceManagementConfiguration.ReadWrite.All
	#### DeviceManagementManagedDevices.ReadWrite.All
	#### DeviceManagementApps.ReadWrite.All
	#### User.Read
	
2. Run the script and input your access token when prompted.
3. The script will download the device management scripts and save them as `.ps1` files.
4. A CSV file named `device_management_scripts.csv` will be created containing the display names and script IDs.

### Requirements:
- Python 3.x
- `requests` library

### Installation:
To install the required `requests` library, run:
```sh
pip install requests
```

### Run the Script"
```sh
python download_device_management_scripts.py
```
