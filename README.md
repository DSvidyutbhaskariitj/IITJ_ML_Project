# Virtualization and Cloud Computing Project
VIDYUT BHASKAR (G23AI2128) , Rahul Verma  (G23AI2039) , Atul Singh (G23AI2104)

# Template Solution Architectur for building Scalable Solution for Monolithic Applications

This project involves finding out probable solution to scale a monolithic application on cloud

This is tested with the automated deployment of a web application hosted on an Nginx server. The process includes pulling the latest updates from a Git repository, configuring the Nginx server, and setting up the application to run in a production environment.

## Project Overview
Exploring different solution architecture available in Azure platform such as Vertical Scaling of VM vs Horizontal Scaling with the help of Scale sets. Further Loadbalancers are added to distribute loads to same deployed application in different VMs

In this project we deployed VMs in a tenant to ensure Isolation

The deployment process consists of:

1. **Git Pull**: Automating the pull of the latest code from a Git repository.
2. **Nginx Configuration**: Setting up Nginx to serve the application, including symbolic linking and reloading Nginx.
3. **Application Deployment**: Running the application using the most recent changes.

## Prerequisites
- **Azure subscription**
- **Ubuntu 20.04+** or any other Linux distribution.
- **Git** installed on the server.
- **Nginx** installed on the server.
- **Systemd** for managing services like Nginx.
- **Git repository** hosting your web application.

## Steps for Deployment

### 1. Clone or Pull from Git Repository

Use the script in **deploymentscript** folder to pull the latest changes from your Git repository and redeploy the application.

Use templates in **ARMtemplate** folder to automate for resource creation on Azure with powershell or bash
