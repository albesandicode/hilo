import { Component, computed, inject, input, output } from '@angular/core';
import { Post } from '../../core/models';
import { Session } from '../../core/session';
import { LinkifyPipe } from '../../shared/linkify.pipe';
import { RelativeTimePipe } from '../../shared/relative-time.pipe';

@Component({
  selector: 'app-post-card',
  imports: [LinkifyPipe, RelativeTimePipe],
  templateUrl: './post-card.html',
  styleUrl: './post-card.css',
})
export class PostCard {
  private readonly session = inject(Session);

  readonly post = input.required<Post>();
  readonly likeToggled = output<Post>();
  readonly deleteRequested = output<Post>();

  protected readonly isMine = computed(
    () => this.post().author.id === this.session.currentUserId(),
  );
}
