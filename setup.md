# Setup Instructions

This document provides step-by-step instructions to deploy and test the 2-tier AWS infrastructure using Terraform.

---

## Prerequisites

1. **Terraform Installed**: Ensure Terraform is installed on your system. Download it from [here](https://www.terraform.io/downloads.html).
2. **AWS CLI Configured**: Install and configure the AWS CLI with your credentials. Follow the [AWS CLI setup guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).
3. **Git Installed**: Ensure Git is installed to clone the repository.

---

## Steps to Deploy the Infrastructure

1. **Clone the Repository**:  
   `git clone` 

2. **Initialize Terraform**:  
    `terraform init` 

3. **Review the Execution Plan**:  
    `terraform plan` 

4. **Apply the Configuration**:  
   `terraform apply`   
   Confirm the action by typing `yes` when prompted.

---

## Steps to Test the Infrastructure

1. **Access the Application**:

   - After deployment, Terraform will output the DNS name of the Application Load Balancer (ALB).
   - Open the ALB DNS name in your browser `http://<alb-dns-name>` that will output by terraform.
   - You should see the default Nginx page with a message like "Hello from ip-address".

2. **Test the Database Connection**:

   - Use the RDS endpoint (output by Terraform) to connect to the MySQL database.
   -  command:  
   ```mysql -h <rds-endpoint> -u admin -p```
   - Enter the database password when prompted

3. **Trigger Alerts**:

   - Simulate high CPU usage on the EC2 instances to trigger the CloudWatch alarm.
   - Use a tool like `stress` to generate CPU load:  
     Add your `stress` command here.
   - Check your email for the CloudWatch alarm notification.

4. **Verify Logs**:
   - Navigate to the AWS CloudWatch Console.
   - Check the log group `/ec2/<project-name>-web-logs` for EC2 instance logs.

---

## Cleanup

To destroy the infrastructure and avoid unnecessary charges, run:  
 `terraform destroy`  
Confirm the action by typing `yes` when prompted.

---

## Notes

- Ensure you have the necessary AWS permissions to create and manage resources.
  
