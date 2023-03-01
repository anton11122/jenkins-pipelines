# Task-lambda
This folder contain :
Jenkins declarative pipeline (Jenkinsfile)
Terraform code to deploy a python based Lambda + S3 bucket + API gateway to AWS.

## Assumptions

 - Agent with proper configured terraform and python3 with label "terraform-lambda" exists.
 - Lambda execution role is configured. 

## Configuration:
1. Module usage (Fill the needed variables) :

```terraform
module "lambda" {
  source   = "./lambda"
  bucket_name = ""
  lambda_execution_role_name = ""
  lambda_function_name = ""
  python_runtime = ""
  api_gateway_name = ""
  api_gateway_stage_name = ""
  api_gateway_route_key = ""
  
}
```

[Back](../README.md)
