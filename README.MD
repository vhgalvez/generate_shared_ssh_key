
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

## 🔑 Acceso SSH a los Nodos Flatcar con Clave Compartida

Para acceder a una VM (por ejemplo `master1`) utilizando la clave compartida generada, ejecuta el siguiente comando:

```bash
ssh -i /root/.ssh/cluster_k3s/shared/id_rsa_shared_cluster core@10.17.4.21
```

### 🔐 Asegúrate de lo siguiente:

- ✅ El usuario `core` **existe** en la VM (por defecto en Flatcar).
- ✅ La **clave pública** correspondiente a la privada ha sido añadida al archivo:

```bash
/home/core/.ssh/authorized_keys
```

- ✅ Los **permisos** de la clave privada están correctamente configurados:

```bash
chmod 600 /root/.ssh/cluster_k3s/shared/id_rsa_shared_cluster
```

---

## ✍️ Autor

- ✉️ [vhgalvez@gmail.com](mailto:vhgalvez@gmail.com)
- 🛠️ Proyecto: `cluster_openshift`

---

## 🌐 Proyecto Principal

Este script forma parte del proyecto [FlatcarMicroCloud](https://github.com/vhgalvez/FlatcarMicroCloud), una infraestructura automatizada basada en K3s, Flatcar Linux, Terraform y Ansible.

¡Échale un vistazo para ver cómo se integra todo! 🚀