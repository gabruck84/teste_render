# Use a imagem oficial do Selenium com o Chrome já instalado
FROM selenium/standalone-chrome:latest

# Instalar as dependências do Python
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copiar o código da aplicação Flask para o contêiner
COPY app.py /app/

# Definir o diretório de trabalho
WORKDIR /app

# Rodar a aplicação Flask
CMD ["python", "app.py"]
