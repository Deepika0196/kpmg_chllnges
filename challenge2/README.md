
## Challenge2 

Write code that will query the meta data of an instance within AWS or Azure or GCP and provide a json formatted output. 

We can use Azure Instance Metadata Service. The IMDS endpoint is available at a fixed IP address on every Azure VM: 169.254.169.254.

You can try calling the IMDS endpoint from a Bash Shell on an Azure VM. Deploy a Linux VM of your choice, and make sure you’ve installed the jq utility first. jq is a handy tool to format JSON output. For example to install it on Debian-based systems: “sudo apt install jq”.

curl -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2018-10-01" | jq

Or else we can run a python code to achieve the result

 



 
