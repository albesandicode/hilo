import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Session } from './session';

/** Añade la cabecera X-User-Id a las llamadas a /api mientras no haya autenticación real. */
export const currentUserInterceptor: HttpInterceptorFn = (req, next) => {
  const userId = inject(Session).currentUserId();
  if (userId === null || !req.url.startsWith('/api')) {
    return next(req);
  }
  return next(req.clone({ setHeaders: { 'X-User-Id': String(userId) } }));
};
