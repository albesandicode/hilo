package dev.sandilabs.hilo.user;

import dev.sandilabs.hilo.common.NotFoundException;
import dev.sandilabs.hilo.common.PageResponse;
import dev.sandilabs.hilo.post.PostDto;
import dev.sandilabs.hilo.post.PostService;
import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserRepository users;
    private final PostService postService;

    public UserController(UserRepository users, PostService postService) {
        this.users = users;
        this.postService = postService;
    }

    /** Lista de usuarios para el selector de demo del front. */
    @GetMapping
    public List<UserDto> list() {
        return users.findAll(Sort.by("username")).stream().map(UserDto::from).toList();
    }

    @GetMapping("/{username}")
    public UserDto get(@PathVariable String username) {
        return users.findByUsername(username)
                .map(UserDto::from)
                .orElseThrow(() -> new NotFoundException("No existe el usuario @" + username));
    }

    @GetMapping("/{username}/posts")
    public PageResponse<PostDto> posts(
            @PathVariable String username,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader(value = "X-User-Id", required = false) Long viewerId) {
        return postService.byAuthor(username, page, size, viewerId);
    }
}
