# ADR-0001 · Stack de Hilo

**Estado:** aceptada · **Fecha:** 2026-09-28

## Contexto
Equipo pequeño, producto web, necesitamos poder contratar en España sin pelearnos con el mercado.

## Decisión
- **Backend:** Java 21 + Spring Boot 3.5 + Spring Data JPA + Flyway. Java 21 es LTS y es la versión más extendida en
  empresas. Spring Boot 3.5 porque es la línea con más código en producción hoy; la migración a Spring Boot 4
  queda planificada como trabajo propio, no mezclada con funcionalidades.
- **Base de datos:** H2 en memoria para desarrollo; PostgreSQL en producción (pendiente). El SQL de las migraciones
  se escribe compatible con ambos.
- **Frontend:** Angular 22 con componentes standalone y signals. Tests con Vitest (por defecto desde Angular 21).
- **Monorepo:** `backend/` y `frontend/` en el mismo repositorio para que un cambio de contrato de la API y su uso
  en el front viajen en la misma pull request.

## Consecuencias
- Cualquier cambio de DTO toca dos carpetas en la misma PR.
- Hay que vigilar que el SQL siga siendo compatible con PostgreSQL.
