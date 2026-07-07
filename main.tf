provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "task2"{
    ami = var.ami
    instance_type = var.instance_type


    tags ={
        Name = "Task2_Server"
        
    }
}

resource "aws_security_group" web_sg2{
    name = "sg2"
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}