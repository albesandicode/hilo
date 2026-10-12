# Reglas de producto de Hilo

Esta es la fuente de verdad del comportamiento esperado. Si el código hace otra cosa, el código está mal
(o hay que hablar con producto antes de cambiar este documento).

## Posts
- Un post tiene entre **1 y 280 caracteres**, contados después de quitar los espacios del principio y del final.
- La regla se aplica **en el servidor**. El contador del front es una ayuda para el usuario, no una garantía.
- Las URLs que empiezan por `http://` o `https://` se muestran como enlaces que abren en otra pestaña.
- El contenido de un post es **texto**: nunca se interpreta como HTML.
- Solo el **autor** puede borrar su post. Borrar un post borra también sus likes.

## Timeline
- Muestra los posts de todos los usuarios, **del más reciente al más antiguo**.
- Se carga por páginas de 20. Al llegar al final se pueden cargar más.

## Likes
- Un usuario puede dar **un único like** a cada post. Darlo dos veces no suma dos.
- Quitar un like que no existe no hace nada. El contador **nunca** es negativo.

## Usuarios y sesión
- De momento no hay registro ni login: se elige un usuario de demo (ver `docs/adr/0002-autenticacion-provisional.md`).
