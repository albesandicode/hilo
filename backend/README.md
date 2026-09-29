# hilo-api

Backend de Hilo (Spring Boot 3.5, Java 21). Visión general y cómo arrancar todo: [`../README.md`](../README.md).

```bash
./mvnw spring-boot:run   # API en http://localhost:8080  (Windows: mvnw.cmd spring-boot:run)
./mvnw test              # tests (JUnit 5 + MockMvc)
./mvnw verify            # lo mismo que ejecuta la CI
```

- Consola de la base de datos: http://localhost:8080/h2-console (JDBC URL `jdbc:h2:mem:hilo`, usuario `sa`, sin contraseña).
- Salud: http://localhost:8080/actuator/health
