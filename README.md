# **Workshop: Primeiro Deploy com Streamlit**

Este repositório contém o código e as instruções para o workshop "Primeiro Deploy com Streamlit", onde você aprenderá a configurar um ambiente de desenvolvimento, versionar código com Git, e fazer o deploy de uma aplicação simples usando Streamlit.

## **1. Configurando o Projeto**

### Criar a Pasta do Projeto

1. Crie a pasta do projeto e entre nela:
   ```bash
   mkdir primeiro_deploy
   cd primeiro_deploy
   ```

2. Inicialize um ambiente virtual Python e ative-o:
   ```bash
   python -m venv venv
   source venv/bin/activate   # Linux/Mac
   venv\Scripts\activate      # Windows
   ```

3. Instale o Streamlit e crie o arquivo principal do projeto:
   ```bash
   pip install streamlit
   touch app.py
   ```

## **2. Criando a Aplicação**

1. No arquivo `app.py`, adicione o seguinte código:
   ```python
   import streamlit as st

   st.title("Hello, World!")
   st.write("Bem-vindo ao primeiro deploy com Streamlit!")
   ```

2. Execute a aplicação:
   ```bash
   streamlit run app.py
   ```

## **3. Versionando o Código com Git**

1. Inicialize o repositório Git:
   ```bash
   git init
   git add .
   git commit -m "Setup inicial do projeto"
   ```

2. Configure o Git (nome de usuário e email):
   ```bash
   git config --global user.name "Seu Nome"
   git config --global user.email "seuemail@example.com"
   ```

3. Publique o código no GitHub:
   - Crie um repositório no GitHub.
   - Conecte o repositório local ao GitHub:
     ```bash
     git remote add origin https://github.com/seuusuario/primeiro_deploy.git
     git branch -M main
     git push -u origin main
     ```

## **4. Introdução ao Docker**

### O que é Docker?

Docker é uma plataforma que permite criar, distribuir e rodar aplicações de forma consistente em qualquer ambiente, usando contêineres.

### Por que usar Docker?

- **Portabilidade:** Funciona em qualquer lugar que tenha Docker instalado.
- **Isolamento:** Mantém sua aplicação e dependências separadas de outras.
- **Facilidade de Deploy:** Simplifica o processo de deploy e gerenciamento.

### Configurando Docker para o Projeto

1. Crie um `Dockerfile` com o seguinte conteúdo:
   ```Dockerfile
    # Use a imagem base do Python
    FROM python:3.9-slim

    # Instale as dependências
    RUN pip install streamlit pandas pyarrow

    COPY ./app.py /app/app.py

    WORKDIR /app

    # Define o comando para rodar a aplicação na porta 80
    ENTRYPOINT ["streamlit", "run"]
    CMD ["app.py"]
   ```

2. Construa a imagem Docker:
   ```bash
   docker build -t primeiro_deploy .
   ```

3. Rode o contêiner:
   ```bash
   docker run -p 8501:8501 primeiro_deploy
   ```

4. Acesse a aplicação em `http://localhost:8501`.

## **5. Introdução à Cloud, AWS e Terraform**

### O que é Cloud?

Cloud computing oferece serviços de computação (servidores, armazenamento, banco de dados) pela internet. AWS é uma das principais plataformas de cloud.

### Usando AWS com Terraform

Terraform é uma ferramenta de IaC (Infraestrutura como Código) que permite configurar e gerenciar sua infraestrutura na cloud.

### Configurando uma Instância EC2 na AWS com Terraform

1. Crie um arquivo `main.tf`:
   ```hcl
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
                sudo docker run -d -p 80:80 --user root streamlit-app
                EOF

    tags = {
        Name = "streamlit-app"
    }
    }

    output "instance_public_ip" {
    value = aws_instance.app_instance
    }
   ```

2. Inicialize e aplique a configuração:
   ```bash
   terraform init
   terraform apply
   ```

3. Acesse a aplicação usando o IP público da instância EC2.

## **Conclusão**

Este guia fornece os passos essenciais para configurar um ambiente de desenvolvimento, usar Git para controle de versão, rodar uma aplicação com Docker, e fazer o deploy na AWS usando Terraform. Com essas ferramentas, você pode criar, versionar e implantar aplicações de forma eficiente e escalável.