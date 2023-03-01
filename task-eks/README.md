# Task-eks

This folder contain :\
Jenkins declarative pipeline (Jenkinsfile)\
Steps :
1. Build a python containerized app on a build jenkins agent.
2. Upload the image to ECR.
3. Deploy the app to EKS.
4. Publish port 443.

## Assumptions

 - Agent with proper configured docker, awscli with label "Docker-builder" exists.
 - Agent with proper configured kubectl and eksctl with label "eks-deploy" exists.
 - Agents configured with proper instance profiles.

[Back](../README.md)
