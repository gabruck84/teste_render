from flask import Flask, jsonify
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By


app = Flask(__name__)

@app.route('/test-selenium', methods=['GET'])
def test_selenium():
    # Configuração do WebDriver
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    options.add_argument("--no-sandbox") 
    options.add_argument("--incognito")# Rodar sem abrir a janela do navegador

    # Iniciar o WebDriver com o ChromeDriver gerenciado pelo webdriver-manager
    driver = webdriver.Chrome(options=options)

    # Abrir a página
    driver.get("https://google.com")

    # Verificar se o título da página contém 'Example Domain'
    page_title = driver.title

    # Fechar o navegador
    driver.quit()

    if "Example Domain" in page_title:
        return jsonify({"message": "Página carregada com sucesso!", "title": page_title}), 200
    else:
        return jsonify({"message": "Falha ao carregar a página!"}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
