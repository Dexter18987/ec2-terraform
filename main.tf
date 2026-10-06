resource "aws_security_group" "web1" {
  name        = "web1"
  description = "demo"
vpc_id = data.aws_vpc.myvpc.id

  }


resource "aws_security_group_rule" "web1-ssh_port" {
  security_group_id = aws_security_group.web1.id
  type              = "ingress"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block_ssh_port]
  depends_on        = [aws_security_group.web1]


}
resource "aws_instance" "webserver1" {
  ami             = data.aws_ami.amazon_linux.id # Amazon Linux 2 AMI
  instance_type   = "t3.micro"
  key_name        = var.key_name
  subnet_id = data.aws_subnet.myvpc.id
  security_groups = [aws_security_group.web1.id]
}