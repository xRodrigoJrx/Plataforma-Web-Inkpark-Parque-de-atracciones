# Manual de Usuario del sistema InkaPark

## 1. Introducción

Este manual explica el uso del sistema web **InkaPark** desde la perspectiva del usuario final y del administrador. La información se basa únicamente en funcionalidades evidenciadas en el repositorio: controladores Java, rutas MVC, plantillas Thymeleaf, modelos JPA, servicios, configuración, base de datos, recursos estáticos, README de ejecución y workflows de empaquetado.

InkaPark permite consultar páginas informativas del parque, registrar usuarios clientes, verificar cuentas por correo, iniciar sesión, consultar atracciones, comprar tickets con tarjeta, recibir comprobantes por correo, enviar mensajes de contacto y administrar usuarios, tickets y mensajes desde un panel protegido.

## 2. Objetivo del manual

El objetivo es guiar a usuarios y administradores en:

1. Preparar el entorno local de ejecución.
2. Importar la base de datos.
3. Configurar la aplicación sin exponer credenciales.
4. Ejecutar el archivo `.jar` generado por GitHub Actions.
5. Acceder a las pantallas reales del sistema.
6. Usar las funcionalidades implementadas.
7. Identificar errores frecuentes y resolverlos.

## 3. Requisitos para ejecutar el sistema

Los requisitos reales del proyecto son:

| Requisito | Evidencia y uso |
|---|---|
| Java JDK 21 o superior | El `pom.xml` define `java.version` 21 y los workflows configuran JDK 21. |
| XAMPP | Recomendado en `README-EJECUCION.md` para iniciar MySQL y usar phpMyAdmin. |
| MySQL o MariaDB | La aplicación usa el conector MySQL y el script `database/inkapark.sql`. |
| Navegador web | Necesario para acceder a `http://localhost:8080`. |
| Archivo `.jar` | Generado por Maven/GitHub Actions como `Inkapark-0.0.1-SNAPSHOT.jar`. |
| `application.properties` externo | Se crea copiando `application-example.properties`. |
| Base de datos | Debe existir una base llamada `inkapark` con las tablas importadas. |

## 4. Contenido del paquete descargable

El workflow de CD prepara un paquete llamado `inkapark-aplicacion`. Según `README-EJECUCION.md` y `.github/workflows/cd.yml`, contiene:

```text
inkapark-aplicacion/
├── Inkapark-0.0.1-SNAPSHOT.jar
├── application-example.properties
├── README-EJECUCION.md
└── database/
    └── inkapark.sql
```

| Archivo | Función |
|---|---|
| `Inkapark-0.0.1-SNAPSHOT.jar` | Aplicación compilada lista para ejecutar. |
| `application-example.properties` | Plantilla de configuración local. |
| `README-EJECUCION.md` | Guía resumida de instalación y ejecución. |
| `database/inkapark.sql` | Script SQL de base de datos. |

## 5. Importación de la base de datos

1. Abrir **XAMPP**.
2. Iniciar el servicio **MySQL**.
3. Abrir **phpMyAdmin** desde el botón **Admin** de XAMPP.
4. Crear una base de datos llamada:

```sql
inkapark
```

5. Seleccionar la base de datos `inkapark`.
6. Entrar en la pestaña **Importar**.
7. Seleccionar el archivo:

```text
database/inkapark.sql
```

8. Confirmar la importación.
9. Verificar que se hayan creado tablas como `usuario`, `boleta`, `pago`, `manejo_aforo`, `contacto_mensaje` y `notificacion` si están presentes en el script.

> **Captura sugerida:** Pantalla de phpMyAdmin después de importar `database/inkapark.sql`.

## 6. Configuración de `application.properties`

1. Copiar el archivo de ejemplo:

```bash
cp application-example.properties application.properties
```

En Windows PowerShell:

```powershell
Copy-Item application-example.properties application.properties
```

2. Abrir `application.properties`.
3. Configurar la conexión a MySQL:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/inkapark?useSSL=false&serverTimezone=America/Lima
spring.datasource.username=USUARIO_BASE_DATOS
spring.datasource.password=CONTRASENA_BASE_DATOS
```

4. Si se usa XAMPP con configuración por defecto, normalmente se utiliza:

```properties
spring.datasource.username=root
spring.datasource.password=
```

5. Configurar el puerto si es necesario:

```properties
server.port=8080
```

6. Configurar SMTP si se utilizarán correos:

```properties
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=CORREO_GMAIL
spring.mail.password=CONTRASENA_DE_APLICACION
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
```

No colocar contraseñas reales en documentación, commits, Issues o Pull Requests.

## 7. Explicación de `application-example.properties`

El archivo `src/main/resources/application-example.properties` es una plantilla segura para configurar el entorno. Contiene:

| Propiedad | Significado |
|---|---|
| `spring.application.name=inkapark` | Nombre de la aplicación. |
| `server.port=8080` | Puerto local de Spring Boot. |
| `spring.datasource.url` | URL JDBC hacia la base `inkapark`. |
| `spring.datasource.username` | Usuario de MySQL/MariaDB. |
| `spring.datasource.password` | Contraseña de MySQL/MariaDB. |
| `spring.jpa.hibernate.ddl-auto=update` | Hibernate actualiza el esquema según entidades. |
| `spring.jpa.show-sql=true` | Muestra SQL en consola. |
| `app.base-url=http://localhost:8080` | URL usada para enlaces como verificación de correo. |
| `aforo.max=50` | Valor de aforo definido en la plantilla. |
| `spring.mail.*` | Configuración SMTP para Gmail. |
| `app.contact.from-name=InkaPark` | Nombre remitente para correos de contacto. |

Nota: el servicio de tickets lee propiedades con nombres `incapark.tickets.aforo.default` e `incapark.tickets.precio` y usa valores por defecto `50` y `50.00` si no están definidas.

## 8. Ejecución del archivo `.jar`

1. Abrir una terminal en la carpeta donde está el `.jar`.
2. Confirmar que existe `application.properties` en la misma carpeta.
3. Ejecutar:

```bash
java -jar "Inkapark-0.0.1-SNAPSHOT.jar" --spring.config.additional-location=file:./application.properties
```

4. Mantener la consola abierta mientras se usa el sistema.
5. Verificar mensajes similares a:

```text
Tomcat started on port 8080
Started InkaparkApplication
```

## 9. Acceso a localhost

1. Abrir el navegador.
2. Ingresar:

```text
http://localhost:8080
```

3. La ruta `/` o `/inicio` muestra la página principal.

## 10. Tipos de usuario o roles reales

El modelo `Usuario` define dos roles reales:

| Rol | Descripción |
|---|---|
| `CLIENTE` | Usuario registrado que puede iniciar sesión y comprar tickets. |
| `ADMIN` | Usuario con acceso al panel administrativo. |

El panel `/admin` y sus rutas están protegidos por un interceptor que exige sesión administrativa iniciada desde `/admin/login`.

## 11. Página principal

Rutas reales:

```text
/
/inicio
```

Procedimiento:

1. Acceder a `http://localhost:8080/`.
2. Revisar la información de bienvenida del parque.
3. Usar el menú para navegar a **Atracciones**, **Tickets**, **Nosotros** o **Contacto**.
4. Si no hay sesión, se muestra opción de iniciar sesión.
5. Si hay sesión, se muestra el nombre del usuario y opción de cerrar sesión.

> **Captura sugerida:** Página principal de InkaPark en `http://localhost:8080/`.

## 12. Registro de usuario

Rutas reales:

```text
/auth/register
/registro
```

La ruta funcional del formulario de registro envía datos a `/auth/register`.

Pasos:

1. Entrar a `http://localhost:8080/auth/register`.
2. Escribir nombre completo.
3. Escribir correo electrónico Gmail.
4. Escribir contraseña.
5. Presionar **Crear cuenta**.
6. Si el registro es válido, el sistema muestra un mensaje indicando que se revise el correo Gmail para verificar la cuenta.

> **Captura sugerida:** Formulario de registro del usuario.

## 13. Validaciones reales del registro

El servicio de registro implementa estas validaciones:

| Campo | Validación real |
|---|---|
| Nombre | Obligatorio. Máximo 100 caracteres. |
| Correo | Obligatorio, normalizado a minúsculas y debe ser `@gmail.com`. |
| Contraseña | Obligatoria. Mínimo 6 caracteres. |
| Correo duplicado | Si ya existe y está verificado, se rechaza. |
| Cuenta no verificada existente | Se actualizan nombre, contraseña y token; se envía nuevo enlace. |

La entidad `Usuario` también declara validaciones JPA/Bean Validation: nombre no vacío, correo no vacío, formato de correo, patrón Gmail, máximo 100 caracteres para correo y máximo 255 para contraseña.

## 14. Verificación de correo

Esta funcionalidad sí está implementada.

Rutas reales:

```text
/auth/verificar?email=CORREO&token=TOKEN
/auth/reenviar-verificacion
```

Flujo:

1. Al registrarse, la cuenta se crea como no verificada.
2. El sistema genera un token con expiración de 24 horas.
3. Se construye un enlace usando `app.base-url` y la ruta `/auth/verificar`.
4. El correo se envía mediante el servicio SMTP configurado.
5. Al abrir el enlace, el sistema valida correo, token y expiración.
6. Si todo es correcto, marca la cuenta como verificada y permite iniciar sesión.

Reenvío:

1. Entrar a la pantalla de login.
2. En la sección de reenvío, escribir el correo Gmail.
3. Presionar **Reenviar**.
4. El sistema envía un nuevo enlace si la cuenta existe y aún no está verificada.

> **Captura sugerida:** Mensaje de verificación enviada en la pantalla de login.

## 15. Inicio de sesión

### 15.1 Login de cliente

Ruta real:

```text
/auth/login
```

Pasos:

1. Abrir `http://localhost:8080/auth/login`.
2. Ingresar correo electrónico.
3. Ingresar contraseña.
4. Presionar **Ingresar**.
5. Si la cuenta no está verificada, se muestra un mensaje solicitando revisar el correo o pedir nuevo enlace.
6. Si las credenciales son válidas, se crea sesión de usuario.
7. Si el usuario tiene rol `ADMIN`, el controlador puede redirigir a `/admin`; si es `CLIENTE`, redirige a `/`.

### 15.2 Login de administrador

Ruta real:

```text
/admin/login
```

Pasos:

1. Abrir `http://localhost:8080/admin/login`.
2. Ingresar correo administrativo.
3. Ingresar contraseña.
4. Presionar el botón de ingreso.
5. Si las credenciales son válidas y el usuario tiene permiso administrativo, se abre `/admin`.
6. Si no, aparece el mensaje: `Credenciales inválidas o sin permiso.`

> **Captura sugerida:** Formulario de acceso administrativo.

## 16. Recuperación de contraseña

> Esta funcionalidad se encuentra planificada o podría ser deseable, pero no se evidencia como implementada en la versión analizada.

No se encontró controlador, ruta, servicio ni plantilla dedicada a recuperación de contraseña. Sí existe reenvío de verificación de cuenta, pero no restablecimiento de contraseña.

## 17. Consulta de atracciones

Ruta real:

```text
/atracciones
```

Pasos:

1. Entrar a `http://localhost:8080/atracciones`.
2. Revisar las tarjetas o secciones de atracciones disponibles en la plantilla.
3. Navegar con el menú superior hacia otras páginas.
4. Usar el botón de tickets si se desea comprar una entrada.

La página es informativa; no se evidencia gestión dinámica de atracciones desde base de datos.

> **Captura sugerida:** Página de atracciones del parque.

## 18. Compra o reserva de entradas

Ruta real:

```text
/tickets
```

Pasos:

1. Iniciar sesión como usuario cliente verificado.
2. Entrar a `http://localhost:8080/tickets`.
3. Seleccionar uno de los próximos 7 días mostrados por el sistema.
4. Revisar aforo total y disponible.
5. Elegir la cantidad de entradas.
6. Presionar el botón para continuar con el pago.
7. Completar los datos de tarjeta y contacto.
8. Confirmar el pago.

El servicio crea o consulta aforo para los próximos 7 días. Si falta un registro de aforo, lo crea con el valor por defecto configurado en el servicio.

## 19. Proceso de pago con tarjeta

El proceso real implementado es pago con tarjeta en `/tickets/pagar`.

Pasos:

1. Seleccionar fecha y cantidad en `/tickets`.
2. Abrir el modal de tarjeta.
3. Ingresar número de tarjeta.
4. Ingresar CVV.
5. Ingresar vencimiento con formato `MM/AA`.
6. Confirmar titular y correo mostrados.
7. Ingresar teléfono.
8. Ingresar dirección.
9. Presionar **Confirmar pago**.
10. El sistema envía los datos ocultos al formulario `/tickets/pagar`.
11. Si el pago es válido, se crea boleta, registro de pago, se descuenta aforo, se generan PDFs y se envía correo con comprobante y boletos.

## 20. Validaciones reales del pago

El servicio de tickets valida:

| Dato | Validación real |
|---|---|
| Usuario | Debe existir usuario en sesión. |
| Fecha | Es obligatoria. |
| Cantidad | Debe ser mayor o igual a 1. |
| Número de tarjeta | Debe contener exactamente 16 dígitos. |
| CVV | Debe contener exactamente 3 dígitos. |
| Vencimiento | Debe tener formato `MM/AA`, con mes de `01` a `12`. |
| Teléfono | Debe contener exactamente 9 dígitos. |
| Dirección | Es obligatoria. |
| Aforo | Debe existir aforo para la fecha y tener disponibilidad suficiente. |

El tipo de tarjeta se detecta por el primer dígito del número ingresado según la lógica del servicio: `1` Visa, `2` Mastercard, `3` Amex, `4` Diners y otros valores como `OTRA`. Esta regla corresponde a la implementación del repositorio, aunque no equivale necesariamente a reglas bancarias reales.

## 21. Generación o visualización de tickets

Después de un pago exitoso:

1. Se genera un identificador de boleta de 12 caracteres.
2. Se crea una entidad `Boleta` con estado `VIGENTE`.
3. Se crea un `Pago` con método `TARJETA` y estado `CONFIRMADO`.
4. Se descuenta el aforo disponible.
5. Se generan archivos PDF de comprobante y boletos mediante `PdfServicio`.
6. Se envían por correo mediante `EmailServicio`.
7. En pantalla se muestra un mensaje con el código de boleta.

No se encontró una ruta pública para descargar manualmente el PDF desde el navegador; la entrega implementada se realiza por correo.

> **Captura sugerida:** Mensaje de pago exitoso con código de boleta.

## 22. Formulario de contacto

Rutas reales:

```text
/contacto
```

Pasos:

1. Abrir `http://localhost:8080/contacto`.
2. Escribir nombre.
3. Escribir correo.
4. Escribir asunto.
5. Escribir mensaje.
6. Enviar el formulario.
7. Si se guarda correctamente, el sistema redirige a `/contacto?ok=Mensaje%20enviado`.
8. Si ocurre error, redirige a `/contacto?error=No%20se%20pudo%20enviar`.

> **Captura sugerida:** Formulario de contacto público.

## 23. Validación de longitud del formulario de contacto

Validaciones reales del servicio:

| Campo | Validación |
|---|---|
| Nombre | Obligatorio y máximo 120 caracteres. |
| Correo | Obligatorio, formato de correo válido y máximo 150 caracteres. |
| Asunto | Obligatorio y máximo 200 caracteres. |
| Mensaje | Obligatorio y máximo 2000 caracteres. |

Los mensajes se guardan con estado `NUEVO` y fecha de envío.

## 24. Panel administrativo

Ruta real:

```text
/admin
```

Requisito:

1. Iniciar sesión en `/admin/login`.
2. Tener usuario con rol administrativo validado por el servicio de autenticación.

Opciones visibles:

- **Tickets**: gestión y verificación de boletas.
- **Usuarios**: listado, creación, edición y eliminación desde modal.
- **Mensajes**: bandeja de mensajes de contacto, filtros y respuesta.

El interceptor protege `/admin` y `/admin/**`, excepto `/admin/login`.

> **Captura sugerida:** Panel administrativo principal.

## 25. Gestión de usuarios

Ruta real:

```text
/admin/usuarios
```

Funcionalidades implementadas:

1. Listar usuarios.
2. Crear usuario desde formulario modal.
3. Editar usuario existente.
4. Eliminar usuario.
5. Seleccionar rol `CLIENTE` o `ADMIN`.

Pasos para crear:

1. Entrar a `/admin/usuarios`.
2. Presionar **Nuevo usuario**.
3. Completar nombre.
4. Completar correo.
5. Elegir rol.
6. Escribir contraseña.
7. Guardar.

Pasos para editar:

1. Entrar a `/admin/usuarios`.
2. Seleccionar el botón de edición de un usuario.
3. Modificar datos permitidos.
4. Dejar contraseña vacía si no se desea cambiarla.
5. Guardar.

Pasos para eliminar:

1. Entrar a `/admin/usuarios`.
2. Presionar eliminar en el usuario correspondiente.
3. Confirmar eliminación.

Nota: el controlador contiene rutas que retornan una vista `usuario-form`, pero no se evidenció esa plantilla entre los archivos listados. La pantalla implementada visible para la gestión se encuentra en `adminusuario.html` con formularios modales.

## 26. Gestión de tickets o boletos

Ruta real:

```text
/admin/tickets
```

Funcionalidades implementadas:

1. Consultar tickets por fecha.
2. Visualizar semana de lunes a domingo.
3. Ver aforo total, vendidos y disponible.
4. Listar boletas del día.
5. Ver código, cliente, correo, cantidad y estado.
6. Verificar un ticket por código.

Pasos para verificar ticket:

1. Entrar a `/admin/tickets`.
2. Seleccionar la fecha correspondiente.
3. Ingresar el código de boleta.
4. Presionar **Verificar**.
5. Si está `VIGENTE`, el sistema lo cambia a `USADA`.
6. Si ya estaba `USADA`, muestra error de ticket ya verificado.
7. Si está `CANCELADA`, muestra error de boleto cancelado.

> **Captura sugerida:** Panel administrativo de tickets con formulario de verificación.

## 27. Gestión de mensajes

Ruta real:

```text
/admin/mensajes
```

Funcionalidades implementadas:

1. Listar mensajes de contacto.
2. Filtrar por estado `NUEVO` o `ATENDIDO`.
3. Marcar mensaje como atendido.
4. Enviar acuse de atención al remitente.
5. Responder un mensaje por correo.
6. Registrar respuesta y fecha de respuesta.
7. Eliminar mensajes.

Pasos para responder:

1. Entrar a `/admin/mensajes`.
2. Abrir el detalle del mensaje.
3. Escribir la respuesta en el modal.
4. Enviar la respuesta.
5. El sistema marca el mensaje como `ATENDIDO`, guarda la respuesta y envía correo si SMTP está configurado.

> **Captura sugerida:** Bandeja administrativa de mensajes de contacto.

## 28. Cierre de sesión

### 28.1 Cliente

Ruta real:

```text
/auth/logout
```

Pasos:

1. Abrir el menú de usuario.
2. Presionar **Cerrar sesión**.
3. El sistema invalida la sesión.
4. Redirige a `/auth/login`.

### 28.2 Administrador

Ruta real:

```text
/admin/logout
```

Pasos:

1. Acceder a la opción de salida administrativa si está disponible en pantalla.
2. El sistema invalida la sesión.
3. Redirige a `/admin/login`.

## 29. Mensajes de error frecuentes

| Situación | Mensaje o comportamiento real |
|---|---|
| Login cliente con credenciales inválidas | `Correo o contraseña incorrectos.` |
| Cuenta no verificada | `Tu cuenta no está verificada...` |
| Login admin inválido | `Credenciales inválidas o sin permiso.` |
| Registro con Gmail inválido | `Solo se permiten correos @gmail.com válidos.` |
| Registro con contraseña corta | `La contraseña debe tener al menos 6 caracteres.` |
| Pago sin sesión | `Debes iniciar sesión para comprar un ticket.` |
| Tarjeta inválida | `Número de tarjeta inválido`. |
| CVV inválido | `CVV inválido`. |
| Vencimiento inválido | `Fecha de vencimiento inválida`. |
| Teléfono inválido | `Teléfono inválido`. |
| Aforo insuficiente | `Aforo insuficiente para esa cantidad`. |
| Contacto inválido | Redirección a `/contacto?error=No%20se%20pudo%20enviar`. |
| Ticket ya usado | `Ya fue verificado`. |
| Ticket cancelado | `Boleto cancelado`. |

## 30. Solución de problemas

### 30.1 Base de datos no disponible

1. Verificar que MySQL esté iniciado en XAMPP.
2. Confirmar que la base `inkapark` exista.
3. Revisar usuario y contraseña en `application.properties`.
4. Confirmar la URL JDBC:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/inkapark?useSSL=false&serverTimezone=America/Lima
```

### 30.2 `application.properties` no encontrado

1. Copiar `application-example.properties` como `application.properties`.
2. Guardarlo en la misma carpeta del `.jar`.
3. Ejecutar con:

```bash
java -jar "Inkapark-0.0.1-SNAPSHOT.jar" --spring.config.additional-location=file:./application.properties
```

### 30.3 Credenciales incorrectas

1. Verificar que el usuario exista en la tabla `usuario`.
2. Confirmar que el correo esté normalizado y escrito correctamente.
3. Confirmar que la cuenta de cliente esté verificada.
4. Para administración, confirmar que el usuario tenga rol `ADMIN`.

### 30.4 Puerto ocupado

1. Si aparece `Port 8080 already in use`, cerrar la aplicación que usa el puerto.
2. O cambiar el puerto:

```properties
server.port=8081
```

3. Acceder luego a:

```text
http://localhost:8081
```

### 30.5 Correo SMTP no configurado

1. Revisar `spring.mail.username`.
2. Revisar `spring.mail.password`.
3. Usar contraseña de aplicación, no contraseña personal.
4. Confirmar conexión a internet.
5. Si SMTP falla, el registro o envío de comprobantes puede no completarse correctamente según el flujo que intente enviar correo.

### 30.6 Página no encontrada

1. Verificar la ruta escrita.
2. Usar rutas reales:

```text
/
/inicio
/atracciones
/nosotros
/contacto
/auth/login
/auth/register
/tickets
/admin/login
/admin
/admin/tickets
/admin/usuarios
/admin/mensajes
```

3. No usar rutas de archivos HTML estáticos como `/login.html`; el proyecto usa controladores Spring MVC.

## 31. Recomendaciones de seguridad

1. No publicar `application.properties` con credenciales reales.
2. Usar contraseñas de aplicación para SMTP.
3. No compartir tokens de verificación.
4. Crear usuarios administradores solo para personal autorizado.
5. Cambiar credenciales por defecto de MySQL en entornos no locales.
6. Ejecutar el sistema en HTTPS si se despliega fuera de localhost.
7. No almacenar ni mostrar datos de tarjeta en texto plano en un entorno productivo. El modelo actual conserva el número de tarjeta sin cifrar y solo cifra CVV y vencimiento mediante convertidor, por lo que debe considerarse una implementación de demostración y no una solución PCI real.
8. Mantener Java, Maven y dependencias actualizadas.
9. Realizar copias de seguridad de la base de datos.
10. Revisar logs si se producen errores de pago, correo o base de datos.

## 32. Conclusiones

InkaPark cuenta con funcionalidades públicas, autenticación, verificación de correo, compra de tickets, generación de comprobantes, correo electrónico y administración de usuarios, tickets y mensajes. Para ejecutar correctamente el sistema se requiere Java 21, base de datos MySQL/MariaDB, configuración externa y el artifact generado. Las funciones descritas en este manual corresponden a rutas y clases existentes en el repositorio analizado; las funciones no evidenciadas se identifican como no implementadas para evitar confusión del usuario final.

## 33. Resumen de análisis realizado

### 33.1 Archivos analizados

- `pom.xml`.
- `README-EJECUCION.md`.
- `.github/workflows/ci.yml`.
- `.github/workflows/cd.yml`.
- `database/inkapark.sql`.
- `src/main/resources/application-example.properties`.
- `src/main/resources/application-ci.properties`.
- `src/main/java/com/example/Inkapark/controlador/AdminControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/AdminMensajeControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/AdminTicketControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/AdminUsuarioControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/AuthControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/PaginaControlador.java`.
- `src/main/java/com/example/Inkapark/controlador/TicketsControlador.java`.
- Modelos `Usuario`, `Boleta`, `Pago`, `ManejoAforo`, `ContactoMensaje` y `Notificacion`.
- Servicios `RegistroServicio`, `AuthServicio`, `TicketsServicio`, `ContactoMensajeServicio`, `EmailServicio`, `PdfServicio`, `UsuarioServicio` y `BoletaServicio`.
- Plantillas HTML en `src/main/resources/templates`.
- Recursos estáticos en `src/main/resources/static`.

### 33.2 Funcionalidades encontradas

- Página principal en `/` e `/inicio`.
- Página de atracciones en `/atracciones`.
- Página Nosotros en `/nosotros`.
- Formulario de contacto en `/contacto`.
- Registro de clientes en `/auth/register`.
- Verificación de correo en `/auth/verificar`.
- Reenvío de verificación en `/auth/reenviar-verificacion`.
- Login de cliente en `/auth/login`.
- Logout de cliente en `/auth/logout`.
- Login administrativo en `/admin/login`.
- Panel administrativo en `/admin`.
- Gestión de usuarios en `/admin/usuarios`.
- Gestión y verificación de tickets en `/admin/tickets`.
- Gestión de mensajes en `/admin/mensajes`.
- Compra de tickets con tarjeta en `/tickets` y `/tickets/pagar`.
- Generación de PDFs y envío por correo tras pago.

### 33.3 Funcionalidades descartadas por no estar implementadas

- Recuperación o restablecimiento de contraseña.
- Descarga pública directa de PDFs desde una ruta del navegador.
- Administración dinámica de atracciones desde base de datos.
- Página funcional de galería: existe ruta `/galeria` en controlador, pero no se evidenció plantilla `galeria.html` en los archivos listados.
- Ruta administrativa `/admin/noticias`: existe método que retorna `adminnoticia`, pero no se evidenció plantilla `adminnoticia.html` en los archivos listados.
- Despliegue automático a servidor externo desde GitHub Actions.

### 33.4 Archivos modificados

- `docs/Manual_Usuario.md`.
