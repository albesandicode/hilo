package dev.sandilabs.hilo;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
    void laListaDeUsuariosTieneLosSeisDeDemo() throws Exception {
        mvc.perform(get("/api/users"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(6));
    }
}
