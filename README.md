# Hilo

Red social de posts cortos para gente que construye cosas. Producto de **Sandi Labs**.

| Parte | Carpeta | Stack |
|---|---|---|
| API REST | [`backend/`](backend/) | Java 21 · Spring Boot 3.5 · JPA · Flyway · H2 (local) |
| Web | [`frontend/`](frontend/) | Angular 22 · TypeScript · Signals · Vitest |

## Arrancar en local

Necesitas **JDK 21** y **Node 24**. Dos terminales:

```bash
# Terminal 1 — API en http://localhost:8080
cd backend
./mvnw spring-boot:run        # en Windows (PowerShell): .\mvnw.cmd spring-boot:run

# Terminal 2 — Web en http://localhost:4200
cd frontend
npm ci
npm start
```

Abre http://localhost:4200 y elige un usuario de demo arriba a la derecha.
La base de datos es H2 en memoria: cada vez que reinicias la API vuelven los datos de demo.

## Tests

```bash
cd backend && ./mvnw verify      # JUnit 5 + MockMvc
cd frontend && npm test          # Vitest
```

La CI (GitHub Actions) ejecuta lo mismo en cada pull request. Una PR con la CI en rojo no se revisa.

## Documentación

- [`CONTRIBUTING.md`](CONTRIBUTING.md) — cómo trabajamos: tickets, ramas, commits, pull requests y revisión.
- [`AGENTS.md`](AGENTS.md) — instrucciones para agentes de IA (Claude Code, Copilot…). También útil para humanos.
- [`docs/producto.md`](docs/producto.md) — reglas de producto. Si el código y este documento no coinciden, es un bug.
- [`docs/arquitectura.md`](docs/arquitectura.md) — cómo está montado por dentro.
- [`docs/adr/`](docs/adr/) — decisiones de arquitectura y su porqué.
