import { inject, Pipe, PipeTransform } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

const URL_PATTERN = /(https?:\/\/[^\s]+)/g;

/**
 * Convierte las URLs de un texto en enlaces clicables.
 * Angular limpia el HTML de [innerHTML] y nos quitaba el target="_blank",
 * por eso marcamos el resultado como seguro.
 */
@Pipe({ name: 'linkify' })
export class LinkifyPipe implements PipeTransform {
  private readonly sanitizer = inject(DomSanitizer);

  transform(text: string): SafeHtml {
    const html = text.replace(
      URL_PATTERN,
      (url) => `<a href="${url}" target="_blank" rel="noopener">${url}</a>`,
    );
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }
}
