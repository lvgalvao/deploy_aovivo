# Use a imagem base do Python
FROM python:3.9-slim

# Instale as dependências
RUN pip install streamlit pandas pyarrow

COPY ./app.py /app/app.py

WORKDIR /app

ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
