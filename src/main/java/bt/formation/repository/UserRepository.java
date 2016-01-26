package bt.formation.repository;

import bt.formation.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Student on 14-01-16.
 */
public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsername(String s);
}
