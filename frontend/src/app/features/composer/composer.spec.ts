import { provideHttpClient } from '@angular/common/http';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed } from '@angular/core/testing';
import { Composer } from './composer';

describe('Composer', () => {
  function setup() {
    TestBed.configureTestingModule({
      imports: [Composer],
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    const fixture = TestBed.createComponent(Composer);
    const element = fixture.nativeElement as HTMLElement;
    const textarea = element.querySelector('textarea')!;
    const button = element.querySelector('button')!;
    const type = async (value: string) => {
      textarea.value = value;
      textarea.dispatchEvent(new Event('input'));
      await fixture.whenStable();
    };
    return { fixture, element, button, type };
  }

  it('deshabilita el botón si el texto está vacío', async () => {
    const { fixture, button } = setup();
    await fixture.whenStable();
    expect(button.disabled).toBe(true);
  });

  it('muestra los caracteres que quedan', async () => {
    const { element, type } = setup();
    await type('hola');
    expect(element.querySelector('.counter')?.textContent?.trim()).toBe('276');
  });

  it('envía el post y limpia el campo', async () => {
    const { fixture, button, type, element } = setup();
    const http = TestBed.inject(HttpTestingController);
    await type('Mi primer post');
    button.click();

    const req = http.expectOne('/api/posts');
    expect(req.request.method).toBe('POST');
    expect(req.request.body).toEqual({ content: 'Mi primer post' });
    req.flush({});

    await fixture.whenStable();
    expect(element.querySelector('textarea')!.value).toBe('');
    http.verify();
  });
});
