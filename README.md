#AWS EC2 Setup with Terraform

Hey there! 👋  
This is my final project for the Cloud Infrastructure & Services course. In this project, I used **Terraform** to automate the setup of an **EC2 instance** on **AWS** — no more clicking around the AWS Console manually!

---

##What's This Project About?

The goal of this project is to:

- Use Terraform to **automate** EC2 instance provisioning on AWS
- Learn how to manage infrastructure as code
- Apply best practices like reusable variables, outputs, and secure access
- Understand how to version control infrastructure using GitHub

---

##What I Used

- **Terraform** (v1.x)
- **AWS** (EC2, Key Pairs, Security Groups)
- **GitHub** (to track my code and changes)

---

---

##Before You Begin

Make sure you have these ready:

1. **Terraform** installed on your system  
2. An **AWS account** with permissions to launch EC2 instances  
3. AWS CLI configured (`aws configure`)  
4. An **SSH key pair** to access your EC2 instance securely  

---

##How to Run It

Here’s how you can spin up your own EC2 instance using this code:

```bash
# Step 1: Clone this repo
git clone https://github.com/AnkithreddyBureddy/8981900-finalproject.git
cd 8981900-finalproject

# Step 2: Initialize Terraform
terraform init

# Step 3: Preview what Terraform will do
terraform plan

# Step 4: Apply the changes (provision the EC2 instance)
terraform apply

# Optional: To destroy everything when done
terraform destroy
