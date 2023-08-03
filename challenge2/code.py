import requests

def get_azure_instance_metadata(metadata_endpoint="http://169.254.169.254/metadata/instance?api-version=2021-02-01"):
    headers = {"Metadata": "true"}
    try:
        response = requests.get(metadata_endpoint, headers=headers, timeout=2)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print("Error while fetching metadata:", e)
        return None

# Call the function to get the instance metadata
instance_metadata = get_azure_instance_metadata()

# Check if the metadata is available and print some of the properties
if instance_metadata:
    print("Azure Instance Metadata:")
    print("VM ID:", instance_metadata["compute"]["vmId"])
    print("VM Size:", instance_metadata["compute"]["vmSize"])
    print("Location:", instance_metadata["compute"]["location"])
    print("Resource Group:", instance_metadata["compute"]["resourceGroupName"])
    print("Network Interface ID:", instance_metadata["network"]["interface"][0]["id"])
    # You can print more properties based on your requirement
else:
    print("Metadata not available. Are you running this code within an Azure VM?")
