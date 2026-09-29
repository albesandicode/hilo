package dev.sandilabs.hilo.post;

import dev.sandilabs.hilo.user.UserDto;
import java.time.Instant;

public record PostDto(
        Long id, UserDto author, String content, int likeCount, boolean likedByMe, Instant createdAt) {

    public static PostDto from(Post post, boolean likedByMe) {
        return new PostDto(
                post.getId(),
                UserDto.from(post.getAuthor()),
                post.getContent(),
                post.getLikeCount(),
                likedByMe,
                post.getCreatedAt());
    }
}
