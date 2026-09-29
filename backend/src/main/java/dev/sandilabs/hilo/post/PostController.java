package dev.sandilabs.hilo.post;

import dev.sandilabs.hilo.common.PageResponse;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * Endpoints de posts.
 * Identidad PROVISIONAL: el usuario llega en la cabecera X-User-Id (ver docs/adr/0002-autenticacion-provisional.md).
 */
@RestController
@RequestMapping("/api/posts")
public class PostController {

    private static final String USER_HEADER = "X-User-Id";

    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping
    public PageResponse<PostDto> timeline(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader(value = USER_HEADER, required = false) Long viewerId) {
        return postService.timeline(page, size, viewerId);
    }

    @GetMapping("/{id}")
    public PostDto get(@PathVariable Long id, @RequestHeader(value = USER_HEADER, required = false) Long viewerId) {
        return postService.get(id, viewerId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public PostDto create(@RequestHeader(USER_HEADER) Long userId, @Valid @RequestBody CreatePostRequest request) {
        return postService.create(userId, request);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id, @RequestHeader(USER_HEADER) Long userId) {
        postService.delete(id, userId);
    }

    @PostMapping("/{id}/like")
    public PostDto like(@PathVariable Long id, @RequestHeader(USER_HEADER) Long userId) {
        return postService.like(id, userId);
    }

    @DeleteMapping("/{id}/like")
    public PostDto unlike(@PathVariable Long id, @RequestHeader(USER_HEADER) Long userId) {
        return postService.unlike(id, userId);
    }
}
