provider "aws" {
  region     = "us-east-2"
  access_key = "SOLLA MUDIYATHU"
  secret_key = "SOLLA MUDIYATHU"
}

resource "aws_instance" "SPOTIFY" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"
  key_name      = "non"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              apt-get install -y git
              git clone https://github.com/SanjayM08/valentine.git
              cd valentine
              docker build . -t sanjaym08/valentinesday
              docker run -d -p 80:80 sanjaym08/valentinesday
              EOF

  tags = {
    Name = "SPOTIFY"
  }
}

output "public_ip" {
  value = aws_instance.SPOTIFY.public_ip
}

