from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Bujji! Your Docker container is running successfully."

@app.route("/status")
def status():
    return "App is up and running smoothly! 🚀"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

