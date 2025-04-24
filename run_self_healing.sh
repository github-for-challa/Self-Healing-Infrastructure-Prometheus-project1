#!/bin/bash

# Set working directory
cd ~/Self-Healing-Infrastructure-Prometheus-project1

echo "[*] Starting NGINX Docker container..."
docker start nginx 2>/dev/null || docker run -d --name nginx -p 80:80 nginx

echo "[*] Starting webhook listener (Flask app)..."
nohup python3 webhook_listener.py > webhook.log 2>&1 &

echo "[*] Starting Prometheus..."
cd prometheus-2.52.0.linux-amd64
nohup ./prometheus --config.file=../prometheus.yml > prometheus.log 2>&1 &

echo "[*] Starting Alertmanager..."
nohup ./alertmanager --config.file=../alertmanager.yml > alertmanager.log 2>&1 &

cd ..

echo "[✓] All services started. Access them at:"
echo "  - Prometheus: http://localhost:9090"
echo "  - Alertmanager: http://localhost:9093"
echo "  - Webhook listener: http://localhost:5001 (POST only)"
