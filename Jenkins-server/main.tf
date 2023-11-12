## create EC2 instance
resource "aws_instance" "application" {
  instance_type               = var.jenkins-server-network-info.instance_size
  associate_public_ip_address = "true"
  ami                         = var.jenkins-server-network-info.ami_id
  subnet_id                   = aws_subnet.ntier-subnets[0].id
  vpc_security_group_ids      = [aws_security_group.application-sg.id]
  key_name                    = aws_key_pair.public-key.key_name
  user_data = file("jenkins-install.sh")
  tags = {
    Name = "Jenkins-Server"
  }
  depends_on = [
    aws_security_group.application-sg
  ]
}


