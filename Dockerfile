# Use a imagem base do Python
FROM python:3.9-slim

# Instale as dependências
RUN pip install streamlit pandas pyarrow

COPY ./app.py /app/app.py

WORKDIR /app

# Expõe a porta 80 que será usada pela aplicação Streamlit
EXPOSE 80

# Define o comando para rodar a aplicação na porta 80
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py", "--server.port=80", "--server.address=0.0.0.0"]