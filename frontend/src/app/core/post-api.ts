import { HttpClient, HttpParams } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Page, Post } from './models';

@Injectable({ providedIn: 'root' })
export class PostApi {
  private readonly http = inject(HttpClient);
  private readonly baseUrl = '/api/posts';

  timeline(page: number, size: number): Observable<Page<Post>> {
    const params = new HttpParams().set('page', page).set('size', size);
    return this.http.get<Page<Post>>(this.baseUrl, { params });
  }

  create(content: string): Observable<Post> {
    return this.http.post<Post>(this.baseUrl, { content });
  }

  remove(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }

  like(id: number): Observable<Post> {
    return this.http.post<Post>(`${this.baseUrl}/${id}/like`, null);
  }

  unlike(id: number): Observable<Post> {
    return this.http.delete<Post>(`${this.baseUrl}/${id}/like`);
  }
}
