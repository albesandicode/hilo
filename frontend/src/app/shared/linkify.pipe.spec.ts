import { TestBed } from '@angular/core/testing';
import { LinkifyPipe } from './linkify.pipe';

describe('LinkifyPipe', () => {
  it('convierte una URL en enlace', () => {
    const pipe = TestBed.runInInjectionContext(() => new LinkifyPipe());
    const result = pipe.transform('Mirad https://angular.dev hoy') as { toString(): string };
    expect(String(result)).toContain('<a href="https://angular.dev"');
  });
});
