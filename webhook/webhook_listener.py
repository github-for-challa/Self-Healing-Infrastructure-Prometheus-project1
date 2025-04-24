from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/alert', methods=['POST'])
def alert():
    # When Alertmanager sends an alert
    data = request.json
    print("Received alert:", data)

    # You can trigger recovery or other actions here using subprocess or other means
    # For example, restarting a service:
    subprocess.run(["sudo", "systemctl", "restart", "nginx"])

    return "Alert received", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
