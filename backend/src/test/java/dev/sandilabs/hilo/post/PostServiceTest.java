package dev.sandilabs.hilo.post;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import dev.sandilabs.hilo.common.NotFoundException;
import dev.sandilabs.hilo.user.User;
import dev.sandilabs.hilo.user.UserRepository;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class PostServiceTest {

    private static final Instant NOW = Instant.parse("2026-10-19T10:00:00Z");

    @Mock
    private PostRepository posts;

    @Mock
    private PostLikeRepository likes;

    @Mock
    private UserRepository users;

    private PostService service;
    private User ana;

    @BeforeEach
    void setUp() {
        service = new PostService(posts, likes, users, Clock.fixed(NOW, ZoneOffset.UTC));
        ana = new User("ana_garcia", "Ana García", null, NOW);
    }

    @Test
    void createGuardaElContenidoSinEspaciosYConLaHoraDelReloj() {
        when(users.findById(1L)).thenReturn(Optional.of(ana));
        when(posts.save(any(Post.class))).thenAnswer(invocation -> invocation.getArgument(0));

        PostDto created = service.create(1L, new CreatePostRequest("  Hola Hilo  "));

        assertThat(created.content()).isEqualTo("Hola Hilo");
        assertThat(created.createdAt()).isEqualTo(NOW);
        assertThat(created.author().username()).isEqualTo("ana_garcia");
    }

    @Test
    void createConUsuarioInexistenteLanzaNotFound() {
        when(users.findById(99L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> service.create(99L, new CreatePostRequest("Hola")))
                .isInstanceOf(NotFoundException.class);
    }

    @Test
    void likeGuardaElLikeYSumaUnoAlContador() {
        Post post = new Post(ana, "Un post", NOW);
        User dani = new User("dani_backend", "Dani Ruiz", null, NOW);
        when(posts.findById(5L)).thenReturn(Optional.of(post));
        when(users.findById(2L)).thenReturn(Optional.of(dani));

        PostDto result = service.like(5L, 2L);

        assertThat(result.likeCount()).isEqualTo(1);
        verify(likes).save(any(PostLike.class));
    }
}
