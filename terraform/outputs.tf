output "project_name" {
  description = "Project identifier."
  value       = var.project_name
}

output "aws_region" {
  description = "Configured AWS region (no resources created)."
  value       = var.aws_region
}

output "next_steps" {
  description = "Safe next steps for infrastructure."
  value       = "No AWS resources are provisioned by this config. Run terraform fmt -check and terraform validate. Do NOT run apply without approval and funded credentials."
}
