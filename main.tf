provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  key_name      = "test"
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  tags = {
    Name = "Linux_Server"
  }
}

resource "aws_instance" "win-example" {
  ami                    =  "ami-0d80714a054d3360c"
  instance_type          = "t2.micro"
  key_name = "test"

  tags = {
    Name = "Windows_Server"
  }

}