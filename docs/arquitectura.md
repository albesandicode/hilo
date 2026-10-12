# Arquitectura

```
navegador ──► Angular (localhost:4200) ──/api──► Spring Boot (localhost:8080) ──► H2 en memoria
                      proxy.conf.json                     Flyway crea el esquema y los datos de demo
```

## Backend (`backend/`)
Organizado **por funcionalidad**, no por capa técnica:

```
dev.sandilabs.hilo
├── post/      Post, PostLike, PostController, PostService, repositorios y DTOs
├── user/      User, UserController, UserRepository, UserDto
├── common/    excepciones, manejo global de errores (ProblemDetail), PageResponse
└── config/    beans de configuración (Clock)
```

- **Controller**: HTTP (rutas, cabeceras, códigos de estado, `@Valid`). Sin lógica de negocio.
- **Service**: reglas de negocio y transacciones (`@Transactional`).
- **Repository**: acceso a datos con Spring Data JPA.
- **DTO** (`record`): lo que entra y sale por la API. Las entidades JPA no salen nunca del servicio.
- **Errores**: `GlobalExceptionHandler` responde en formato ProblemDetail (`type`, `title`, `status`, `detail`).
- **Esquema**: solo Flyway (`src/main/resources/db/migration`). Hibernate no toca el esquema (`ddl-auto: none`).
  Una migración publicada **no se edita nunca**: se crea otra nueva (`V3__...sql`).
- **Fechas**: siempre `Instant` en UTC, a partir del `Clock` inyectado (los tests usan un reloj fijo).

## Frontend (`frontend/`)
```
src/app
├── core/       modelos de la API, servicios HTTP (PostApi, UserApi), sesión, interceptor
├── features/   pantallas y componentes de negocio (timeline, composer, post-card)
└── shared/     piezas reutilizables sin negocio (pipes)
```

- Componentes standalone, `input()`/`output()`, signals y control flow (`@if`, `@for`).
- Las llamadas HTTP viven en `core/`; los componentes no usan `HttpClient` directamente.
- Los tipos de `core/models.ts` reflejan los DTOs del backend: si cambias uno, cambia el otro en la misma PR.
