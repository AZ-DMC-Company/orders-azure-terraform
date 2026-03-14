# Orders Azure Terraform Project

Este repositorio contiene la infraestructura como código para el proyecto académico **Orders App** en Azure.

El proyecto utiliza:

- **Terraform** para crear y destruir recursos en Azure  
- **GitHub Actions** para CI/CD  
- **Container Apps** para desplegar backend, frontend, base de datos y monitorización  
- **Backend remoto en Azure Storage** para el state de Terraform  

---

## 📂 Estructura del repositorio

### Backend de Terraform (state)

backend/
└─ main.tf                # Crea Resource Group + Storage Account + Container para tfstate

### Infraestructura de la aplicación

infrastructure/
├─ providers.tf           # Provider + backend remoto
├─ variables.tf           # Variables de RG y CAE
├─ main.tf                # Contenedor App Environment + placeholder para la app
├─ rg.tf                  # Resource Group de la aplicación
├─ backend.tf             # Contenedor Java Spring API
├─ frontend.tf            # Contenedor Angular
├─ mysql.tf               # Contenedor MySQL + volumen
├─ prometheus.tf          # Contenedor Prometheus
├─ grafana.tf             # Contenedor Grafana

### Workflows de GitHub Actions

.github/workflows/
├─ backend-create.yml     # Crea backend de Terraform (RG + Storage + Container)
├─ backend-destroy.yml    # Destruye backend (usa Terraform, funciona con backend remoto)
├─ delete-rg.yml          # Borra RG del backend directamente con Azure CLI (sin depender del state)
├─ deploy-app.yml         # Despliega infraestructura de la aplicación (CAE + 4 contenedores)
├─ destroy-app.yml        # Destruye infraestructura de la aplicación

---

## ⚡ Flujo de uso recomendado

1. Ejecutar **backend-create.yml** para crear el backend remoto  
2. Ejecutar **deploy-app.yml** para crear el Resource Group de la aplicación, CAE y contenedores  
3. Ejecutar **destroy-app.yml** para destruir la infraestructura de la aplicación  
4. Ejecutar **backend-destroy.yml** para destruir el backend de Terraform  
5. Si algo falla y no hay state, usar **delete-rg.yml** para limpiar el RG del backend directamente  

---

## 📌 Notas importantes

- Frontend y Grafana son **públicos**  
- Backend, MySQL y Prometheus son **internos** al CAE  
- Todas las imágenes de contenedores están en **DockerHub público**  
- CPU y memoria se minimizan para **proyecto académico**, evitando costos innecesarios  
- Todos los workflows usan el **Service Principal configurado como `AZURE_CREDENTIALS`** para autenticar con Azure