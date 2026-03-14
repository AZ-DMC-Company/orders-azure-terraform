# Orders Azure Terraform Project

Este repositorio contiene la infraestructura como codigo para el proyecto academico **Orders App** en Azure.

El proyecto utiliza:

- **Terraform** para crear y destruir recursos en Azure
- **GitHub Actions** para CI/CD
- **Container Apps** para desplegar backend, frontend, base de datos y monitorizacion
- **Backend remoto en Azure Storage** para el state de Terraform

--- 

## 📂 Estructura del repositorio

```text
orders-azure-terraform/
├── backend/
│   └── main.tf                         # Infraestructura del backend del state de Terraform
├── infrastructure/
│   ├── providers.tf                    # Provider de Azure + backend remoto
│   ├── variables.tf                    # Variables generales de la infraestructura
│   ├── rg.tf                           # Resource Group de la aplicación
│   ├── main.tf                         # Placeholder + CAE base
│   ├── backend.tf                      # Contenedor Backend Java Spring API
│   ├── frontend.tf                     # Contenedor Frontend Angular
│   ├── mysql.tf                        # Contenedor MySQL
│   ├── prometheus.tf                   # Contenedor Prometheus
│   └── grafana.tf                      # Contenedor Grafana
├── .github/
│   └── workflows/
│       ├── backend-create.yml          # Workflow para crear backend de Terraform
│       ├── backend-destroy.yml         # Workflow para destruir backend (cuando hay state remoto)
│       ├── delete-rg.yml               # Workflow para borrar RG del backend via CLI
│       ├── deploy-app.yml              # Workflow para desplegar infraestructura de la aplicación
│       └── destroy-app.yml             # Workflow para destruir infraestructura de la aplicación
└── README.md                           # Este archivo
```

--- 

## ⚡ Flujo de uso recomendado

1. Ejecutar **backend-create.yml** para crear el backend remoto
2. Ejecutar **deploy-app.yml** para crear el Resource Group de la aplicación, CAE y contenedores
3. Ejecutar **destroy-app.yml** para destruir la infraestructura de la aplicación
4. Ejecutar **backend-destroy.yml** para destruir el backend de Terraform
5. Si algo falla y no hay state, usar **delete-rg.yml** para limpiar el RG del backend directamente

--- 

## 📌 Notas importantes

- Frontend y Grafana son **visibles públicamente**
- Backend, MySQL y Prometheus son **internos** al Container Apps Environment
- Todas las imagenes de contenedores estan en **DockerHub público**
- Las configuraciones de CPU y memoria se minimizan para **proyecto academico**
- Todos los workflows usan el **Service Principal configurado como `AZURE_CREDENTIALS`** para autenticarse con Azure

