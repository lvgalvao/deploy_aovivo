# **Módulo 2: Introdução ao Docker e Configuração do Projeto**

## **1. O que é Docker?**

Docker é uma plataforma que permite criar, distribuir e rodar aplicações em contêineres. Um contêiner é uma unidade de software que empacota o código e todas as suas dependências, garantindo que a aplicação funcione de maneira consistente em qualquer ambiente, seja no seu computador local, em um servidor ou na nuvem.

## **2. Por que utilizar Docker?**

- **Portabilidade:** Com Docker, você pode garantir que sua aplicação rodará em qualquer ambiente que tenha o Docker instalado, sem problemas de compatibilidade.
- **Isolamento:** Docker isola a aplicação e suas dependências em contêineres, evitando conflitos com outras aplicações.
- **Escalabilidade:** Facilita o gerenciamento e a escalabilidade de aplicações, permitindo o uso de microserviços.
- **Eficiência:** Reduz o tempo de configuração do ambiente e facilita o ciclo de desenvolvimento, testes e deploy.

## **3. Como instalar o Docker no Windows**

### Passo 1: Verificar os requisitos do sistema
Certifique-se de que seu sistema atende aos requisitos mínimos:
- **Sistema Operacional:** Windows 10 64-bit: Pro, Enterprise ou Education (Build 19041 ou superior)
- **Virtualização habilitada:** Docker depende da virtualização no Windows. Certifique-se de que ela está habilitada no BIOS do seu computador.

### Passo 2: Baixar e instalar o Docker Desktop
1. Acesse o site oficial do Docker: [Docker Desktop para Windows](https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe).
2. Baixe o instalador do Docker Desktop.
3. Execute o arquivo `.exe` baixado para iniciar a instalação.
4. Siga as instruções na tela. Durante a instalação, você pode optar por instalar o Docker Desktop com a opção de usar o WSL 2 (Windows Subsystem for Linux) ou Hyper-V. Recomenda-se o uso do WSL 2 para melhor desempenho.

### Passo 3: Iniciar o Docker Desktop
Após a instalação, inicie o Docker Desktop. Você verá um ícone do Docker na bandeja do sistema (perto do relógio) indicando que o Docker está rodando. Pode ser necessário reiniciar o computador após a instalação.

### Passo 4: Verificar a instalação
Abra o terminal do Windows (PowerShell ou Command Prompt) e execute o seguinte comando para verificar se o Docker foi instalado corretamente:

```bash
docker --version
```

Esse comando deve retornar a versão do Docker instalada.

## **4. Configurando o Docker para Rodar o Projeto**

Agora que o Docker está instalado, vamos configurar o projeto Streamlit criado no primeiro módulo para rodar em um contêiner Docker.

### Passo 1: Criar o arquivo Dockerfile
Dentro do diretório do projeto, crie um arquivo chamado `Dockerfile` sem extensão e adicione o seguinte conteúdo:

```Dockerfile
# Use a imagem oficial do Python como base
FROM python:3.10-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo requirements.txt e o código para o contêiner
COPY requirements.txt requirements.txt
COPY . .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta que será usada pela aplicação Streamlit
EXPOSE 8501

# Define o comando para rodar a aplicação
CMD ["streamlit", "run", "app.py"]
```

### Passo 2: Criar o arquivo requirements.txt
Se ainda não tiver um arquivo `requirements.txt`, crie um e adicione o Streamlit como dependência:

```txt
streamlit
```

### Passo 3: Construir a imagem Docker
No terminal, navegue até a pasta do projeto e execute o seguinte comando para construir a imagem Docker:

```bash
docker build -t meu_primeiro_deploy .
```

Esse comando cria uma imagem Docker chamada `meu_primeiro_deploy` baseada no `Dockerfile`.

### Passo 4: Rodar o contêiner Docker
Depois de construir a imagem, execute o seguinte comando para rodar o contêiner:

```bash
docker run -p 8501:8501 meu_primeiro_deploy
```

Este comando inicia o contêiner e mapeia a porta 8501 do contêiner para a porta 8501 do host, permitindo que você acesse a aplicação Streamlit no navegador através do endereço [http://localhost:8501](http://localhost:8501).

### Passo 5: Verificar a aplicação
Abra o navegador e acesse [http://localhost:8501](http://localhost:8501) para ver a aplicação Streamlit rodando dentro do contêiner Docker.

## **Conclusão**

Neste módulo, você aprendeu o que é Docker, como instalar Docker no Windows, por que usar Docker em seus projetos, e como configurar o Docker para rodar o projeto Streamlit criado no primeiro módulo. Com Docker, você pode garantir que sua aplicação funcione de maneira consistente em qualquer ambiente, facilitando o deploy e o gerenciamento do seu projeto.

---

Esse segundo módulo fornece uma introdução completa ao Docker, desde a instalação até a execução do projeto em um contêiner.