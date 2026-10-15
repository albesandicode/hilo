# AGENTS.md — Hilo

Instrucciones para agentes de IA que trabajan en este repositorio. Mantenlo corto y actualízalo en la misma PR
cuando cambien comandos, estructura o convenciones.

## Qué es
Hilo: red social de posts cortos. Monorepo con `backend/` (Spring Boot) y `frontend/` (Angular).
Reglas de negocio en `docs/producto.md`: **si el código las contradice, el código está mal.**

## Comandos
| Qué | Dónde | Comando |
|---|---|---|
| Arrancar API | `backend/` | `./mvnw spring-boot:run` (Windows: `.\mvnw.cmd spring-boot:run`) |
| Tests backend | `backend/` | `./mvnw verify` · un test: `./mvnw test -Dtest=PostServiceTest` |
| Arrancar web | `frontend/` | `npm start` (proxy de `/api` a `localhost:8080`) |
| Tests frontend | `frontend/` | `npm test` |
| Formato frontend | `frontend/` | `npm run format` |

## Estructura
- `backend/src/main/java/dev/sandilabs/hilo/{post,user,common,config}` — por funcionalidad.
- `backend/src/main/resources/db/migration` — migraciones Flyway `V<n>__descripcion.sql`.
- `frontend/src/app/{core,features,shared}` — `core` = API y sesión, `features` = pantallas, `shared` = pipes.
- Detalle en `docs/arquitectura.md`.

## Convenciones
- Java: inyección por constructor, DTOs como `record`, entidades JPA nunca salen del servicio, `Instant` + `Clock`.
- Errores HTTP con `ProblemDetail` vía `GlobalExceptionHandler`. Validación de entrada con Bean Validation (`@Valid`).
- Angular: componentes standalone, `inject()`, `input()`/`output()`, signals, `@if`/`@for`. Nada de `NgModule`.
- Nombres de código en inglés; textos de interfaz, mensajes de error y tests en español.
- Si cambias un DTO de Java, cambia `frontend/src/app/core/models.ts` en el mismo cambio.

## Tests
- Backend: JUnit 5 + AssertJ + Mockito. Servicio con mocks (`PostServiceTest`), controlador con `@WebMvcTest` +
  `@MockitoBean` (`PostControllerTest`), integración con `@SpringBootTest` (`HiloApplicationTests`).
- Frontend: Vitest con `TestBed`; HTTP con `HttpTestingController`.
- Nombres de test que describen el comportamiento: `crearUnPostVacioDevuelve400ConElCampo`.
- Para un bug: primero un test que falle y lo reproduzca, luego el arreglo.

## Git
- Ramas `tipo/HILO-123-descripcion`. Commits Conventional Commits con `Refs: HILO-123`. Ver `CONTRIBUTING.md`.

## Límites — no hacer sin que te lo pidan explícitamente
- No editar migraciones Flyway ya existentes: crear una nueva.
- No añadir dependencias (Maven ni npm).
- No tocar `.github/workflows/` ni la configuración de build.
- No hacer `git push`, ni `git commit --amend`, ni reescribir historia.
- No desactivar ni borrar tests para que algo pase.
- No usar `bypassSecurityTrust*` ni `innerHTML` con contenido de usuarios.
