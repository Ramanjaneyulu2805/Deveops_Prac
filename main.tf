provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "first_server"{
    ami = var.ami
    instance_type = var.instance_type
    count=var.instance_count

    tags = {
        Name = "Terraform_easy_mode"
        Environment  = "Dev"
    }


}