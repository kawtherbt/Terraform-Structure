resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  tags = {
    Name = "web-server"
  }
}
