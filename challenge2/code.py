import requests

def get_metadata(metadata_endpoint="http://169.254.169.254/metadata"):
    headers = {"Metadata": "true"}
    try:
        response = requests.get(metadata_endpoint, headers=headers, timeout=2)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print("Error :", e)
        return None
 
metadata = get_metadata()
if metadata:
    print("Azure Instance Metadata:")
    print("VM ID:", metadata["compute"]["vmId"])
    print("VM Size:", metadata["compute"]["vmSize"])
    print("Location:", metadata["compute"]["location"])
    print("Resource Group:", metadata["compute"]["resourceGroupName"])
    print("Network Interface ID:", metadata["network"]["interface"][0]["id"])
     
else:
    print("Metadata not available")
