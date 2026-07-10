provider "aws"{
    region = "us-west-1"
}


data "aws_ami" "amz_linux"{
    most_recent=true
    owners = [ "amazon" ]

    filter {
      name = "name"
      values = [ "amzn2-ami-hvm-*-x86_64-gp2" ]
    }
}

resource "aws_instance" "task3"{
    ami          = data.aws_ami.amz_linux.id
    instance_type=var.instance_type
    vpc_security_group_ids = [aws_security_group.sg3.id]

    tags = {
       Name= local.common_tags.project
    }
}




resource "random_id" "bucket_suffix"{
    byte_length = 4
}
resource "aws_s3_bucket" "logs_bucket"{
    bucket = "ramajaneyulu-logs-${random_id.bucket_suffix.hex}"
    
}
resource "aws_s3_bucket_versioning" "logs_version"{
    bucket = aws_s3_bucket.logs_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
    
}


resource "aws_eip" "task3_eip"{
    domain = "vpc"
    instance = aws_instance.task3.id
}



resource "aws_security_group" "sg3"{
    name = "task3-sg"
    ingress{
        from_port = 22
        to_port = 22
        protocol ="tcp"
        cidr_blocks = ["172.31.46.116/32"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
    }
}
