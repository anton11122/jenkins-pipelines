terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
 default_tags {
   tags = {
     Environment = "Test"
     Owner       = "Devops"
     Project     = "lambda-python-app"
   }
 }
}

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
