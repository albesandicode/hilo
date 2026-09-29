package dev.sandilabs.hilo.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, Long> {

    Page<Post> findAllByOrderByCreatedAtAsc(Pageable pageable);

    Page<Post> findByAuthorUsernameOrderByCreatedAtDesc(String username, Pageable pageable);
}
