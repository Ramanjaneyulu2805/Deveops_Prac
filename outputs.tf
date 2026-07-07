output "public_IP"{
    value = aws_instance.task2.public_ip
}
output "private_IP"{
    value = aws_instance.task2.private_ip
}