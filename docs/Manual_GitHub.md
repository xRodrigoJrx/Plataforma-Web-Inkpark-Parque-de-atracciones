# Manual de GitHub del proyecto InkaPark

## 1. Introducción

Este manual describe la gestión técnica del proyecto **InkaPark** mediante Git, GitHub, GitHub Projects y GitHub Actions. La guía se elaboró a partir de la estructura real del repositorio, los commits existentes, los workflows `.github/workflows/ci.yml` y `.github/workflows/cd.yml`, el archivo `pom.xml`, la guía `README-EJECUCION.md`, la base de datos `database/inkapark.sql` y el código fuente del sistema.

InkaPark es una aplicación web Java con Spring Boot orientada a la gestión de un parque de atracciones. El repositorio contiene controladores, modelos, repositorios, servicios, plantillas Thymeleaf, recursos estáticos, configuración de Maven, workflows de integración y despliegue continuo, script SQL y documentación de ejecución.

## 2. Objetivo del manual

El objetivo de este documento es estandarizar el uso de Git y GitHub dentro del proyecto InkaPark para que el equipo pueda:

1. Organizar el trabajo mediante Issues y GitHub Projects.
2. Crear ramas de desarrollo de forma ordenada.
3. Registrar cambios mediante commits claros.
4. Publicar ramas y abrir Pull Requests.
5. Ejecutar la validación automatizada con GitHub Actions.
6. Generar y descargar el artifact de ejecución.
7. Mantener trazabilidad entre Issue, rama, commit, Pull Request y cierre de tarea.

## 3. Descripción breve del repositorio

El repositorio corresponde a una aplicación Maven con Spring Boot. Su estructura evidencia:

- Aplicación principal Java en `src/main/java/com/example/Inkapark/InkaparkApplication.java`.
- Controladores MVC para páginas públicas, autenticación, tickets y administración.
- Modelos JPA para usuarios, boletas, pagos, aforo, mensajes de contacto y notificaciones.
- Repositorios Spring Data JPA.
- Servicios de negocio para registro, login, compra de tickets, mensajes, usuarios, PDF y correo.
- Plantillas HTML Thymeleaf en `src/main/resources/templates`.
- CSS, JavaScript e imágenes en `src/main/resources/static`.
- Configuración de ejemplo en `src/main/resources/application-example.properties`.
- Configuración especial de CI en `src/main/resources/application-ci.properties`.
- Script de base de datos en `database/inkapark.sql`.
- Workflows de GitHub Actions en `.github/workflows`.

## 4. Tecnologías relacionadas con la gestión del proyecto

| Tecnología | Uso en el proyecto |
|---|---|
| Git | Control de versiones local, creación de ramas, commits y merges. |
| GitHub | Hospedaje del repositorio, Issues, Pull Requests, ramas y Actions. |
| GitHub Projects | Organización Kanban del trabajo del equipo. |
| GitHub Actions | Automatización de CI y CD mediante archivos YAML. |
| Maven | Compilación, empaquetado y resolución de dependencias. |
| Java 21 | Versión configurada en `pom.xml` y en los workflows. |
| Spring Boot 3.5.6 | Framework principal de la aplicación. |
| MySQL/MariaDB | Base de datos importada desde `database/inkapark.sql`. |

## 5. Estructura principal del repositorio

```text
.
├── .github/workflows/
│   ├── ci.yml
│   └── cd.yml
├── .mvn/wrapper/
├── database/
│   └── inkapark.sql
├── docs/
│   ├── Manual_GitHub.md
│   └── Manual_Usuario.md
├── src/
│   ├── main/
│   │   ├── java/com/example/Inkapark/
│   │   │   ├── config/
│   │   │   ├── controlador/
│   │   │   ├── modelo/
│   │   │   ├── repositorio/
│   │   │   ├── servicio/
│   │   │   └── util/
│   │   └── resources/
│   │       ├── static/
│   │       ├── templates/
│   │       ├── application-ci.properties
│   │       └── application-example.properties
│   └── test/
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README-EJECUCION.md
```

## 6. Flujo de trabajo utilizado por el equipo

El historial del repositorio muestra commits con prefijos como `feat:` y `ci:`, merges de Pull Requests y ramas tipo `feature/...`. Con base en ello, el flujo recomendado y coherente con el repositorio es:

```text
Issue
→ asignación
→ rama feature o fix
→ desarrollo
→ commit
→ push
→ Pull Request
→ GitHub Actions
→ revisión
→ merge
→ cierre del Issue
```

### 6.1 Issue

1. Crear un Issue por cada mejora, corrección o tarea técnica.
2. Escribir una descripción clara con alcance, criterios de aceptación y archivos relacionados si se conocen.
3. Vincular el Issue al tablero de GitHub Projects.

### 6.2 Asignación

1. Asignar el Issue a una persona responsable.
2. Mover la tarjeta desde **Backlog** hacia **To Do** o **In Progress** según corresponda.

### 6.3 Rama feature o fix

Crear una rama desde la rama principal actualizada.

```bash
git checkout master
git pull origin master
git checkout -b feature/nombre-de-la-tarea
```

### 6.4 Desarrollo

1. Modificar los archivos necesarios.
2. No mezclar cambios no relacionados en la misma rama.
3. Ejecutar revisiones locales antes del commit.

### 6.5 Commit

```bash
git status
git add archivo-modificado
git commit -m "feat: descripcion breve closes #NUMERO_ISSUE"
```

### 6.6 Push

```bash
git push -u origin feature/nombre-de-la-tarea
```

### 6.7 Pull Request

1. Abrir un Pull Request hacia `master`.
2. Describir el cambio, pruebas realizadas e Issue relacionado.
3. Esperar la ejecución de GitHub Actions.

### 6.8 GitHub Actions

Al abrir un Pull Request hacia `master`, se ejecuta el workflow **CI - Inkapark**. Al hacer push a `master`, se ejecutan **CI - Inkapark** y **CD - Inkapark**.

### 6.9 Revisión, merge y cierre

1. Revisar archivos modificados en el PR.
2. Corregir observaciones si existen.
3. Verificar que los workflows no fallen.
4. Hacer merge hacia `master`.
5. Cerrar el Issue automáticamente si se usó una palabra clave como `closes #NUMERO` en el commit o PR.

## 7. Cómo clonar el repositorio

```bash
git clone URL_DEL_REPOSITORIO
cd Plataforma-Web-Inkpark-Parque-de-atracciones
```

Si el repositorio usa HTTPS, GitHub puede solicitar autenticación con navegador o token personal. No se deben escribir tokens ni contraseñas dentro de archivos del proyecto.

## 8. Cómo actualizar la rama principal

Antes de crear una rama nueva o iniciar un cambio, actualizar `master`:

```bash
git checkout master
git pull origin master
```

Si hay cambios locales sin guardar, revisar primero:

```bash
git status
```

## 9. Cómo crear una rama nueva

```bash
git checkout master
git pull origin master
git checkout -b feature/contacto-validacion
```

Para una corrección:

```bash
git checkout -b fix/error-login-admin
```

## 10. Convenciones de nombres de ramas

El historial del repositorio evidencia ramas integradas como `feature/contacto-validacion-21`, `feature/pago-validacion-19` y `feature/validacion-registro`. Por consistencia, se recomienda:

| Tipo | Formato | Ejemplo |
|---|---|---|
| Nueva funcionalidad | `feature/descripcion-corta-numeroIssue` | `feature/validacion-registro-17` |
| Corrección | `fix/descripcion-corta-numeroIssue` | `fix/login-admin-24` |
| CI/CD | `ci/descripcion-corta` | `ci/publicar-artifact` |
| Documentación | `docs/descripcion-corta` | `docs/manuales-inkapark` |

Usar minúsculas, guiones y nombres descriptivos.

## 11. Cómo revisar cambios con git status y git diff

```bash
git status
```

Muestra archivos modificados, nuevos o preparados para commit.

```bash
git diff
```

Muestra cambios no agregados al área de preparación.

```bash
git diff --staged
```

Muestra cambios ya agregados con `git add`.

## 12. Cómo agregar cambios con git add

Agregar un archivo específico:

```bash
git add docs/Manual_GitHub.md
```

Agregar varios archivos:

```bash
git add docs/Manual_GitHub.md docs/Manual_Usuario.md
```

Agregar todos los cambios revisados:

```bash
git add .
```

## 13. Cómo crear commits

```bash
git commit -m "docs: completar manuales del proyecto InkaPark"
```

Si el commit cierra un Issue:

```bash
git commit -m "feat: validacion contacto sin truncamiento closes #21"
```

## 14. Convenciones de mensajes de commit

El repositorio ya contiene commits como `feat: ...` y `ci: ...`. Se recomienda mantener Conventional Commits:

| Prefijo | Uso |
|---|---|
| `feat:` | Nueva funcionalidad. |
| `fix:` | Corrección de errores. |
| `ci:` | Cambios en GitHub Actions o automatización. |
| `docs:` | Documentación. |
| `style:` | Formato visual o estilo sin alterar lógica. |
| `refactor:` | Reorganización de código sin cambiar comportamiento. |

Ejemplos:

```bash
git commit -m "docs: actualizar manual de usuario"
git commit -m "fix: corregir validacion de pago con tarjeta"
git commit -m "ci: publicar jar de InkaPark como artefacto"
```

## 15. Cómo subir una rama a GitHub

```bash
git push -u origin feature/nombre-de-la-tarea
```

Después del primer push, basta con:

```bash
git push
```

## 16. Cómo crear y vincular un Issue

1. Entrar a la pestaña **Issues** del repositorio en GitHub.
2. Seleccionar **New issue**.
3. Escribir título, descripción y criterios de aceptación.
4. Asignar responsable.
5. Vincularlo al Project del equipo.
6. Usar el número de Issue en rama, commit o Pull Request.

Ejemplo de vínculo desde un commit o PR:

```text
closes #21
```

## 17. Cómo utilizar el tablero GitHub Projects

El flujo Kanban recomendado usa las columnas solicitadas:

| Columna | Significado |
|---|---|
| Backlog | Tareas identificadas, aún sin iniciar. |
| To Do | Tareas priorizadas y listas para desarrollarse. |
| In Progress | Tareas en desarrollo activo sobre una rama. |
| Code Review | Tareas con Pull Request abierto y pendiente de revisión. |
| Done | Tareas fusionadas, validadas y cerradas. |

Procedimiento:

1. Crear o vincular un Issue al Project.
2. Ubicarlo inicialmente en **Backlog**.
3. Moverlo a **To Do** cuando sea priorizado.
4. Moverlo a **In Progress** cuando se cree la rama.
5. Moverlo a **Code Review** al abrir el Pull Request.
6. Moverlo a **Done** después del merge y cierre del Issue.

> **Captura sugerida:** Vista del tablero Kanban en GitHub Projects.

## 18. Cómo crear un Pull Request

1. Subir la rama a GitHub.
2. Abrir GitHub y seleccionar **Compare & pull request**.
3. Confirmar que la rama base sea `master`.
4. Completar título y descripción.
5. Incluir Issue relacionado y resumen de pruebas.
6. Crear el PR.

Plantilla recomendada para la descripción:

```markdown
## Resumen
- Cambio principal realizado.
- Archivos relevantes.

## Pruebas
- mvn clean install -DskipTests

Closes #NUMERO
```

## 19. Cómo revisar cambios antes del merge

Antes de fusionar:

```bash
git status
git diff master...HEAD
```

En GitHub:

1. Abrir la pestaña **Files changed** del PR.
2. Revisar que solo se hayan modificado archivos relacionados.
3. Confirmar que no existan credenciales.
4. Confirmar que GitHub Actions finalice correctamente.
5. Revisar comentarios del equipo.

## 20. Cómo funcionan los workflows

El repositorio contiene dos workflows reales:

- `.github/workflows/ci.yml`: **CI - Inkapark**.
- `.github/workflows/cd.yml`: **CD - Inkapark**.

Ambos usan Ubuntu, configuran JDK 21 con distribución Temurin y ejecutan Maven con `-DskipTests`.

## 21. Explicación exacta de cada archivo YAML existente

### 21.1 `.github/workflows/ci.yml`

Nombre del workflow:

```yaml
name: CI - Inkapark
```

Eventos:

```yaml
on:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]
```

Esto significa que el CI se ejecuta cuando hay un `push` hacia `master` o cuando se abre/actualiza un Pull Request dirigido a `master`.

Trabajo principal:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
```

El job se llama `build` y corre en un runner Ubuntu.

Pasos:

1. Descarga el repositorio:

```yaml
- uses: actions/checkout@v3
```

2. Configura Java 21 con Temurin:

```yaml
- name: Set up JDK 21
  uses: actions/setup-java@v3
  with:
    java-version: '21'
    distribution: 'temurin'
```

3. Compila e instala el proyecto omitiendo pruebas:

```yaml
- name: Build project (skip tests)
  run: mvn clean install -DskipTests
```

### 21.2 `.github/workflows/cd.yml`

Nombre del workflow:

```yaml
name: CD - Inkapark
```

Evento:

```yaml
on:
  push:
    branches: ["master"]
```

El CD se ejecuta solo cuando hay un `push` hacia `master`.

Job:

```yaml
jobs:
  package:
    runs-on: ubuntu-latest
```

Pasos reales:

1. Descarga el repositorio con `actions/checkout@v4`.
2. Configura JDK 21 con `actions/setup-java@v4`, distribución Temurin y caché Maven.
3. Genera el archivo ejecutable con:

```bash
mvn clean package -DskipTests
```

4. Prepara la carpeta `dist`:

```bash
mkdir -p dist
cp target/*.jar dist/
cp src/main/resources/application-example.properties dist/
cp README-EJECUCION.md dist/
cp -r database dist/database
```

5. Publica el artifact con `actions/upload-artifact@v4`:

```yaml
with:
  name: inkapark-aplicacion
  path: dist/
  if-no-files-found: error
  retention-days: 30
```

## 22. Omisión actual de pruebas con `-DskipTests`

Sí existe esta configuración. En el CI se ejecuta:

```bash
mvn clean install -DskipTests
```

En el CD se ejecuta:

```bash
mvn clean package -DskipTests
```

Por lo tanto, el proyecto compila y empaqueta sin ejecutar pruebas automatizadas. Si se desea activar pruebas, se debe retirar `-DskipTests` y asegurar que la base de datos o configuración de prueba estén correctamente disponibles.

## 23. Cómo se genera y publica el artifact

El artifact se genera únicamente en el workflow **CD - Inkapark** cuando se hace push a `master`.

1. Maven genera el JAR en `target/`:

```bash
mvn clean package -DskipTests
```

2. El workflow crea `dist` y copia:
   - `target/*.jar`.
   - `src/main/resources/application-example.properties`.
   - `README-EJECUCION.md`.
   - `database/`.

3. `actions/upload-artifact@v4` publica el paquete con nombre:

```text
inkapark-aplicacion
```

4. El artifact se conserva durante 30 días.

## 24. Cómo descargar el artifact desde GitHub Actions

1. Ingresar al repositorio en GitHub.
2. Abrir la pestaña **Actions**.
3. Seleccionar el workflow **CD - Inkapark**.
4. Abrir una ejecución exitosa.
5. Buscar la sección **Artifacts**.
6. Descargar el artifact llamado `inkapark-aplicacion`.
7. Descomprimir el archivo descargado.

> **Captura sugerida:** Sección Artifacts de una ejecución exitosa del workflow CD - Inkapark.

## 25. Creación y uso de tags y releases

Aunque los workflows actuales no publican releases automáticamente, Git permite etiquetar versiones estables.

Crear un tag local:

```bash
git checkout master
git pull origin master
git tag -a v1.0.0 -m "Release v1.0.0"
```

Subir el tag:

```bash
git push origin v1.0.0
```

Crear un release en GitHub:

1. Ir a **Releases**.
2. Seleccionar **Draft a new release**.
3. Elegir el tag `v1.0.0`.
4. Escribir notas de versión.
5. Adjuntar manualmente el artifact si corresponde.
6. Publicar el release.

## 26. Buenas prácticas aplicadas y recomendadas

1. Usar ramas por tarea o Issue.
2. Mantener `master` estable.
3. Abrir Pull Request antes de fusionar cambios.
4. Usar commits descriptivos con prefijos como `feat:`, `fix:`, `ci:` y `docs:`.
5. No incluir credenciales en commits.
6. Usar `application-example.properties` como plantilla sin datos sensibles.
7. Verificar que GitHub Actions finalice correctamente.
8. Revisar el contenido del artifact antes de compartirlo.
9. Mantener documentación de ejecución actualizada.
10. No modificar workflows sin justificarlo en un PR.

## 27. Errores frecuentes y solución

### 27.1 Push rechazado por cambios remotos

Causa: la rama remota tiene commits que no existen localmente.

Solución:

```bash
git pull --rebase origin master
git push
```

Si se trabaja en una rama feature:

```bash
git fetch origin
git rebase origin/master
git push --force-with-lease
```

### 27.2 Conflictos

Causa: dos ramas modificaron las mismas líneas.

Solución:

```bash
git status
```

Editar los archivos con conflicto, retirar marcadores `<<<<<<<`, `=======`, `>>>>>>>`, y luego:

```bash
git add archivo-con-conflicto
git rebase --continue
```

O, si era un merge:

```bash
git add archivo-con-conflicto
git commit
```

### 27.3 Rama desactualizada

Solución:

```bash
git checkout feature/mi-rama
git fetch origin
git rebase origin/master
```

### 27.4 Workflow fallido

Revisar:

1. Log del job fallido en **Actions**.
2. Versión de Java configurada.
3. Errores Maven.
4. Archivos faltantes.
5. Dependencias no descargadas.

Ejecutar localmente el comando equivalente:

```bash
mvn clean install -DskipTests
```

### 27.5 Artifact no generado

Posibles causas:

1. El workflow **CD - Inkapark** no se ejecutó porque el cambio no llegó a `master`.
2. Falló `mvn clean package -DskipTests`.
3. No se generó ningún JAR en `target/`.
4. Falló la copia hacia `dist/`.
5. `actions/upload-artifact` no encontró archivos y `if-no-files-found: error` detuvo la publicación.

Solución local:

```bash
mvn clean package -DskipTests
ls target
```

En Windows PowerShell:

```powershell
mvn clean package -DskipTests
Get-ChildItem target
```

## 28. Conclusiones

La gestión del proyecto InkaPark se apoya en un flujo ordenado de Issues, ramas, commits, Pull Requests y GitHub Actions. El repositorio ya contiene automatización de CI para validar compilación y CD para generar un paquete descargable con JAR, plantilla de configuración, README de ejecución y base de datos. Mantener este flujo ayuda a conservar trazabilidad, reducir errores de integración y facilitar la entrega del sistema a usuarios finales.

## 29. Resumen de análisis realizado

### 29.1 Archivos analizados

- `pom.xml`.
- `README-EJECUCION.md`.
- `.github/workflows/ci.yml`.
- `.github/workflows/cd.yml`.
- `src/main/resources/application-example.properties`.
- `src/main/resources/application-ci.properties`.
- `database/inkapark.sql`.
- Controladores, modelos, servicios, repositorios, plantillas y recursos principales del proyecto.

### 29.2 Funcionalidades encontradas relacionadas con GitHub

- CI en Pull Requests y push a `master`.
- CD en push a `master`.
- Generación de artifact `inkapark-aplicacion`.
- Uso de Java 21 en workflows.
- Uso de Maven con `-DskipTests`.
- Historial con commits `feat:` y `ci:` y ramas `feature/...`.

### 29.3 Funcionalidades descartadas por no estar implementadas en workflows

- Publicación automática de releases.
- Despliegue automático a servidor externo.
- Ejecución real de pruebas en CI/CD, porque actualmente se usa `-DskipTests`.

### 29.4 Archivos modificados

- `docs/Manual_GitHub.md`.
