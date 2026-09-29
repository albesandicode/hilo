package dev.sandilabs.hilo.config;

import java.time.Clock;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/** Un único reloj inyectable: en los tests se sustituye por uno fijo y las fechas son predecibles. */
@Configuration
public class ClockConfig {

    @Bean
    public Clock clock() {
        return Clock.systemUTC();
    }
}
