# InkaPark

**InkaPark** es un sistema web para un parque temático inspirado en la cultura inca. La aplicación permite presentar información del parque, registrar visitantes, iniciar sesión, comprar tickets y gestionar operaciones administrativas.

El objetivo principal es brindar una experiencia digital clara para los visitantes y una herramienta práctica para el equipo del parque.

> ℹ️ Para procesos completos de instalación, uso y gestión, consulta la documentación incluida en `docs/`.
---
## Tabla de contenido

- [Acerca del proyecto](#acerca-del-proyecto)
- [Funcionalidades principales](#funcionalidades-principales)
- [Tecnologías utilizadas](#tecnologías-utilizadas)
- [Arquitectura general](#arquitectura-general)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Requisitos previos](#requisitos-previos)
- [Instalación rápida](#instalación-rápida)
- [Configuración](#configuración)
- [Ejecución](#ejecución)
- [GitHub Actions](#github-actions)
- [Documentación](#documentación)
- [Flujo de trabajo](#flujo-de-trabajo)
- [Autores](#autores)
- [Proyecto académico](#proyecto-académico)
- [Colaboración](#colaboración)
---
## Acerca del proyecto

InkaPark está desarrollado con **Java 21**, **Spring Boot**, **Maven**, **Thymeleaf** y **MySQL/MariaDB**. El sistema organiza la atención digital del parque mediante páginas públicas, autenticación, compra de entradas, control de aforo, envío de correos, generación de PDF y administración interna.

| Tipo de usuario | Uso dentro del sistema |
|---|---|
| Visitante / cliente | Consulta el sitio, crea una cuenta, inicia sesión y compra tickets. |
| Administrador | Ingresa al panel privado para gestionar usuarios, tickets y mensajes. |
---
## Funcionalidades principales

| Funcionalidad | Descripción |
|---|---|
| Página principal | Presenta la portada y accesos a secciones del parque. |
| Atracciones | Muestra atracciones temáticas disponibles en el sitio. |
| Contacto | Permite enviar mensajes desde un formulario público. |
| Registro de usuarios | Permite crear cuentas de cliente con correo Gmail. |
| Verificación por correo | Envía enlaces para activar cuentas registradas. |
| Inicio de sesión | Permite acceder como cliente o administrador según el rol. |
| Compra de tickets | Permite seleccionar fecha, cantidad y pagar con tarjeta. |
| Panel administrativo | Permite gestionar usuarios, tickets y mensajes. |
---
## Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| Java 21 | Lenguaje principal del backend. |
| Spring Boot 3.5.6 | Framework base de la aplicación. |
| Spring Data JPA | Persistencia con entidades y repositorios. |
| Thymeleaf | Plantillas HTML renderizadas por servidor. |
| Maven | Gestión de dependencias y empaquetado. |
| MySQL / MariaDB | Base de datos relacional. |
| GitHub Actions | Automatización de integración y entrega. |
---
## Arquitectura general
```text
Usuario
  ↓
Navegador web
  ↓
Spring Boot
  ↓
Controladores MVC
  ↓
Servicios de negocio
  ↓
Repositorios JPA
  ↓
MySQL / MariaDB
```
---
## Estructura del proyecto
```text
.
├── .github/workflows/             # Automatización CI/CD
├── database/                      # Script SQL de base de datos
├── docs/                          # Manuales del proyecto
├── src/main/java/.../controlador/ # Controladores web
├── src/main/java/.../servicio/    # Lógica de negocio
├── src/main/resources/templates/  # Vistas Thymeleaf
├── README-EJECUCION.md            # Guía para ejecutar el artifact
├── README.md                      # Página principal
└── pom.xml                        # Configuración Maven
```
| Carpeta | Finalidad |
|---|---|
| `.github/workflows/` | Define los workflows CI y CD. |
| `database/` | Incluye `inkapark.sql` para importar la base de datos. |
| `docs/` | Contiene los manuales de GitHub y usuario. |
| `src/` | Agrupa código Java, plantillas y recursos estáticos. |
---
## Requisitos previos

| Requisito | Detalle |
|---|---|
| Java JDK | 21 o superior. |
| Git | Para clonar y trabajar con el repositorio. |
| MySQL / MariaDB | Motor de base de datos. |
| XAMPP | Opción práctica para ejecutar MySQL localmente. |
---
## Instalación rápida

1. Clona el repositorio:
```bash
git clone URL_DEL_REPOSITORIO
cd Plataforma-Web-Inkpark-Parque-de-atracciones
```
2. Crea la base de datos `inkapark`.
3. Importa el script `database/inkapark.sql`.
4. Crea tu archivo de configuración desde la plantilla:
```bash
cp src/main/resources/application-example.properties application.properties
```
5. Completa los valores locales de base de datos y correo.
6. Ejecuta la aplicación y abre `http://localhost:8080`.
---
## Configuración

`src/main/resources/application-example.properties` funciona como plantilla. Crea `application.properties` y utiliza valores propios de tu entorno:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/inkapark?useSSL=false&serverTimezone=America/Lima
spring.datasource.username=USUARIO_BASE_DATOS
spring.datasource.password=CONTRASENA_BASE_DATOS
spring.mail.username=CORREO_GMAIL
spring.mail.password=CONTRASENA_DE_APLICACION
```
---
## Ejecución

### Desde el código fuente

Ejecuta el proyecto con Maven desde la raíz:
```bash
mvn spring-boot:run
```
También puedes ejecutar la clase principal desde un IDE:
```text
src/main/java/com/example/Inkapark/InkaparkApplication.java
```
### Desde el archivo .jar generado por GitHub Actions

Descarga el artifact `inkapark-aplicacion` desde GitHub Actions y ejecuta el `.jar` con configuración externa:
```bash
java -jar "Inkapark-0.0.1-SNAPSHOT.jar" --spring.config.additional-location=file:./application.properties
```
---
## GitHub Actions

| Workflow | Propósito |
|---|---|
| CI - Inkapark | Compila el proyecto en pushes y Pull Requests dirigidos a `master`. |
| CD - Inkapark | Genera el `.jar`, prepara el paquete de ejecución y publica el artifact. |

El artifact `inkapark-aplicacion` incluye el `.jar`, `application-example.properties`, `README-EJECUCION.md` y `database/inkapark.sql`.
---
## Documentación

| Documento | Descripción |
|---|---|
| [`docs/Manual_GitHub.md`](docs/Manual_GitHub.md) | Gestión del proyecto mediante Git, GitHub, Pull Requests, Projects y Actions. |
| [`docs/Manual_Usuario.md`](docs/Manual_Usuario.md) | Instalación, configuración, ejecución y uso del sistema. |
| [`README-EJECUCION.md`](README-EJECUCION.md) | Guía rápida para ejecutar el artifact descargado desde GitHub Actions. |
---
## Flujo de trabajo
```text
Issue → Branch → Desarrollo → Commit → Push → Pull Request → GitHub Actions → Merge
```
| Paso | Descripción |
|---|---|
| Issue | Registra la tarea o mejora. |
| Branch | Crea una rama `feature/` o `fix/`. |
| Desarrollo | Realiza el cambio correspondiente. |
| Commit | Guarda avances con mensajes claros. |
---
## Autores

| Integrante | Participación |
|---|---|
| Rodrigo Esteban / Rodrigo Rubina | Desarrollo y documentación del proyecto. |
| RK-byte07 | Desarrollo y mantenimiento del proyecto. |
---
## Proyecto académico

InkaPark fue desarrollado con fines académicos como proyecto web con Java, Spring Boot, Maven, MySQL, HTML, CSS, JavaScript, GitHub Projects y GitHub Actions.
---
## Colaboración

1. Crea un **Issue** para reportar errores, registrar mejoras o documentar una tarea.
2. Revisa **GitHub Projects** para conocer el avance del trabajo.
3. Crea una rama descriptiva para desarrollar tu cambio.
4. Sube tus commits y abre un **Pull Request** hacia `master`.
5. Espera la validación de GitHub Actions y la revisión del equipo.
