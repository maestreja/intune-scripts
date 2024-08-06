import requests
import json
import base64
import re

# Summary:
# This script interacts with the Microsoft Graph API to list, download, and decode device management scripts in an Intune environment.
# It prompts the user for an access token, retrieves the scripts' IDs and display names, sanitizes the filenames, and saves the decoded scripts as .ps1 files.

# Prompt user to input the access token
access_token = input("Please enter your access token: ")

# Base URLs for the Microsoft Graph API
base_url = "https://graph.microsoft.com/beta/deviceManagement/deviceManagementScripts"
select_query = "?$select=id,displayName"

# Function to get the list of device management script IDs and display names
def get_device_management_scripts():
    url = f"{base_url}{select_query}"
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept': 'application/json'
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        return [{"id": script["id"], "displayName": script["displayName"]} for script in data["value"]]
    else:
        print(f"Failed to get scripts, Status Code: {response.status_code}")
        return []

# Function to sanitize filenames
def sanitize_filename(filename):
    return re.sub(r'[\\/*?:"<>|]', "", filename)

# Function to download and decode a device management script
def download_device_management_script(script):
    script_id = script["id"]
    display_name = sanitize_filename(script["displayName"])
    url = f"{base_url}/{script_id}"
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept': 'application/json'
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        script_data = response.json()
        if 'scriptContent' in script_data:
            decoded_content = base64.b64decode(script_data['scriptContent']).decode('utf-8')
            # Save the decoded script content to a file
            with open(f"{display_name}.ps1", 'w', encoding='utf-8') as file:
                file.write(decoded_content)
            print(f"Downloaded and decoded script: {display_name}")
        else:
            print(f"Script content not found for script: {display_name}")
    else:
        print(f"Failed to download script: {display_name}, Status Code: {response.status_code}")

# Get the list of device management script IDs and display names
scripts = get_device_management_scripts()

# Iterate through the list of scripts and download each one
for script in scripts:
    download_device_management_script(script)

print("Download completed.")
