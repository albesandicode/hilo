package dev.sandilabs.hilo.post;

import jakarta.validation.constraints.NotBlank;

public record CreatePostRequest(@NotBlank(message = "El post no puede estar vacío") String content) {}
