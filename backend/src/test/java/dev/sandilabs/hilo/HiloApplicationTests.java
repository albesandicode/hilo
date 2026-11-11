package dev.sandilabs.hilo;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.jayway.jsonpath.JsonPath;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Comparator;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

/** Arranca la aplicación entera con H2 y las migraciones de Flyway. */
@SpringBootTest
@AutoConfigureMockMvc
class HiloApplicationTests {

    @Autowired
    private MockMvc mvc;

    @Test
    void elTimelineDevuelveLosDatosDeDemoPaginados() throws Exception {
        mvc.perform(get("/api/posts"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.items.length()").value(20))
                .andExpect(jsonPath("$.totalItems").value(31))
                .andExpect(jsonPath("$.hasNext").value(true));
    }

    @Test
    void elTimelineMuestraLosPostsDelMasRecienteAlMasAntiguo() throws Exception {
        String body = mvc.perform(get("/api/posts"))
                .andExpect(status().isOk())
                .andReturn()
                .getResponse()
                .getContentAsString(StandardCharsets.UTF_8);

        List<String> fechas = JsonPath.read(body, "$.items[*].createdAt");
        List<Instant> instantes = fechas.stream().map(Instant::parse).toList();

        assertThat(instantes)
                .as("posts de la primera página ordenados por createdAt descendente")
                .hasSize(20)
                .isSortedAccordingTo(Comparator.reverseOrder());
    }

    @Test
    void laListaDeUsuariosTieneLosSeisDeDemo() throws Exception {
        mvc.perform(get("/api/users"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(6));
    }
}
