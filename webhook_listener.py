from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/', methods=['POST'])
def webhook():
    data = request.json
    print("Received alert:", data)
    # Run the Ansible playbook to self-heal NGINX using the full path
    subprocess.call(["/usr/bin/ansible-playbook", "heal_nginx.yml"])
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)

