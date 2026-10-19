terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Credentials via environment variables or shared config. Never hard-code here.
}

# Minimal, safe, zero-cost-by-default design:
# - No EC2/VPC resources are created by default (enable only after approval).
# - This file documents the intended production topology and validates with
#   `terraform validate` without creating any cloud resources.
#
# Intended topology (when approved and funded):
#   VPC (1) -> public subnets (2 AZs) -> Security Group (5000/tcp) ->
#   EC2 t3.micro running Docker image student-academic-platform:v1.0.0
