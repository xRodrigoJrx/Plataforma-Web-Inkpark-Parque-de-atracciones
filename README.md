# InkaPark

<div align="center">

**Sistema web para la gestión y compra de entradas de un parque temático inspirado en la cultura inca.**

`Java 21` · `Spring Boot 3.5.6` · `Maven` · `Thymeleaf` · `MySQL/MariaDB` · `GitHub Actions`

**InkaPark centraliza la experiencia del visitante y la administración operativa del parque en una aplicación web clara, mantenible y documentada.**

</div>

---

## Tabla de contenido

- [Descripción del proyecto](#descripción-del-proyecto)
- [Características principales](#características-principales)
- [Tecnologías utilizadas](#tecnologías-utilizadas)
- [Arquitectura general](#arquitectura-general)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Instalación rápida](#instalación-rápida)
- [Configuración](#configuración)
- [Ejecución](#ejecución)
- [GitHub Actions](#github-actions)
- [Documentación](#documentación)
- [Flujo de trabajo](#flujo-de-trabajo)
- [Requisitos](#requisitos)
- [Capturas del sistema](#capturas-del-sistema)
- [Contribución](#contribución)
- [Buenas prácticas](#buenas-prácticas)
- [Autores](#autores)
- [Licencia](#licencia)
- [Contacto](#contacto)

---

## Descripción del proyecto

**InkaPark** es una aplicación web desarrollada con Java y Spring Boot para apoyar la operación básica de un parque temático. El sistema permite que los visitantes consulten información del parque, se registren, verifiquen su cuenta por correo, inicien sesión y compren tickets con tarjeta. También incluye un panel administrativo para gestionar usuarios, revisar tickets vendidos/verificados y atender mensajes enviados desde el formulario de contacto.

El proyecto resuelve la necesidad de organizar en una sola plataforma los procesos de atención digital del parque: información pública, autenticación, venta de entradas, control de aforo, comunicación con visitantes y administración interna.

| Tipo de usuario | Uso principal |
|---|---|
| Visitante / cliente | Consulta páginas públicas, registra una cuenta, inicia sesión y compra tickets. |
| Administrador | Accede al panel administrativo para gestionar usuarios, tickets y mensajes. |

> ℹ️ **Nota:** Este README funciona como presentación ejecutiva del repositorio. Para procedimientos completos, consulte los manuales ubicados en [`docs/`](docs/).

---

## Características principales

| Funcionalidad | Estado |
|---|---|
| Página principal pública | ✅ Implementado |
| Página de atracciones | ✅ Implementado |
| Página “Nosotros” | ✅ Implementado |
| Formulario de contacto | ✅ Implementado |
| Registro de usuarios cliente | ✅ Implementado |
| Verificación de cuenta por correo | ✅ Implementado |
| Reenvío de enlace de verificación | ✅ Implementado |
| Inicio y cierre de sesión de cliente | ✅ Implementado |
| Compra de tickets con tarjeta | ✅ Implementado |
| Control de aforo para próximos días | ✅ Implementado |
| Generación de comprobante y boletos PDF | ✅ Implementado |
| Envío de comprobantes por correo | ✅ Implementado |
| Login administrativo | ✅ Implementado |
| Panel administrativo | ✅ Implementado |
| Gestión administrativa de usuarios | ✅ Implementado |
| Gestión y verificación administrativa de tickets | ✅ Implementado |
| Gestión y respuesta de mensajes de contacto | ✅ Implementado |
| Recuperación de contraseña | ❌ No evidenciado |
| Administración dinámica de atracciones | ❌ No evidenciado |
| Descarga pública directa de PDFs desde navegador | ❌ No evidenciado |

> ⚠️ **Importante:** Las funcionalidades marcadas como “No evidenciado” no se presentan como disponibles porque no se encontraron rutas, plantillas o servicios completos asociados en el código analizado.

---

## Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| Java 21 | Lenguaje y versión configurada del proyecto. |
| Spring Boot 3.5.6 | Framework principal de la aplicación web. |
| Spring MVC | Controladores y rutas para páginas públicas, autenticación, tickets y administración. |
| Spring Data JPA | Persistencia mediante repositorios y entidades JPA. |
| Thymeleaf | Renderizado de plantillas HTML del lado servidor. |
| Maven | Gestión de dependencias, compilación y empaquetado. |
| MySQL / MariaDB | Base de datos relacional del sistema. |
| XAMPP | Entorno recomendado para ejecutar MySQL localmente. |
| Bootstrap 5 | Estilos y componentes visuales en las plantillas. |
| Font Awesome | Iconografía de la interfaz. |
| OpenPDF | Generación de documentos PDF. |
| Spring Mail | Envío de correos de verificación, contacto y comprobantes. |
| GitHub Actions | Automatización de CI/CD y publicación de artifact. |

---

## Arquitectura general

```text
┌──────────────┐
│   Usuario    │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│  Navegador   │
│ HTML/CSS/JS  │
└──────┬───────┘
       │ HTTP
       ▼
┌──────────────────────────┐
│ Spring Boot / MVC        │
│ Controladores            │
└──────┬───────────────────┘
       │
       ▼
┌──────────────────────────┐
│ Servicios de negocio     │
│ Auth · Tickets · Email   │
│ PDF · Contacto · Usuario │
└──────┬───────────────────┘
       │
       ▼
┌──────────────────────────┐
│ Repositorios JPA         │
└──────┬───────────────────┘
       │
       ▼
┌──────────────────────────┐
│ MySQL / MariaDB          │
│ inkapark.sql             │
└──────────────────────────┘
```

---

## Estructura del proyecto

```text
.
├── .github/
│   └── workflows/              # Workflows CI/CD de GitHub Actions
├── database/
│   └── inkapark.sql            # Script de base de datos
├── docs/
│   ├── Manual_GitHub.md        # Manual técnico de Git/GitHub
│   └── Manual_Usuario.md       # Manual de instalación y uso del sistema
├── src/
│   ├── main/
│   │   ├── java/com/example/Inkapark/
│   │   │   ├── config/         # Configuración MVC, seguridad de acceso admin y password encoder
│   │   │   ├── controlador/    # Controladores web del sistema
│   │   │   ├── modelo/         # Entidades JPA
│   │   │   ├── repositorio/    # Repositorios Spring Data JPA
│   │   │   ├── servicio/       # Lógica de negocio
│   │   │   └── util/           # Utilidades para IDs y cifrado simple
│   │   └── resources/
│   │       ├── static/         # CSS, JavaScript, imágenes y tarjetas
│   │       ├── templates/      # Vistas Thymeleaf
│   │       ├── application-ci.properties
│   │       └── application-example.properties
│   └── test/                   # Prueba base de carga de contexto
├── README-EJECUCION.md         # Guía de ejecución local desde artifact
├── pom.xml                     # Configuración Maven
├── mvnw / mvnw.cmd             # Maven Wrapper
└── README.md                   # Página principal del repositorio
```

| Carpeta / archivo | Propósito |
|---|---|
| `.github/workflows/` | Define CI y CD del proyecto. |
| `database/` | Contiene el script SQL para crear/importar la base de datos. |
| `docs/` | Manuales detallados para GitHub y usuarios finales. |
| `src/main/java/.../controlador/` | Rutas y controladores MVC. |
| `src/main/java/.../servicio/` | Reglas de negocio: autenticación, tickets, correo, PDF y contacto. |
| `src/main/resources/templates/` | Páginas HTML Thymeleaf. |
| `src/main/resources/static/` | Recursos visuales y archivos estáticos. |
| `pom.xml` | Dependencias y configuración del build Maven. |

---

## Instalación rápida

1. Clonar el repositorio:

```bash
git clone URL_DEL_REPOSITORIO
cd Plataforma-Web-Inkpark-Parque-de-atracciones
```

2. Iniciar **MySQL** desde XAMPP o un servicio equivalente.

3. Crear una base de datos llamada:

```sql
inkapark
```

4. Importar el script:

```text
database/inkapark.sql
```

5. Crear un archivo `application.properties` a partir de la plantilla:

```bash
cp src/main/resources/application-example.properties application.properties
```

6. Ajustar usuario, contraseña, URL de base de datos y SMTP según el entorno local.

> 💡 **Recomendación:** Para instrucciones paso a paso, revise [`docs/Manual_Usuario.md`](docs/Manual_Usuario.md) y [`README-EJECUCION.md`](README-EJECUCION.md).

---

## Configuración

El repositorio incluye una plantilla segura de configuración:

```text
src/main/resources/application-example.properties
```

Esta plantilla contiene parámetros para:

| Sección | Configuración |
|---|---|
| Aplicación | Nombre del sistema y puerto local. |
| Base de datos | URL JDBC, usuario, contraseña y driver MySQL. |
| JPA/Hibernate | Actualización de esquema, dialecto y salida SQL. |
| URL base | Valor usado para enlaces como la verificación por correo. |
| SMTP | Host, puerto, usuario y contraseña de aplicación para envío de correos. |

Crear el archivo local:

```bash
cp src/main/resources/application-example.properties application.properties
```

Ejemplo de valores sin credenciales reales:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/inkapark?useSSL=false&serverTimezone=America/Lima
spring.datasource.username=USUARIO_BASE_DATOS
spring.datasource.password=CONTRASENA_BASE_DATOS
spring.mail.username=CORREO_GMAIL
spring.mail.password=CONTRASENA_DE_APLICACION
```

> ⚠️ **Importante:** No subir `application.properties` con credenciales reales al repositorio.

---

## Ejecución

### Opción 1: ejecutar desde IDE

1. Abrir el proyecto en un IDE compatible con Maven.
2. Configurar Java 21.
3. Verificar que MySQL esté activo y que la base `inkapark` exista.
4. Ejecutar la clase principal:

```text
src/main/java/com/example/Inkapark/InkaparkApplication.java
```

5. Abrir en el navegador:

```text
http://localhost:8080
```

### Opción 2: ejecutar desde artifact

El workflow de CD genera un paquete descargable con el `.jar`, la plantilla de configuración, la guía de ejecución y la base de datos.

1. Descargar el artifact `inkapark-aplicacion` desde GitHub Actions.
2. Crear `application.properties` junto al `.jar`.
3. Ejecutar:

```bash
java -jar "Inkapark-0.0.1-SNAPSHOT.jar" --spring.config.additional-location=file:./application.properties
```

4. Acceder a:

```text
http://localhost:8080
```

---

## GitHub Actions

El repositorio contiene dos workflows principales:

| Workflow | Archivo | Evento | Acción principal |
|---|---|---|---|
| CI - Inkapark | `.github/workflows/ci.yml` | `push` y `pull_request` hacia `master` | Configura JDK 21 y ejecuta `mvn clean install -DskipTests`. |
| CD - Inkapark | `.github/workflows/cd.yml` | `push` hacia `master` | Genera el `.jar`, prepara `dist/` y publica el artifact. |

El artifact publicado por CD se llama:

```text
inkapark-aplicacion
```

Incluye:

```text
Inkapark-0.0.1-SNAPSHOT.jar
application-example.properties
README-EJECUCION.md
database/inkapark.sql
```

> ℹ️ **Nota:** Los workflows actuales omiten pruebas con `-DskipTests`, según la configuración real de los archivos YAML.

---

## Documentación

| Documento | Descripción |
|---|---|
| [`docs/Manual_GitHub.md`](docs/Manual_GitHub.md) | Manual técnico para gestión del repositorio con Git, GitHub, Issues, Projects, Pull Requests, CI/CD y artifacts. |
| [`docs/Manual_Usuario.md`](docs/Manual_Usuario.md) | Manual de instalación, configuración, ejecución y uso funcional del sistema. |
| [`README-EJECUCION.md`](README-EJECUCION.md) | Guía rápida para ejecutar localmente el artifact generado por GitHub Actions. |

---

## Flujo de trabajo

```text
┌────────┐
│ Issue  │
└───┬────┘
    ▼
┌──────────────┐
│ Branch       │
│ feature/fix  │
└───┬──────────┘
    ▼
┌────────┐
│ Commit │
└───┬────┘
    ▼
┌────────┐
│ Push   │
└───┬────┘
    ▼
┌────────────────┐
│ Pull Request   │
└───┬────────────┘
    ▼
┌────────────────┐
│ GitHub Actions │
│ CI / CD        │
└───┬────────────┘
    ▼
┌────────┐
│ Merge  │
└────────┘
```

Convenciones recomendadas y observadas en el historial:

| Elemento | Ejemplo |
|---|---|
| Rama de funcionalidad | `feature/validacion-registro` |
| Rama de corrección | `fix/error-login-admin` |
| Commit de funcionalidad | `feat: descripcion breve` |
| Commit de documentación | `docs: actualizar manuales` |
| Commit de CI/CD | `ci: publicar jar como artefacto` |

---

## Requisitos

| Requisito | Versión / detalle |
|---|---|
| Java JDK | 21 o superior. |
| Maven | Compatible con el proyecto o mediante Maven Wrapper. |
| MySQL / MariaDB | Base de datos relacional local. |
| XAMPP | Recomendado para iniciar MySQL y usar phpMyAdmin. |
| Git | Necesario para clonar y versionar cambios. |
| Navegador web | Chrome, Edge, Firefox u otro navegador moderno. |
| Cuenta SMTP | Opcional para pruebas de correo, requerida para verificación y envíos reales. |

---

## Capturas del sistema

> 📷 Aquí se recomienda colocar una captura de la página principal de InkaPark.

> 📷 Aquí se recomienda colocar una captura de la página de atracciones.

> 📷 Aquí se recomienda colocar una captura del formulario de registro o login.

> 📷 Aquí se recomienda colocar una captura de la compra de tickets.

> 📷 Aquí se recomienda colocar una captura del panel administrativo.

> 📷 Aquí se recomienda colocar una captura de la gestión de mensajes o tickets.

---

## Contribución

Para contribuir de forma ordenada:

1. Revisar o crear un Issue con el cambio propuesto.
2. Actualizar la rama principal local.
3. Crear una rama descriptiva:

```bash
git checkout master
git pull origin master
git checkout -b feature/nombre-del-cambio
```

4. Realizar cambios pequeños y relacionados.
5. Revisar el estado y diferencias:

```bash
git status
git diff
```

6. Crear un commit descriptivo:

```bash
git add .
git commit -m "docs: descripcion breve del cambio"
```

7. Subir la rama y abrir un Pull Request hacia `master`.
8. Esperar la ejecución de GitHub Actions antes del merge.

---

## Buenas prácticas

- Mantener `master` estable.
- No subir credenciales, tokens ni contraseñas reales.
- Crear ramas por tarea o Issue.
- Usar commits claros con prefijos como `feat:`, `fix:`, `docs:` o `ci:`.
- Validar cambios localmente antes de abrir un Pull Request.
- Documentar cualquier funcionalidad nueva en los manuales correspondientes.
- No presentar como terminadas funciones que solo estén planificadas.

---

## Autores

| Autor / colaborador | Evidencia en el repositorio |
|---|---|
| Rodrigo Esteban / Rodrigo Rubina | Autor registrado en el historial de Git. |
| RK-byte07 | Autor registrado en el historial de Git. |

> ℹ️ **Nota:** La lista se basa en los autores visibles en el historial local de Git del repositorio analizado.

---

## Licencia

No se evidenció un archivo de licencia (`LICENSE`) en la raíz del repositorio.

Por lo tanto, este repositorio debe tratarse como un **proyecto académico** salvo que el equipo agregue una licencia explícita posteriormente.

---

## Contacto

El proyecto incluye información de contacto visible en plantillas del sistema para fines de demostración, como correo administrativo y datos de atención del parque.

Para consultas técnicas del repositorio, se recomienda utilizar los canales de GitHub:

- Issues para reportar errores o solicitar mejoras.
- Pull Requests para proponer cambios.
- GitHub Projects para seguimiento del trabajo.
