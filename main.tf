provider "aws" {
  region = "us-west-1"  # Substitua pela região que você preferir
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0ff591da048329e00"  # AMI do Amazon Linux 2 (verifique se esta AMI está disponível na sua região)
  instance_type = "t2.micro"               # Tipo de instância (t2.micro está dentro do free tier)

    user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io git
              sudo systemctl start docker
              sudo systemctl enable docker

              # Clonar o repositório do GitHub
              git clone https://github.com/lvgalvao/deploy_aovivo.git /app

              # Construir e executar o contêiner Docker
              cd /app
              sudo docker build -t streamlit-app .
              sudo docker run -d -p 80:80 streamlit-app
              EOF

  tags = {
    Name = "streamlit-app"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_instance
}
