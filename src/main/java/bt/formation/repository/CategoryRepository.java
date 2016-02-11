package bt.formation.repository;


import bt.formation.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;
import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    Category findById(Long id);

    Category findByName(String name);

    List<Category> findAllByOrderByNameAsc();
}
