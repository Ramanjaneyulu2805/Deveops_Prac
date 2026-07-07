locals {
    common_tags = {
        project     = var.project
        Environment = var.Environment
        ManagedBy   = "Terraform"
    }
}