output "elastic_ip"{
    value = aws_eip.task3_eip.public_ip
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.logs_bucket.arn
}