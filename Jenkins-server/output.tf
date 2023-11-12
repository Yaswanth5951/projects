output "apacheurl" {
  value = "http://${aws_instance.application.public_ip}:8080"
}

