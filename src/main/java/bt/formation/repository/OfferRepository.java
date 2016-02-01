package bt.formation.repository;

import bt.formation.entity.Category;
import bt.formation.entity.Offer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {
    //List<Offer> findByCategoryIn(List<Category> categories);
}
