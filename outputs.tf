output "public_ip"{
    value = aws_instance.first_server[0].public_ip
}
output "private_ip"{
    value = aws_instance.first_server.private_ip
}