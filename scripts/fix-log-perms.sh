#!/bin/bash
# Hotfix: Corrige permisos de /opt/deploy-app/logs
# Detectado en produccion -- Ticket #42
chmod 770 /opt/deploy-app/logs
chown devops-deploy:deploy-team /opt/deploy-app/logs
echo "[$(date)] Permisos de logs corregidos" >> /var/log/hotfix.log
