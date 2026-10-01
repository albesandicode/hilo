import { Component, inject, OnInit, signal } from '@angular/core';
import { TIMELINE_PAGE_SIZE } from '../../core/constants';
import { Post } from '../../core/models';
import { PostApi } from '../../core/post-api';
import { Session } from '../../core/session';
import { Composer } from '../composer/composer';
import { PostCard } from '../post-card/post-card';

@Component({
  selector: 'app-timeline',
  imports: [Composer, PostCard],
  templateUrl: './timeline.html',
  styleUrl: './timeline.css',
})
export class Timeline implements OnInit {
  private readonly postApi = inject(PostApi);
  protected readonly session = inject(Session);

  protected readonly posts = signal<Post[]>([]);
  protected readonly loading = signal(true);

  ngOnInit(): void {
    this.postApi.timeline(0, TIMELINE_PAGE_SIZE).subscribe({
      next: (page) => {
        this.posts.set(page.items);
        this.loading.set(false);
      },
      error: () => this.loading.set(false),
    });
  }

  protected onPublished(post: Post): void {
    this.posts.update((list) => [post, ...list]);
  }

  protected onLikeToggled(post: Post): void {
    const request = post.likedByMe ? this.postApi.unlike(post.id) : this.postApi.like(post.id);
    request.subscribe((updated) => this.replace(updated));
  }

  protected onDeleteRequested(post: Post): void {
    this.postApi.remove(post.id).subscribe(() => {
      this.posts.update((list) => list.filter((p) => p.id !== post.id));
    });
  }

  private replace(updated: Post): void {
    this.posts.update((list) => list.map((p) => (p.id === updated.id ? updated : p)));
  }
}
