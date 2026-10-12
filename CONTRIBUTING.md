# Cómo trabajamos en Sandi Labs

Este documento es el contrato del equipo. Si algo no está aquí, se pregunta en el canal o al tech lead.

## 1. Todo empieza en un ticket
Cada cambio nace de un ticket `HILO-XXX` con **contexto**, **criterios de aceptación** y, a veces, pistas.
Si un criterio es ambiguo, se pregunta **antes** de escribir código. Preguntar no es molestar; adivinar sí.

## 2. Antes de abrir la IA: plan de 5 minutos
Escribe (en el ticket o en tus notas) tres cosas:
1. **Qué** hay que cambiar y **dónde** creo que está (archivos).
2. **Cómo sabré que funciona**: qué test, qué petición, qué veo en pantalla.
3. **El prompt**: contexto + tarea + restricciones + cómo verificar. Plantilla en el punto 8.

## 3. Ramas
Desde `main` actualizado:

```
tipo/HILO-123-descripcion-corta
```
`tipo` = `feat` (funcionalidad) · `fix` (bug) · `refactor` · `test` · `docs` · `chore`.
Ejemplo: `fix/HILO-101-limite-280-en-api`.

## 4. Commits — Conventional Commits
```
fix(api): rechazar posts de más de 280 caracteres

Refs: HILO-101
```
- Formato `tipo(ámbito): qué hace`, en imperativo y en minúscula. Ámbitos: `api`, `web`, `db`, `ci`, `docs`.
- Commits pequeños que cuenten una historia. "cambios" o "arreglos varios" no es un mensaje.

## 5. Pull request
- Una PR = un ticket. Si crece mucho, se parte.
- Rellena **todas** las secciones de la plantilla, incluida **Uso de IA**.
- La CI tiene que estar en verde antes de pedir revisión.
- Revisa tú primero tu propio diff en GitHub ("Files changed"), como si fuera de otro.

## 6. Revisión de código
- Hace falta **1 aprobación** del tech lead.
- Los comentarios se responden todos: o se cambia, o se explica por qué no.
- El autor tiene que poder explicar **cualquier línea** de su PR. "Lo hizo la IA" no es una explicación.
- Se mergea con **squash merge** y se borra la rama.

## 7. Definición de "hecho"
- [ ] Cumple todos los criterios de aceptación del ticket.
- [ ] Tiene tests que fallarían sin el cambio (si es un bug: primero el test que lo reproduce).
- [ ] `./mvnw verify` y `npm test` en verde en local y en la CI.
- [ ] Probado a mano: qué hiciste y qué viste, escrito en la PR.
- [ ] Documentación actualizada si cambia un comportamiento (`docs/producto.md`, README, ADR).

## 8. Trabajar con IA
Usamos agentes de IA (Claude Code, Copilot) a diario. Las reglas:
- **Tú eres el autor.** Lo que se mergea es responsabilidad de quien abre la PR.
- **Contexto antes que tarea.** Señala los archivos relevantes y las reglas de `docs/producto.md`; no le pidas
  "arregla el bug" a ciegas.
- **Modo plan para cambios de más de un archivo.** Lee el plan y corrígelo antes de dejarle escribir.
- **Lee cada comando antes de aprobarlo.** Nunca le pases contraseñas, tokens ni datos personales.
- **Revisa el diff entero.** Los agentes tocan a veces archivos que no les pediste.
- **Verifica tú.** Ejecuta los tests y prueba a mano; no te fíes de "he comprobado que funciona".

Plantilla de prompt:
```
Contexto: [qué es Hilo / qué parte toca / archivos relevantes / regla de docs/producto.md]
Tarea: [qué tiene que pasar, en una o dos frases]
Restricciones: [qué no tocar, convenciones, sin dependencias nuevas, etc.]
Verificación: [qué test añadir o ejecutar y qué resultado espero]
```
