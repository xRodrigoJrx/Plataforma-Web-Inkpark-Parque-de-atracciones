# InkaPark - Guía de Ejecución Local

Este documento describe el procedimiento para ejecutar localmente el sistema **InkaPark** utilizando el archivo ejecutable generado por GitHub Actions.

---

# Requisitos

Antes de iniciar, asegúrese de contar con los siguientes componentes instalados:

- Java JDK 21 o superior
- XAMPP
- Navegador web (Google Chrome, Microsoft Edge o Mozilla Firefox)

---

# Contenido del paquete

Al descargar el artefacto generado por GitHub Actions encontrará la siguiente estructura:

```
inkapark-aplicacion/

│── Inkapark-0.0.1-SNAPSHOT.jar
│── application-example.properties
│── README-EJECUCION.md
└── database/
    └── inkapark.sql
```

Cada archivo cumple una función específica:

| Archivo | Descripción |
|----------|-------------|
| Inkapark-0.0.1-SNAPSHOT.jar | Aplicación compilada lista para ejecutarse |
| application-example.properties | Plantilla de configuración del entorno |
| database/inkapark.sql | Script de creación de la base de datos |
| README-EJECUCION.md | Manual de instalación y ejecución |

---

# Paso 1. Configurar la base de datos

1. Abrir **XAMPP**.

2. Iniciar el servicio **MySQL**.

3. Presionar el botón **Admin** para abrir phpMyAdmin.

4. Crear una nueva base de datos llamada:

```
inkapark
```

5. Seleccionar la base de datos creada.

6. Ir a la pestaña **Importar**.

7. Seleccionar el archivo:

```
database/inkapark.sql
```

8. Presionar **Continuar**.

9. Esperar a que todas las tablas sean creadas correctamente.

---

# Paso 2. Configurar la aplicación

Dentro de la carpeta del paquete encontrará el archivo:

```
application-example.properties
```

Realice una copia del archivo y renómbrela como:

```
application.properties
```

Abra el archivo y configure los siguientes parámetros según su entorno local.

## Base de datos

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/inkapark?useSSL=false&serverTimezone=America/Lima
spring.datasource.username=USUARIO_BASE_DATOS
spring.datasource.password=CONTRASEÑA_BASE_DATOS
```

Ejemplo utilizando XAMPP por defecto:

```properties
spring.datasource.username=root
spring.datasource.password=
```

---

## Correo electrónico (SMTP)

Si desea utilizar el envío automático de correos electrónicos deberá configurar una cuenta de Gmail y una contraseña de aplicación.

```properties
spring.mail.username=correo@gmail.com
spring.mail.password=CONTRASEÑA_DE_APLICACION
```

**Importante:**

No utilice contraseñas personales.

Google recomienda utilizar una contraseña de aplicación.

---

# Paso 3. Ejecutar la aplicación

Abrir una ventana de comandos dentro de la carpeta donde se encuentra el archivo:

```
Inkapark-0.0.1-SNAPSHOT.jar
```

Ejecutar el siguiente comando:

```bash
java -jar "Inkapark-0.0.1-SNAPSHOT.jar" --spring.config.additional-location=file:./application.properties
```

---

# Paso 4. Verificar la ejecución

Si la configuración fue correcta aparecerán mensajes similares a los siguientes:

```
Tomcat started on port 8080

Started InkaparkApplication
```

La consola debe permanecer abierta mientras la aplicación esté en ejecución.

---

# Paso 5. Acceder al sistema

Abrir un navegador web e ingresar a:

```
http://localhost:8080
```

Si todo fue configurado correctamente se mostrará la página principal de **InkaPark**.

---

# Solución de problemas

## Error:

```
Failed to configure a DataSource
```

Verifique que:

- MySQL esté iniciado en XAMPP.
- La base de datos **inkapark** exista.
- El archivo **application.properties** esté correctamente configurado.

---

## Error:

```
Access denied for user
```

Verifique el usuario y contraseña configurados para MySQL.

---

## Error:

```
Port 8080 already in use
```

Existe otra aplicación utilizando el puerto 8080.

Debe cerrarla o modificar el puerto en:

```properties
server.port=8081
```

---

## Error:

```
Unable to send email
```

Verifique que la cuenta de Gmail tenga configurada una contraseña de aplicación válida.

---

# Arquitectura de ejecución

```
GitHub Repository
        │
        ▼
GitHub Actions (CD)
        │
        ▼
Generación del archivo .jar
        │
        ▼
Descarga del Artifact
        │
        ▼
Configuración del entorno local
        │
        ▼
Importación de la base de datos
        │
        ▼
Ejecución del archivo .jar
        │
        ▼
http://localhost:8080
```

---

# Observaciones

- El archivo **application.properties** no se incluye dentro del repositorio debido a que contiene configuraciones específicas del entorno local y credenciales de servicios externos.
- Para facilitar la configuración del sistema se proporciona el archivo **application-example.properties**, el cual sirve como plantilla para crear el archivo de configuración correspondiente.
- El sistema fue desarrollado para ejecutarse en un entorno local utilizando Java y MySQL administrado mediante XAMPP.

---

**Proyecto:** InkaPark  
**Tecnologías:** Java 21 · Spring Boot · Maven · MySQL · GitHub Actions