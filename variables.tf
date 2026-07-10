variable "instance_type"{
    description = "Instance Configuration"
    type        = string
    default     = "t3.micro"

    validation {
      condition = contains(["t2.micro","t3.micro","t3.small"],var.instance_type)
      error_message = "instance_type must be in list of [t2.micro ,t3.micro , t3.small]"
    }
}

variable "instance_count"{
    description = "Instance_count"
    type        = number
    default     = 1

    validation{
        condition = var.instance_count>=1 && var.instance_count<=5
        error_message = "Instance count must be in between 1-5"

}
}

variable "cidr_blocks"{
    description = "CIDR_RANGE"
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "project"{
    description = "Prjoect name"
    type = string
    default = "Terraform_Task3"
}

variable "Environemt"{
    type = string
    default = "Dev"
}