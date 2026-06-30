variable "ami" {
  type=string
  default="ami-0c02fb55956c7d316"
}

variable "instance_type"{
    type=string
    default="t3.micro"
}

variable "instance_count"{
    type=number
    default=2
}