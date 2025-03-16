# Usar a imagem oficial do Selenium com o Chrome já instalado
FROM selenium/standalone-chrome:latest

# Instalar o Python e dependências para criar ambiente virtual
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Criar e ativar o ambiente virtual
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Copiar o arquivo de dependências para o contêiner
COPY requirements.txt /app/

# Instalar as dependências do Python no ambiente virtual
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copiar o código da aplicação Flask para o contêiner
COPY app.py /app/

# Definir o diretório de trabalho
WORKDIR /app

# Rodar a aplicação Flask
CMD ["python", "app.py"]
