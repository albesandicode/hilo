import { Component, inject, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { User } from './core/models';
import { Session } from './core/session';
import { UserApi } from './core/user-api';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App implements OnInit {
  private readonly userApi = inject(UserApi);
  protected readonly session = inject(Session);
  protected readonly users = signal<User[]>([]);

  ngOnInit(): void {
    this.userApi.list().subscribe((users) => this.users.set(users));
  }

  protected onUserSelected(event: Event): void {
    this.session.select(Number((event.target as HTMLSelectElement).value));
  }
}
