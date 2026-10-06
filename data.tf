##data sources
data "aws_vpc" "myvpc" {
  filter {
    name   = "tag:Name"
    values = ["demoqt"]
  }
}

data "aws_subnet" "myvpc" {
  vpc_id            = data.aws_vpc.myvpc.id
  availability_zone = "ap-south-1c"

  filter {
    name   = "tag:Name"
    values = ["demo-1"]
  }
}


data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}