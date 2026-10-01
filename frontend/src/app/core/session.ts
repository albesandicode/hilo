import { Injectable, signal } from '@angular/core';

const STORAGE_KEY = 'hilo.currentUserId';

/**
 * Sesión PROVISIONAL: guarda qué usuario de demo está "conectado".
 * No hay login real todavía (ver docs/adr/0002-autenticacion-provisional.md).
 */
@Injectable({ providedIn: 'root' })
export class Session {
  readonly currentUserId = signal<number | null>(this.readStored());

  select(userId: number): void {
    this.currentUserId.set(userId);
    try {
      localStorage.setItem(STORAGE_KEY, String(userId));
    } catch {
      // Navegación privada o almacenamiento bloqueado: la sesión dura lo que la pestaña.
    }
  }

  private readStored(): number | null {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      return raw ? Number(raw) : null;
    } catch {
      return null;
    }
  }
}
