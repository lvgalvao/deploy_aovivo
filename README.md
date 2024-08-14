# **Workshop: Nosso Primeiro Deploy**

Este repositório contém o código e as instruções para o workshop "Nosso Primeiro Deploy", onde aprenderemos a configurar um ambiente de desenvolvimento, versionar o código com Git e fazer o deploy de uma aplicação simples usando o Streamlit.

## **1. Criando Nossa Pasta de Trabalho**

### Passo 1: Criar a pasta do projeto
Primeiro, vamos criar a pasta onde todo o trabalho será realizado e entrar nela:

```bash
mkdir meu_primeiro_deploy
cd meu_primeiro_deploy
```

### Passo 2: Inicializar um projeto Python
Agora, vamos criar um ambiente virtual Python para isolar nossas dependências e ativá-lo:

```bash
python -m venv venv
source venv/bin/activate   # Para Linux/Mac
venv\Scripts\activate      # Para Windows
```

### Passo 3: Criar um projeto Streamlit
Instale o Streamlit e crie o arquivo principal do projeto:

```bash
pip install streamlit
touch app.py
```

## **2. Entendendo o Projeto**

### O que queremos fazer nesse projeto?
O objetivo deste projeto é criar uma aplicação simples em Python usando o Streamlit. A aplicação permitirá que os usuários interajam com um formulário e vejam os resultados em tempo real.

### O que são estados no contexto de controle de versão?
No Git, o "estado" refere-se ao status atual dos arquivos no repositório. À medida que fazemos alterações no código, é crucial registrar essas mudanças através de commits, garantindo que cada passo no desenvolvimento seja documentado. Isso nos permite acompanhar a evolução do projeto, reverter para versões anteriores se necessário, e colaborar de forma eficaz com outros desenvolvedores.

## **3. Comandos Básicos do Terminal**

### Passo 4: Navegando pelo terminal
Para gerenciar o projeto, usaremos alguns comandos básicos do terminal:

```bash
cd caminho/para/sua/pasta   # Mudar de diretório
ls                          # Listar arquivos no diretório
pwd                         # Mostrar o caminho completo do diretório atual
```

## **4. Comandos Básicos do Git**

### Passo 5: Iniciando o repositório Git
Dentro da pasta do projeto, inicialize um repositório Git para começar a versionar o código:

```bash
git init
git status
```

### Passo 6: Adicionando arquivos ao Git
Adicione o arquivo `app.py` ao controle de versão para começar a rastrear suas mudanças:

```bash
git add app.py
git status
```

### Passo 7: Fazendo o primeiro commit
Faça seu primeiro commit para registrar o estado inicial do projeto:

```bash
git commit -m "Primeiro commit - setup inicial do projeto"
```

## **5. Configurações Globais do Git**

### Passo 8: Configurar nome de usuário e email no Git
Configure seu nome de usuário e email para que seus commits possam ser identificados corretamente:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seuemail@example.com"
```

### Passo 9: Verificando o histórico de commits
Veja o histórico de commits para acompanhar as mudanças realizadas no projeto:

```bash
git log
```

## **6. Modificando Arquivos e Usando Git**

### Passo 10: Modificando e adicionando novos arquivos
Edite o arquivo `app.py` e adicione novos arquivos ao projeto. Depois de fazer essas alterações, verifique o status do repositório:

```bash
git status
```

### Passo 11: Adicionar um novo arquivo
Adicione um novo arquivo ao repositório e veja como o Git rastreia essas mudanças:

```bash
touch novo_arquivo.txt
git add novo_arquivo.txt
git status
```

### Passo 12: Usando `git reset` e `git restore`
Se você decidir que quer desfazer alterações que ainda não foram commitadas, pode usar os seguintes comandos:

```bash
git reset
git restore --staged novo_arquivo.txt
```

Esses comandos permitem que você remova arquivos da área de stage e reverta mudanças que não foram ainda commitadas.

### Passo 13: Resetando para um commit anterior
Se você precisar reverter o projeto para um estado anterior, pode usar o `git reset` com a hash de um commit específico:

```bash
git reset --hard <hash_do_commit>
```

Este comando resetará o estado do repositório para o estado do commit especificado.

## **7. Publicando o Código no GitHub**

### Passo 14: Criando um repositório no GitHub
1. Acesse o [GitHub](https://github.com/) e faça login na sua conta.
2. No canto superior direito, clique no ícone "+" e selecione "New repository".
3. Dê um nome ao seu repositório, como `meu_primeiro_deploy`, e clique em "Create repository".

### Passo 15: Conectando o repositório local ao GitHub
Volte ao terminal e conecte seu repositório local ao repositório que você acabou de criar no GitHub:

```bash
git remote add origin https://github.com/seuusuario/meu_primeiro_deploy.git
git branch -M main
```

### Passo 16: Fazendo o primeiro push para o GitHub
Envie seu código para o GitHub com o comando:

```bash
git push -u origin main
```

Agora, seu código está publicado no GitHub e você pode acessá-lo de qualquer lugar. 

### Passo 17: Fazendo atualizações e novos pushes
Quando fizer alterações no código e quiser enviá-las para o GitHub, use os seguintes comandos:

```bash
git add .
git commit -m "Descrição das alterações"
git push origin main
```

Esses comandos irão adicionar as novas mudanças ao seu repositório no GitHub.

## **8. Rodando a Aplicação Streamlit**

### Passo 18: Escrevendo o código "Hello World"
No arquivo `app.py`, adicione o seguinte código para criar uma aplicação simples que exibe "Hello, World!" na interface:

```python
import streamlit as st

st.title("Hello, World!")
st.write("Bem-vindo ao nosso primeiro deploy com Streamlit!")
```

### Passo 19: Executando o aplicativo
Agora que configuramos o ambiente e versionamos o código, podemos rodar a aplicação Streamlit:

```bash
streamlit run app.py
```

Isso abrirá uma janela do navegador onde você verá a aplicação em funcionamento, exibindo a mensagem "Hello, World!" junto com uma saudação adicional.

## **Conclusão**

Este README fornece um guia passo a passo para configurar um ambiente de desenvolvimento em Python, usar Git para controlar versões, publicar seu código no GitHub e rodar uma aplicação Streamlit. Com essas ferramentas, você pode começar a desenvolver e implantar aplicações de forma eficiente, garantindo que cada alteração no código seja registrada e segura.