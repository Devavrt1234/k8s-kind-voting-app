#!/bin/bash

#for running script in debug mode
set -x

# Set the repository URL
#REPO_URL="https://<ACCESS-TOKEN>@dev.azure.com/<AZURE-DEVOPS-ORG-NAME>/voting-app/_git/voting-app" for azure repo 
REPO_URL="https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/Devavrt1234/k8s-kind-voting-app.git"
#for github repo

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: azuredevopscrnew/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push 

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo


# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
