# 🔐 generate_shared_ssh_key.sh

Este script genera una **clave SSH compartida** para ser utilizada con todas tus máquinas virtuales del clúster (Flatcar, CoreOS, etc.).

Ideal para entornos automatizados con Terraform, Ansible o configuración manual.

---

## ✅ ¿Qué hace?

- Genera una nueva clave SSH RSA (2048 bits).
- Guarda la clave privada y pública en:
  - 🔐 `/root/.ssh/cluster_openshift/shared/id_rsa_shared_cluster`
  - 🔓 `/root/.ssh/cluster_openshift/shared/id_rsa_shared_cluster.pub`
- Te muestra la clave pública para que la puedas copiar fácilmente.

---

## 💡 Cómo usarlo

```bash
chmod +x generate_shared_ssh_key.sh
sudo ./generate_shared_ssh_key.sh
```

---

## 📁 Archivos generados

| Tipo       | Ruta                                                                 |
|------------|----------------------------------------------------------------------|
| 🔐 Privada | `/root/.ssh/cluster_openshift/shared/id_rsa_shared_cluster`         |
| 🔓 Pública | `/root/.ssh/cluster_openshift/shared/id_rsa_shared_cluster.pub`     |

---

## 🧩 ¿Y luego qué?

### Si usas **Terraform**:
1. Copia el contenido de la clave pública generada.
2. Pégala en el archivo `terraform.tfvars` así:

```hcl
ssh_keys = ["ssh-rsa AAAAB3Nza... tu_clave_aquí ... vhgalvez@gmail.com"]
```

### Si usas **Ansible**:
Usa un playbook para distribuir la nueva clave a todas las VMs en `/home/core/.ssh/authorized_keys`.

¿Necesitas un ejemplo de playbook para eso? ¡Pídelo! 😉

---

## ✍️ Autor

- ✉️ [vhgalvez@gmail.com](mailto:vhgalvez@gmail.com)
- 🛠️ Proyecto: `cluster_openshift`
