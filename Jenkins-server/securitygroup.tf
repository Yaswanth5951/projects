resource "aws_security_group" "application-sg" {
  name = var.jenkins-server-sg.name
  description = var.jenkins-server-sg.description
  vpc_id = local.vpc_id
  depends_on = [ aws_vpc.ntier-vpc ]
}
resource "aws_security_group_rule" "application-sg-rules" {
  count = length(var.jenkins-server-sg.rules)
  security_group_id = aws_security_group.application-sg.id
  type = var.jenkins-server-sg.rules[count.index].type
  from_port = var.jenkins-server-sg.rules[count.index].from_port
  to_port = var.jenkins-server-sg.rules[count.index].to_port
  protocol = var.jenkins-server-sg.rules[count.index].protocol
  cidr_blocks = [ var.jenkins-server-sg.rules[count.index].cidr_block ]
  depends_on = [ aws_security_group.application-sg ]
} 