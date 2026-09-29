# ADR-0002 · Identidad provisional con cabecera `X-User-Id`

**Estado:** aceptada (provisional) · **Fecha:** 2026-09-29

## Contexto
Queríamos enseñar el producto antes de tener registro y login.

## Decisión
El front deja elegir un usuario de demo y manda su id en la cabecera `X-User-Id`. El backend se fía de esa cabecera.

## Consecuencias
- **Esto no es seguro**: cualquiera puede mandar la cabecera que quiera y hacerse pasar por otro usuario.
  Es aceptable solo mientras Hilo no tenga usuarios reales.
- Aun así, las reglas de permisos (por ejemplo, "solo el autor borra su post") **se comprueban en el servidor** con
  el usuario de la cabecera. Cuando llegue la autenticación real solo cambiará de dónde sale el usuario, no las reglas.
- Sustituir esta cabecera por autenticación real es un requisito antes de abrir Hilo al público.
