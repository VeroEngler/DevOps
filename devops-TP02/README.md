# TP02 — Gestión de usuarios y permisos en Linux

Configuración de un usuario de sistema con permisos granulares para deploy automatizado.

## Escenario

Usuario `devops-deploy` que puede ejecutar scripts y escribir logs, pero **no puede modificar archivos de configuración** ni usar sudo. Patrón real usado en pipelines CI/CD.

## Modelo de permisos

| Recurso | Propietario | Grupo | Permisos | devops-deploy puede |
|---|---|---|---|---|
| `/opt/deploy-app/scripts` | devops-deploy | deploy-team | 750 | leer + ejecutar |
| `/opt/deploy-app/logs` | devops-deploy | deploy-team | 770 | leer + escribir |
| `/opt/deploy-app/config` | root | deploy-team | 750 | solo leer |

## Uso

Ejecutar en bash
# Crear usuario y estructura
sudo groupadd deploy-team
sudo useradd --create-home --shell /bin/bash --groups deploy-team devops-deploy

# Verificar permisos
bash scripts/verificar-permisos.sh
Resultado de la auditoría
[OK]  Usuario 'devops-deploy' existe
[OK]  Grupo 'deploy-team' existe
[OK]  /opt/deploy-app/scripts → 750
[OK]  /opt/deploy-app/logs    → 770
[OK]  /opt/deploy-app/config  → 750
[OK]  Puede LEER config
[OK]  No puede ESCRIBIR config (correcto)
[OK]  Puede ESCRIBIR logs
[OK]  Sin privilegios sudo
