import { provideHttpClient } from '@angular/common/http';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { TestBed } from '@angular/core/testing';
import { PostApi } from './post-api';

describe('PostApi', () => {
  let api: PostApi;
  let http: HttpTestingController;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    api = TestBed.inject(PostApi);
    http = TestBed.inject(HttpTestingController);
  });

  afterEach(() => http.verify());

  it('pide el timeline con página y tamaño', () => {
    api.timeline(2, 20).subscribe();
    const req = http.expectOne('/api/posts?page=2&size=20');
    expect(req.request.method).toBe('GET');
    req.flush({ items: [], page: 2, size: 20, totalItems: 0, hasNext: false });
  });

  it('da like con POST y lo quita con DELETE', () => {
    api.like(7).subscribe();
    expect(http.expectOne('/api/posts/7/like').request.method).toBe('POST');
    api.unlike(7).subscribe();
    expect(http.expectOne('/api/posts/7/like').request.method).toBe('DELETE');
  });
});
