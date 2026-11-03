package dev.sandilabs.hilo.post;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import dev.sandilabs.hilo.common.PageResponse;
import dev.sandilabs.hilo.user.UserDto;
import java.time.Instant;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(PostController.class)
class PostControllerTest {

    @Autowired
    private MockMvc mvc;

    @MockitoBean
    private PostService postService;

    @Test
    void timelineDevuelve200ConLaPagina() throws Exception {
        when(postService.timeline(0, 20, null)).thenReturn(new PageResponse<>(List.of(), 0, 20, 0, false));

        mvc.perform(get("/api/posts"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.items").isArray())
                .andExpect(jsonPath("$.hasNext").value(false));
    }

    @Test
    void crearUnPostVacioDevuelve400ConElCampo() throws Exception {
        mvc.perform(post("/api/posts")
                        .header("X-User-Id", "1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"content\": \"   \"}"))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.errors.content").exists());
    }

    @Test
    void crearUnPostSoloConEspaciosDevuelve400ConElMensajeDeVacio() throws Exception {
        mvc.perform(post("/api/posts")
                        .header("X-User-Id", "1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body("     ")))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.errors.content").value("El post no puede estar vacío (mínimo 1 carácter)"));
    }

    @Test
    void crearUnPostDe281CaracteresDevuelve400ConElLimite() throws Exception {
        mvc.perform(post("/api/posts")
                        .header("X-User-Id", "1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body("a".repeat(281))))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.errors.content").value("El post no puede superar los 280 caracteres"));
    }

    @Test
    void crearUnPostDe280CaracteresDevuelve201() throws Exception {
        when(postService.create(eq(1L), any(CreatePostRequest.class))).thenReturn(createdPost("a".repeat(280)));

        mvc.perform(post("/api/posts")
                        .header("X-User-Id", "1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body("a".repeat(280))))
                .andExpect(status().isCreated());
    }

    @Test
    void crearUnPostDe280CaracteresConEspaciosAlFinalDevuelve201() throws Exception {
        when(postService.create(eq(1L), any(CreatePostRequest.class))).thenReturn(createdPost("a".repeat(280)));

        mvc.perform(post("/api/posts")
                        .header("X-User-Id", "1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body("a".repeat(280) + "   ")))
                .andExpect(status().isCreated());

        verify(postService).create(eq(1L), eq(new CreatePostRequest("a".repeat(280))));
    }

    @Test
    void crearUnPostSinCabeceraDeUsuarioDevuelve400() throws Exception {
        mvc.perform(post("/api/posts")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"content\": \"Hola\"}"))
                .andExpect(status().isBadRequest());
    }

    private static String body(String content) {
        return "{\"content\": \"" + content + "\"}";
    }

    private static PostDto createdPost(String content) {
        UserDto author = new UserDto(1L, "ana_garcia", "Ana García", null);
        return new PostDto(10L, author, content, 0, false, Instant.parse("2026-10-19T10:00:00Z"));
    }
}
