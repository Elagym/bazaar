package bt.formation.repository;

import bt.formation.entity.Category;
import bt.formation.entity.Offer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.NamedNativeQuery;
import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {

    @Query(value = "Select * from OFFER o where o.id in (Select Offer_id from offer_category where category_id = ?0)", nativeQuery = true)
    List<Offer> findByCategoryId(Long id);
}
