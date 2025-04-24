# 🛠️ Self-Healing Infrastructure with Prometheus, Alertmanager & Ansible

## ✅ Objective

Automatically detect service failures (e.g., NGINX down) and recover them using Prometheus alerts and Ansible automation.

---

## 🧰 Tools Used

- Prometheus
- Alertmanager
- Blackbox Exporter
- Ansible
- Flask (Webhook Listener)
- Ubuntu VM / Docker

---

## 🚀 Step-by-Step Commands

### 1. 📦 Install Required Packages

```bash
sudo apt update
sudo apt install nginx ansible python3-pip -y
pip install flask


### 2. 🔧 Download & Extract Prometheus, Alertmanager, and Blackbox Exporter

wget https://.../prometheus.tar.gz
tar -xvf prometheus.tar.gz

wget https://.../alertmanager.tar.gz
tar -xvf alertmanager.tar.gz

wget https://.../blackbox_exporter.tar.gz
tar -xvf blackbox_exporter.tar.gz

### 3. 📡 Start Blackbox Exporter
cd blackbox_exporter-*
nohup ./blackbox_exporter > ../../blackbox_exporter.log 2>&1 &

4. 📈 Start Prometheus

cd prometheus-*
nohup ./prometheus --config.file=../../prometheus.yml > ../../prometheus.log 2>&1 &

5. 📣 Start Alertmanager
cd alertmanager-*
nohup ./alertmanager --config.file=../../alertmanager.yml > ../../alertmanager.log 2>&1 &

6. 🧠 Start Flask Webhook Listener
cd webhook
nohup python3 webhook_listener.py > webhook.log 2>&1 &

7. 🤖 Test Ansible Playbook Manually
ansible-playbook restart-nginx.yml

8. 🔥 Simulate NGINX Failure
sudo systemctl stop nginx
This triggers the alert and auto-recovery via Ansible.

9. 🧪 Check Services (Optional Debugging)
sudo lsof -i :80      # NGINX
sudo lsof -i :9090    # Prometheus
sudo lsof -i :9093    # Alertmanager
sudo lsof -i :9115    # Blackbox Exporter

10. 🖼️ Screenshots
Please refer to the screenshots below to see the monitoring, alert triggering, and self-healing actions in real-time and as project completion.

📂 Deliverables
✅ Prometheus configuration (prometheus.yml)
✅ Alertmanager webhook config (alertmanager.yml)
✅ Flask webhook listener (webhook_listener.py)
✅ Ansible playbook (restart-nginx.yml)
✅ Screenshots of failure and recovery flow



