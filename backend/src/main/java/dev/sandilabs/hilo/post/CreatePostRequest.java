package dev.sandilabs.hilo.post;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

/**
 * El contenido se recorta al construirse, así que las validaciones cuentan los caracteres sin los espacios
 * del principio y del final (ver docs/producto.md).
 */
public record CreatePostRequest(
    @NotBlank(message = EMPTY_MESSAGE) @Size(max = MAX_LENGTH, message = TOO_LONG_MESSAGE) String content) {

    public static final int MAX_LENGTH = 280;
    static final String EMPTY_MESSAGE = "El post no puede estar vacío (mínimo 1 carácter)";
    static final String TOO_LONG_MESSAGE = "El post no puede superar los " + MAX_LENGTH + " caracteres";

    public CreatePostRequest {
        content = content == null ? null : content.strip();
    }
}
