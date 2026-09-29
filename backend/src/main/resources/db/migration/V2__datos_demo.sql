-- Datos de demostración. Solo para desarrollo local.

INSERT INTO users (username, display_name, bio, created_at) VALUES
    ('ana_garcia', 'Ana García', 'Frontend en una startup de Sevilla. Angular y café.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00'),
    ('dani_backend', 'Dani Ruiz', 'Java desde antes de que fuera cool.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00'),
    ('laura_ux', 'Laura Méndez', 'Diseño de producto. Píxel a píxel.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00'),
    ('pablo_trail', 'Pablo Ortega', 'Corredor de montaña y aprendiz de Spring.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00'),
    ('sofia_sec', 'Sofía Navarro', 'Ciberseguridad. Rompo cosas para que no las rompas tú.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00'),
    ('hilo', 'Equipo Hilo', 'Cuenta oficial de Hilo.', TIMESTAMP WITH TIME ZONE '2026-09-30 10:00:00+02:00');

INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'hilo'), '¡Bienvenidos a Hilo! Contad qué estáis construyendo.', 5, TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), 'Primer día probando signals en un proyecto real. Menos código y más claro.', 1, TIMESTAMP WITH TIME ZONE '2026-10-01 10:12:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'dani_backend'), 'Recordatorio: el front valida para el usuario; el back valida para la seguridad.', 2, TIMESTAMP WITH TIME ZONE '2026-10-01 18:40:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'laura_ux'), 'Un botón de 30 píxeles en móvil es una trampa. Mínimo 44.', 1, TIMESTAMP WITH TIME ZONE '2026-10-02 11:05:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'pablo_trail'), 'Hoy 18 km por la sierra y luego a pelearme con JPA. No sé qué cansa más.', 0, TIMESTAMP WITH TIME ZONE '2026-10-02 21:30:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'sofia_sec'), 'Si vuestra API se fía de una cabecera que manda el cliente para saber quién es el usuario, tenemos que hablar.', 1, TIMESTAMP WITH TIME ZONE '2026-10-03 09:20:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), 'Guía que me está salvando la semana: https://angular.dev/guide/signals', 2, TIMESTAMP WITH TIME ZONE '2026-10-03 16:45:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'hilo'), 'Novedad: ya podéis borrar vuestros posts desde el menú de cada post.', 0, TIMESTAMP WITH TIME ZONE '2026-10-04 12:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'dani_backend'), 'Flyway + H2 en local y PostgreSQL en producción. Mismo SQL, cero sustos (casi).', 1, TIMESTAMP WITH TIME ZONE '2026-10-05 10:30:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'laura_ux'), 'Modo oscuro no es invertir colores. Es otra paleta.', 0, TIMESTAMP WITH TIME ZONE '2026-10-05 19:15:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'pablo_trail'), '¿Alguien más escribe los tests después y luego se arrepiente?', 2, TIMESTAMP WITH TIME ZONE '2026-10-06 08:50:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'sofia_sec'), 'Checklist rápida para PRs: entradas validadas, permisos comprobados en el servidor, nada de secretos en el código.', 2, TIMESTAMP WITH TIME ZONE '2026-10-06 13:10:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), 'El @for con track bien puesto y la lista va como la seda.', 0, TIMESTAMP WITH TIME ZONE '2026-10-07 11:40:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'dani_backend'), 'Hilo largo de los que no caben: hoy he migrado un servicio entero de Spring Boot 2 a 3 y el cambio de javax a jakarta me ha costado la mañana. Si os pasa, buscad y reemplazad con cuidado, revisad los imports de validación y no os fiéis del IDE a ciegas. Mañana sigo con los tests de integración, que también fallan.', 0, TIMESTAMP WITH TIME ZONE '2026-10-07 20:05:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'hilo'), 'Estamos contratando perfiles junior. Os dejamos el proceso aquí: https://example.com/empleo', 2, TIMESTAMP WITH TIME ZONE '2026-10-08 09:30:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'laura_ux'), 'Prototipo nuevo del perfil de usuario listo para revisar.', 1, TIMESTAMP WITH TIME ZONE '2026-10-08 17:25:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'pablo_trail'), 'Primer endpoint REST que hago solo. Devuelve 200 y todo. Pequeñas victorias.', 3, TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'sofia_sec'), 'El XSS sigue vivo en 2026. Cuidado con lo que metéis en innerHTML.', 1, TIMESTAMP WITH TIME ZONE '2026-10-10 10:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), 'Code review de hoy: tres comentarios, los tres con razón. Así se aprende.', 0, TIMESTAMP WITH TIME ZONE '2026-10-10 15:35:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'dani_backend'), 'Paginar no es opcional cuando la tabla crece.', 1, TIMESTAMP WITH TIME ZONE '2026-10-11 09:45:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'laura_ux'), 'Probad vuestra app con el móvil en la mano, no solo con el inspector.', 0, TIMESTAMP WITH TIME ZONE '2026-10-12 12:20:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'pablo_trail'), 'Domingo de tirada larga. El lunes, a refactorizar.', 0, TIMESTAMP WITH TIME ZONE '2026-10-12 19:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'hilo'), 'Mantenimiento programado el martes de 7:00 a 7:30.', 0, TIMESTAMP WITH TIME ZONE '2026-10-13 08:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'sofia_sec'), 'Un 403 a tiempo vale más que mil logs.', 1, TIMESTAMP WITH TIME ZONE '2026-10-13 18:30:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), '¿Vitest o Karma? En proyectos nuevos de Angular ya no hay debate.', 1, TIMESTAMP WITH TIME ZONE '2026-10-14 10:15:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'dani_backend'), 'Commits pequeños, PRs pequeñas, revisiones rápidas.', 2, TIMESTAMP WITH TIME ZONE '2026-10-14 13:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'laura_ux'), 'El contador de caracteres cambia de color al acercarse al límite. Detalle pequeño, gran diferencia.', 0, TIMESTAMP WITH TIME ZONE '2026-10-15 11:00:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'pablo_trail'), 'Me he dado cuenta de que el timeline sale al revés. ¿Soy yo o es un bug?', 1, TIMESTAMP WITH TIME ZONE '2026-10-15 20:45:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'sofia_sec'), 'Hoy toca auditar dependencias. npm audit y a revisar.', 0, TIMESTAMP WITH TIME ZONE '2026-10-16 09:10:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'ana_garcia'), 'Viernes de demo. Nos vemos a las 16:00.', 2, TIMESTAMP WITH TIME ZONE '2026-10-16 12:30:00+02:00');
INSERT INTO posts (author_id, content, like_count, created_at) VALUES
    ((SELECT id FROM users WHERE username = 'hilo'), 'Gracias por estar en Hilo. Seguimos.', 0, TIMESTAMP WITH TIME ZONE '2026-10-16 18:00:00+02:00');

-- Likes coherentes con like_count de cada post.
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00'), (SELECT id FROM users WHERE username = 'pablo_trail'), TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00'), (SELECT id FROM users WHERE username = 'sofia_sec'), TIMESTAMP WITH TIME ZONE '2026-10-01 09:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 10:12:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-01 10:12:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 18:40:00+02:00'), (SELECT id FROM users WHERE username = 'sofia_sec'), TIMESTAMP WITH TIME ZONE '2026-10-01 18:40:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-01 18:40:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-01 18:40:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-02 11:05:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-02 11:05:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-03 09:20:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-03 09:20:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-03 16:45:00+02:00'), (SELECT id FROM users WHERE username = 'pablo_trail'), TIMESTAMP WITH TIME ZONE '2026-10-03 16:45:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-03 16:45:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-03 16:45:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-05 10:30:00+02:00'), (SELECT id FROM users WHERE username = 'pablo_trail'), TIMESTAMP WITH TIME ZONE '2026-10-05 10:30:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-06 08:50:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-06 08:50:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-06 08:50:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-06 08:50:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-06 13:10:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-06 13:10:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-06 13:10:00+02:00'), (SELECT id FROM users WHERE username = 'hilo'), TIMESTAMP WITH TIME ZONE '2026-10-06 13:10:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-08 09:30:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-08 09:30:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-08 09:30:00+02:00'), (SELECT id FROM users WHERE username = 'sofia_sec'), TIMESTAMP WITH TIME ZONE '2026-10-08 09:30:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-08 17:25:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-08 17:25:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00'), (SELECT id FROM users WHERE username = 'hilo'), TIMESTAMP WITH TIME ZONE '2026-10-09 22:10:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-10 10:00:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-10 10:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-11 09:45:00+02:00'), (SELECT id FROM users WHERE username = 'pablo_trail'), TIMESTAMP WITH TIME ZONE '2026-10-11 09:45:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-13 18:30:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-13 18:30:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-14 10:15:00+02:00'), (SELECT id FROM users WHERE username = 'pablo_trail'), TIMESTAMP WITH TIME ZONE '2026-10-14 10:15:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-14 13:00:00+02:00'), (SELECT id FROM users WHERE username = 'ana_garcia'), TIMESTAMP WITH TIME ZONE '2026-10-14 13:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-14 13:00:00+02:00'), (SELECT id FROM users WHERE username = 'sofia_sec'), TIMESTAMP WITH TIME ZONE '2026-10-14 13:00:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-15 20:45:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-15 20:45:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-16 12:30:00+02:00'), (SELECT id FROM users WHERE username = 'laura_ux'), TIMESTAMP WITH TIME ZONE '2026-10-16 12:30:00+02:00');
INSERT INTO post_likes (post_id, user_id, created_at) VALUES
    ((SELECT id FROM posts WHERE created_at = TIMESTAMP WITH TIME ZONE '2026-10-16 12:30:00+02:00'), (SELECT id FROM users WHERE username = 'dani_backend'), TIMESTAMP WITH TIME ZONE '2026-10-16 12:30:00+02:00');
