package bt.formation.repository;

import bt.formation.entity.Category;
import bt.formation.entity.Offer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.NamedNativeQuery;
import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {

    @Query(value = "SELECT * FROM offer o JOIN offer_category oc ON oc.offer_id = o.id JOIN category c on oc.categories_id = c.id WHERE oc.categories_id = (?1)", nativeQuery = true)
    List<Offer> findByCategoryId(Long id);

    @Query("select o from Offer o order by o.creationDate desc")
    List<Offer> findAllByCreationDateAsc();

    @Query(value = "select * from Offer o where o.owner_id = (?1)", nativeQuery = true)
    List<Offer> findByUserId(Long id);

    List<Offer> findTop7ByOrderByCreationDateDesc();

    @Query(value = "SELECT * FROM offer o WHERE o.id IN (SELECT likedOffers_id FROM user_offer WHERE User_id = (?1))", nativeQuery = true)
    List<Offer> findFavoriteOffers(Long userId);
}
