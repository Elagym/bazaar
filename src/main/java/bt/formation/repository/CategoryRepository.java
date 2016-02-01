package bt.formation.repository;


import bt.formation.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    Category findById(Long id);

    Category findByName(String name);
}
