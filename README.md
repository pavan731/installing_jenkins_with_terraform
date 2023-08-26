# Installing Jenkins with Terraform
This guide will help you set up Jenkins using Terraform. It assumes you have the following prerequisites:

Terraform CLI (1.2.0+) installed.
AWS CLI installed.
AWS IAM access key and private key for login.
AWS account with associated credentials that allow resource creation.
# Configure AWS Credentials
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/45e4c64a-304f-483a-9895-8a0be9ae2e9b)

# Creating Terraform Configuration
Create a main.tf file using the touch command.
Open the main.tf file with a text editor.
Paste the provided content inside the main.tf file.
Change the ami_id and required region. Ensure you have an existing S3 bucket with the same name as specified here.

# Initializing Terraform
Run the following commands in your terminal:
terraform init
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/7ebf5b4f-75e6-47c8-bf07-518bfec3dc9e)



# Applying Terraform Configuration
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/264589ba-88a3-478c-9b28-9ee53096e566)

![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/242a6b97-9f90-40d7-9c45-ea90a1af5e3d)
You will be prompted for permission. Type "yes."

# Output
After successful application, you will see an output similar to:
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/4cdcc076-89d3-48a1-90c6-a1fcfdab4d07)

Copy and paste the generated link into a web browser to access Jenkins.





