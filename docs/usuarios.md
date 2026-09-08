# Gestion de Usuarios

## Patron: Usuario de deploy con minimo privilegio

- Usuario: 'devops-deploy'
- Grupo: 'deploy-team'
- Puede: Ejecutar scripts, escribir logs, leer config.
- No puede: Modificar config, usar sudo
