Cloud Infrastructure Automation Assessment

This project demonstrates a complete end-to-end DevOps workflow using Infrastructure as Code (IaC), configuration management, containerisation, and CI/CD automation. The system provisions cloud infrastructure on AWS using Terraform, configures the server environment using Ansible, deploys a Dockerised web application, and integrates automation through GitHub Actions.
The objective is to achieve consistent, repeatable, and reliable cloud deployment with minimal manual intervention.

Project Highlights
	•	Infrastructure as Code using Terraform
	•	Automated AWS EC2 Provisioning
	•	Configuration Management using Ansible
	•	Dockerised Web Application Deployment
	•	CI/CD Automation using GitHub Actions
	•	End-to-End Automated Deployment Pipeline

Architecture Overview

Developer Push
↓
GitHub Repository
↓
GitHub Actions (CI/CD Pipeline)
↓
Terraform (Infrastructure Provisioning)
↓
AWS EC2 Instance
↓
Ansible (Server Configuration via SSH)
↓
Docker (Container Deployment)
↓
Running Web Application (Public IP Access)

Folder Structure


cloud-automation/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── output.tf
│   └── .terraform.lock.hcl
│
├── ansible/
│   ├── inventory
│   └── playbook.yml
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
├── .github/
│   └── workflows/
│       └── main.yml
│
├── .gitignore
└── README.md

Prerequisites

Before running the project manually, ensure the following:
	•	AWS Account (Free Tier recommended)
	•	AWS CLI configured
	•	Terraform installed
	•	Ansible installed
	•	SSH key pair configured

Step-by-Step Execution 

  1. Clone Repository
     git clone <your-repository-url>
     cd cloud-automation

  2. Provision Infrastructure (Terraform)
     cd terraform
     terraform init
     terraform apply
     
     This provisions:
	   •	AWS EC2 instance
	   •	Security Groups (Port 22 for SSH, Port 80 for HTTP)
	   •	Public IP address

  3. Configure Server (Ansible)
     cd ../ansible
     ansible-playbook -i inventory playbook.yml

     This step:
	   •	Connects to EC2 via SSH
	   •	Installs Docker
	   •	Configures the environment
	   •	Deploys the containerised application

  4. Access the Application
     http://<EC2_PUBLIC_IP>

CI/CD Deployment

The GitHub Actions workflow is triggered automatically whenever code is pushed to the main branch. The pipeline validates Terraform configuration, provisions      infrastructure, executes the Ansible playbook, and deploys the Docker container automatically.This ensures the deployment process remains fully automated and      reproducible.

Security Configuration
  •	SSH access enabled on Port 22
	•	HTTP access enabled on Port 80
	•	Security groups defined using Terraform

Challenges Faced

During implementation, several challenges were encountered, including SSH authentication issues, Docker dependency errors, security group misconfigurations, and CI/CD sequencing problems. These were resolved by correcting key pair permissions, updating system packages within the playbook, refining security group rules, and restructuring the automation workflow.

Conclusion

This project successfully demonstrates a practical implementation of cloud automation using Terraform, Ansible, Docker, and GitHub Actions. By integrating infrastructure provisioning, configuration management, containerisation, and CI/CD automation, the system achieves consistent and reliable end-to-end deployment in a cloud environment.
