🚀 End-to-End CI/CD Pipeline for Dockerized React Application

Project Overview

This project demonstrates a production-grade CI/CD pipeline built using Jenkins, Docker, AWS EC2, and GitHub.
The pipeline automates the complete workflow:
Code checkout from GitHub
Docker image build (React + Nginx)
Push image to Docker Hub
Deploy the application automatically to an EC2 instance via SSH
This project also involved real-world DevOps debugging, not just happy-path execution.

Developer (Git Push)
        |
        v
GitHub Repository (dev branch)
        |
        v
Jenkins (CI/CD on EC2)
        |
        |-- Build Docker Image (linux/amd64)
        |-- Push Image to Docker Hub
        |
        v
Application EC2 (Amazon Linux)
        |
        v
Docker Container (Nginx serving React App)

🛠️ Tech Stack

Frontend: React
Containerization: Docker, Nginx
CI/CD: Jenkins
Cloud: AWS EC2
Registry: Docker Hub
Version Control: Git & GitHub
OS: Amazon Linux 2023
Shell: Bash

Project-3/
│
├── devops-build/          # Dockerized React build output
├── Jenkinsfile            # Jenkins pipeline definition
├── jenkins.txt            # Jenkins notes/config
├── Screenshots/           # Proof of pipeline execution
└── README.md              # Project documentation

⚙️ Step-by-Step Implementation
1️⃣ Application Dockerization

Built React app
Used Nginx to serve static build
Created Dockerfile and .dockerignore
Verified app runs locally using Docker

2️⃣ Docker Hub Setup

Created Docker Hub repository
Generated Read & Write access token
Learned that password authentication is deprecated
Used access tokens for secure login

3️⃣ Jenkins Setup (Dedicated EC2)

Launched a high-performance EC2 instance
Installed:
Java 17
Docker
Jenkins
Git
Configured Jenkins user to access Docker
Enabled executors to avoid build queue issues

4️⃣ Jenkins Credentials Configuration

Stored secrets securely using Jenkins Credentials Manager:
Docker Hub token (dockerhub-creds)
SSH private key for EC2 deployment (app-ec2-ssh)

5️⃣ Jenkins Pipeline Creation

Pipeline stages:
Checkout code from GitHub (dev branch)
Build Docker image using docker buildx (linux/amd64)
Push image to Docker Hub
SSH into application EC2 and deploy container

6️⃣ Automated Deployment

Jenkins connects to EC2 via SSH
Stops old container (if exists)
Pulls latest Docker image
Runs container on port 80

🧠 Real-World Issues Faced & Fixes (Brief)

Fixed React app not loading in Docker by correcting Nginx configuration and build file paths.
Resolved Docker image failure on EC2 caused by ARM vs amd64 mismatch using docker buildx --platform linux/amd64.
Solved Docker Hub push errors by regenerating access tokens with Read & Write permissions and validating pushes manually.
Fixed Jenkins pipeline failure by installing the SSH Agent plugin to enable SSH-based deployment.
Resolved Jenkins deployment errors caused by heredoc (EOF) parsing by using safer shell quoting.
Fixed Git push issues by initializing the repository correctly, configuring remotes, rebasing branches, and using GitHub Personal Access Tokens.

✅ Final Outcome
✅ Jenkins pipeline GREEN
✅ Docker image pushed successfully
✅ App auto-deployed to EC2
✅ CI/CD fully automated
✅ Project pushed to GitHub
✅ Interview-ready DevOps project

📸 Proof of Work

Screenshots included:
Jenkins pipeline success (green)
Docker Hub image
Live application on EC2
Console logs of successful deployment

🧠 Key Learnings

CI/CD is not just configuration — it’s debugging
Architecture mismatches (ARM vs amd64) are common
Credential scopes matter
Jenkins plugins are critical
Git fundamentals are essential for DevOps
