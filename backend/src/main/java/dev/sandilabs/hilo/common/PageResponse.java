package dev.sandilabs.hilo.common;

import java.util.List;
import org.springframework.data.domain.Page;

/** Respuesta paginada estable para el front (no exponemos el Page de Spring tal cual). */
public record PageResponse<T>(List<T> items, int page, int size, long totalItems, boolean hasNext) {

    public static <T> PageResponse<T> of(Page<T> page) {
        return new PageResponse<>(
                page.getContent(), page.getNumber(), page.getSize(), page.getTotalElements(), page.hasNext());
    }
}
