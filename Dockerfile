# Use a imagem base do Python
FROM python:3.9-slim

# Instale as dependências
RUN pip install streamlit pandas pyarrow

COPY ./app.py /app/app.py

WORKDIR /app

# Define o comando para rodar a aplicação na porta 80
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]