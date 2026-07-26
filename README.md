# 🚀 Inception

<div align="center">

<img src="https://img.shields.io/badge/42-Inception-black?style=for-the-badge&logo=42">
<img src="https://img.shields.io/badge/Docker-Containers-blue?style=for-the-badge&logo=docker">
<img src="https://img.shields.io/badge/Nginx-Web%20Server-green?style=for-the-badge&logo=nginx">
<img src="https://img.shields.io/badge/WordPress-PHP-orange?style=for-the-badge&logo=wordpress">

</div>

## 📌 Descripción

**Inception** es un proyecto de la escuela 42 cuyo objetivo es construir una pequeña infraestructura utilizando **Docker**, creando y gestionando diferentes servicios aislados mediante contenedores.

El objetivo principal es entender cómo funcionan los servicios web modernos:

* Servidores HTTP
* Bases de datos
* CMS
* Redes internas entre contenedores
* Persistencia de datos
* Administración de servicios
* Seguridad mediante TLS

La infraestructura creada simula una arquitectura real de producción utilizando múltiples contenedores comunicándose entre ellos.

---

# 🏗️ Arquitectura

La infraestructura está formada por diferentes servicios independientes:

```text
                         Internet
                            |
                            |
                         HTTPS :443
                            |
                            v

                       +-----------+
                       |   NGINX   |
                       | TLS Proxy |
                       +-----------+
                            |
                            |
                       +------------+
                       | WordPress  |
                       | PHP-FPM    |
                       +------------+
                            |
                            |
                       +------------+
                       |  MariaDB   |
                       | Database   |
                       +------------+


          Bonus services:

          +-------------+
          | Redis Cache |
          +-------------+

          +-------------+
          |  Adminer    |
          +-------------+

          +-------------+
          | FTP Server  |
          +-------------+
```

---

# 🐳 Servicios principales

## 🌐 NGINX

Servidor web encargado de:

* Gestionar conexiones HTTPS
* Terminar conexiones TLS
* Servir como reverse proxy
* Comunicarse con WordPress mediante FastCGI

Características:

* TLS configurado con certificado propio
* Solo acepta conexiones HTTPS
* Configuración personalizada

---

## 📝 WordPress

CMS utilizado para crear la aplicación web.

Configurado con:

* PHP-FPM
* Usuarios iniciales
* Variables de entorno
* Conexión automática con MariaDB

WordPress se comunica únicamente con los servicios necesarios dentro de la red Docker.

---

## 🗄️ MariaDB

Base de datos utilizada por WordPress.

Incluye:

* Creación automática de base de datos
* Usuario dedicado
* Persistencia mediante volúmenes Docker

Los datos sobreviven al reinicio de los contenedores.

---

# ⭐ Bonus Implementados

## ⚡ Redis Cache

Sistema de caché utilizado para mejorar el rendimiento de WordPress.

Arquitectura:

```text
Usuario
  |
  v
NGINX
  |
  v
WordPress
  |
  v
Redis
```

Beneficios:

* Reduce consultas repetidas a la base de datos
* Mejora tiempos de respuesta
* Almacena datos temporales en memoria

---

## 📁 FTP Server

Servidor FTP añadido para gestionar archivos del servidor.

Permite:

* Subida de archivos
* Gestión remota del contenido
* Acceso controlado mediante usuarios

Utilizado para administrar recursos del entorno WordPress.

---

## 🛠️ Adminer

Herramienta web para administrar MariaDB.

Permite:

* Visualizar bases de datos
* Ejecutar consultas SQL
* Gestionar tablas
* Inspeccionar datos de WordPress

Arquitectura:

```text
Browser
   |
   v
Adminer
   |
   v
MariaDB
```

---



# 🚀 Ejecución

Construir los contenedores:

```bash
make
```

o directamente:

```bash
docker compose up --build
```

Comprobar los servicios:

```bash
docker ps
```

---

# 🧹 Gestión del proyecto

Parar los servicios:

```bash
make down
```

Eliminar contenedores:

```bash
docker compose down
```

Reconstruir completamente:

```bash
make re
```

Ver logs:

```bash
docker compose logs -f
```

---

# 🔐 Seguridad

Medidas implementadas:

✅ HTTPS mediante TLS
✅ Certificados SSL propios
✅ Red Docker privada entre servicios
✅ Variables sensibles separadas mediante secrets
✅ Servicios aislados en contenedores independientes

---

# 📚 Conceptos aprendidos

Durante este proyecto se trabajan conceptos fundamentales:

## Docker

* Creación de imágenes
* Dockerfiles
* Volúmenes
* Redes internas
* Contenedores

## Administración Linux

* Procesos
* Servicios
* Permisos
* Configuración de servidores

## Redes

* Puertos
* DNS interno Docker
* Comunicación entre contenedores

## Servicios Web

* NGINX
* PHP-FPM
* WordPress
* MariaDB

---

# 🧠 Retos del proyecto

Algunos de los principales retos fueron:

* Diseñar una arquitectura multi-contenedor
* Gestionar correctamente la comunicación entre servicios
* Mantener persistencia de datos
* Configurar HTTPS correctamente
* Automatizar la creación del entorno

---

# 📸 Resultado final

Infraestructura completa ejecutándose:

```text
Docker Compose

 ├── nginx
 │     └── HTTPS
 │
 ├── wordpress
 │     └── PHP-FPM
 │
 ├── mariadb
 │     └── Database
 │
 ├── redis
 │     └── Cache
 │
 ├── adminer
 │     └── Database UI
 │
 └── ftp
       └── File Management
```

---

<div align="center">

**Built with 🐳 Docker and ☕ perseverance at 42**

</div>
