package dev.sandilabs.hilo.post;

import dev.sandilabs.hilo.common.NotFoundException;
import dev.sandilabs.hilo.common.PageResponse;
import dev.sandilabs.hilo.user.User;
import dev.sandilabs.hilo.user.UserRepository;
import java.time.Clock;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PostService {

    private final PostRepository posts;
    private final PostLikeRepository likes;
    private final UserRepository users;
    private final Clock clock;

    public PostService(PostRepository posts, PostLikeRepository likes, UserRepository users, Clock clock) {
        this.posts = posts;
        this.likes = likes;
        this.users = users;
        this.clock = clock;
    }

    @Transactional(readOnly = true)
    public PageResponse<PostDto> timeline(int page, int size, Long viewerId) {
        return PageResponse.of(posts.findAllByOrderByCreatedAtAsc(PageRequest.of(page, size))
                .map(post -> toDto(post, viewerId)));
    }

    @Transactional(readOnly = true)
    public PageResponse<PostDto> byAuthor(String username, int page, int size, Long viewerId) {
        if (users.findByUsername(username).isEmpty()) {
            throw new NotFoundException("No existe el usuario @" + username);
        }
        return PageResponse.of(posts.findByAuthorUsernameOrderByCreatedAtDesc(username, PageRequest.of(page, size))
                .map(post -> toDto(post, viewerId)));
    }

    @Transactional(readOnly = true)
    public PostDto get(Long postId, Long viewerId) {
        return toDto(findPost(postId), viewerId);
    }

    public PostDto create(Long authorId, CreatePostRequest request) {
        User author = findUser(authorId);
        Post post = posts.save(new Post(author, request.content().strip(), clock.instant()));
        return toDto(post, authorId);
    }

    public void delete(Long postId, Long requesterId) {
        Post post = findPost(postId);
        posts.delete(post);
    }

    public PostDto like(Long postId, Long userId) {
        Post post = findPost(postId);
        User user = findUser(userId);
        likes.save(new PostLike(post, user, clock.instant()));
        post.incrementLikes();
        return toDto(post, userId);
    }

    public PostDto unlike(Long postId, Long userId) {
        Post post = findPost(postId);
        likes.findFirstByPostIdAndUserId(postId, userId).ifPresent(likes::delete);
        post.decrementLikes();
        return toDto(post, userId);
    }

    private Post findPost(Long postId) {
        return posts.findById(postId).orElseThrow(() -> new NotFoundException("No existe el post " + postId));
    }

    private User findUser(Long userId) {
        return users.findById(userId).orElseThrow(() -> new NotFoundException("No existe el usuario " + userId));
    }

    private PostDto toDto(Post post, Long viewerId) {
        boolean likedByMe = viewerId != null && likes.existsByPostIdAndUserId(post.getId(), viewerId);
        return PostDto.from(post, likedByMe);
    }
}
