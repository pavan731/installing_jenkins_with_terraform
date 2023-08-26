# Installing_jenkins_with_terraform
# Prerequisites

The Terraform CLI (1.2.0+) installed.
The AWS CLI installed.
Aws_IAM access key and private key to login with 
AWS account and associated credentials that allow you to create resources.

# configure aws
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/45e4c64a-304f-483a-9895-8a0be9ae2e9b)

# Creating terrform file
Create main.tf using touch command,
open that file with text editor,
paste the content provded inside main.tf file
change ami_id and required region. Make sure that you have already reated an s3 bucket and bucket name must be same here aswell
go to terminal

# Initialize terraform

![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/7ebf5b4f-75e6-47c8-bf07-518bfec3dc9e)



# Terraform apply
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/264589ba-88a3-478c-9b28-9ee53096e566)
![image](https://github.com/pavan731/installing_jenkins_with_terraform/assets/68803406/242a6b97-9f90-40d7-9c45-ea90a1af5e3d)
it will ask the permission give yes.




