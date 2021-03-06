package bt.formation.repository;

import bt.formation.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long>{

    @Query("select u.comments from User u where u.id = (?1)")
    List<Comment> findByUserId(Long id);
}
