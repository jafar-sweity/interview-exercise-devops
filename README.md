# Terraform AWS 2-Tier Infrastructure

This Terraform project is a solution to the **Tucows Interview Exercise DevOps**. It deploys a 2-tier application in AWS, including API servers (EC2 instances) and a database server (RDS MySQL), while following AWS and Terraform best practices.

---

## Requirements Addressed

1. **API and Database Servers**:
   - **API Servers**: EC2 instances deployed in an Auto Scaling Group (ASG) behind an Application Load Balancer (ALB).
   - **Database Server**: RDS MySQL instance deployed in private subnets for security.

2. **Deployed in a Specific Region**:
   - The infrastructure is deployed in the `us-west-2` region (configurable via the `aws_region` variable).

3. **VPC Best Practices**:
   - A VPC with public and private subnets.
   - Internet Gateway (IGW) for public subnets.
   - NAT Gateway for private subnets to allow outbound internet access.
   - Route tables and associations for proper traffic routing.

4. **Only Web Ports Exposed**:
   - HTTP (port 80) is exposed to the public via the ALB.
   - SSH (port 22) is restricted to a trusted IP address (configurable via the `MyPuplicIp` variable).
   - RDS MySQL (port 3306) is only accessible from the private subnets.

5. **Logging and Alerting**:
   - **CloudWatch Logs**: EC2 instance logs are sent to CloudWatch Logs.
   - **CloudWatch Alarms**: Alarms are configured for high CPU usage on EC2 instances and high database connections on RDS.
   - **SNS Notifications**: Alarms trigger email notifications via Amazon SNS.

6. **Terraform Plan Output**:
   - A successful `terraform plan` output is included to confirm the execution plan.

---

## Best Practices Followed

1. **Modular Design**:
   - The infrastructure is divided into reusable modules: VPC, EC2, RDS, ALB, Security Groups, and CloudWatch.

2. **Security**:
   - SSH access is restricted to a trusted IP.
   - RDS is deployed in private subnets and is not publicly accessible.
   - Security groups are used to control inbound and outbound traffic.

3. **Scalability**:
   - EC2 instances are deployed in an Auto Scaling Group (ASG) for high availability and scalability.
   - An Application Load Balancer (ALB) distributes traffic across instances.

4. **Monitoring**:
   - CloudWatch Logs and Alarms are configured for monitoring and alerting.

5. **Sensitive Data**:
   - Database credentials (e.g., `db_name`, `db_user`, `db_password`) are marked as sensitive in Terraform (best practice: store them in AWS Secrets Manager).

6. **Documentation**:
   - A `setup.md` file is included with instructions for deploying and testing the infrastructure.

---

## How to Test

Refer to the [setup.md](setup.md) file for detailed instructions on deploying and testing the infrastructure.

---

