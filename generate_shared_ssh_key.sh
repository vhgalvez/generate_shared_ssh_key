#!/bin/bash

# Salir ante errores
set -euo pipefail

# Configuración
PROJECT_NAME="cluster_openshift"
KEY_NAME="id_rsa_shared_cluster"
SSH_EMAIL="vhgalvez@gmail.com"
SSH_DIR="/root/.ssh/${PROJECT_NAME}/shared"
SSH_PRIVATE_KEY="${SSH_DIR}/${KEY_NAME}"
SSH_PUBLIC_KEY="${SSH_PRIVATE_KEY}.pub"

# Crear directorio si no existe
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Eliminar claves existentes (opcional, forzar regeneración manual)
rm -f "$SSH_PRIVATE_KEY" "$SSH_PUBLIC_KEY"

# Generar clave nueva
echo "🔐 Generando nueva clave SSH compartida..."
ssh-keygen -t rsa -b 2048 -N '' -f "$SSH_PRIVATE_KEY" -C "$SSH_EMAIL"

# Establecer permisos correctos
chmod 600 "$SSH_PRIVATE_KEY"
chmod 644 "$SSH_PUBLIC_KEY"

# Mostrar información
echo -e "\n✅ Clave SSH generada correctamente:"
ls -l "$SSH_PRIVATE_KEY" "$SSH_PUBLIC_KEY"

# Mostrar contenido de clave pública para copiar a authorized_keys o Terraform
echo -e "\n📋 Clave pública (pega esto en Terraform o Ansible):"
cat "$SSH_PUBLIC_KEY"
