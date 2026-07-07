variable "ami"{
    description = "AMI IMAGE"
    type        = string
    default     = "ami-0557a15b87f6559cf"
}

variable "instance_type" {
    description = "Creating an INstance"
    type        = string
    default     = "t3.micro"

    validation {
    
      condition     = contains(["t2.micro","t3.micro","t3.small"],var.instance_type)
      error_message = "Allow instance types t2.micro t3.micro t3.small"
    }
}

variable "instance_count"{
    description = "No.of instances"
    type        = number
    default     = 1
    validation {
      condition = var.instance_count>=1 && var.instance_count<=5
      error_message = "Minimum 1 instance and maximum 5 instances you can create"
      
    }

}

variable "project"{
    description = "Project Name"
    type        = string
    default     = "Terraform-task2"
}

variable "Environment"{
    description = "Environmet DEV"
    type        = string
    default     = "dev"
    validation {
      condition = contains(["dev","staging","prod"],var.Environment)
      error_message = "Enviroment must be [dev or staging or prod]"
    }
}

variable "ssh_cidr"{
    description = "ssh_cider"
    type        = string
    default     = "0.0.0.0/0"
}

