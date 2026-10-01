import { Component, computed, inject, output, signal } from '@angular/core';
import { MAX_POST_LENGTH } from '../../core/constants';
import { Post } from '../../core/models';
import { PostApi } from '../../core/post-api';

@Component({
  selector: 'app-composer',
  templateUrl: './composer.html',
  styleUrl: './composer.css',
})
export class Composer {
  private readonly postApi = inject(PostApi);

  readonly published = output<Post>();

  protected readonly maxLength = MAX_POST_LENGTH;
  protected readonly text = signal('');
  protected readonly sending = signal(false);
  protected readonly remaining = computed(() => this.maxLength - this.text().length);
  protected readonly canPublish = computed(
    () => this.text().trim().length > 0 && this.remaining() >= 0 && !this.sending(),
  );

  protected onInput(event: Event): void {
    this.text.set((event.target as HTMLTextAreaElement).value);
  }

  protected publish(): void {
    if (!this.canPublish()) return;
    this.sending.set(true);
    this.postApi.create(this.text()).subscribe({
      next: (post) => {
        this.published.emit(post);
        this.text.set('');
        this.sending.set(false);
      },
      error: () => this.sending.set(false),
    });
  }
}
