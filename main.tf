provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  key_name      = "cloudwatch-example"
  ami           = "ami-04590e7389a6e577c"
  instance_type = "t2.micro"
  tags = {
    Name = "Linux_Server"
  }
}

resource "aws_instance" "win-example" {
  ami                    =  "ami-03e68166e462a9c52"
  instance_type          = "t2.micro"
  key_name = "cloudwatch-example"

  tags = {
    Name = "Windows_Server"
  }

}