#!/bin/bash

echo "🚀 Starting NGINX (if not already running)..."
sudo systemctl start nginx

echo "📡 Starting Blackbox Exporter..."
cd ~/Self-Healing-Infrastructure-Prometheus-project1/blackbox_exporter-0.25.0.linux-amd64
nohup ./blackbox_exporter > ../../blackbox.log 2>&1 &

echo "📈 Starting Prometheus..."
cd ~/Self-Healing-Infrastructure-Prometheus-project1/prometheus-2.52.0.linux-amd64
nohup ./prometheus --config.file=../../prometheus.yml > ../../prometheus.log 2>&1 &

echo "📣 Starting Alertmanager..."
cd ~/Self-Healing-Infrastructure-Prometheus-project1/alertmanager-0.27.0.linux-amd64
nohup ./alertmanager --config.file=../../alertmanager.yml > ../../alertmanager.log 2>&1 &

echo "🧠 Starting Flask Webhook Listener..."
cd ~/Self-Healing-Infrastructure-Prometheus-project1/webhook
nohup python3 webhook_listener.py > ../webhook.log 2>&1 &

echo "✅ All services launched!"
