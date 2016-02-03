package bt.formation.service;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.entity.Offer;

import java.util.List;

public interface OfferService {
    List<OfferDTO> findByCategoryId(Long id);
    OfferDTO createOffer(OfferDTO offer);
}
