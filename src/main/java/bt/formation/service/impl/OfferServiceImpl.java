package bt.formation.service.impl;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.entity.Category;
import bt.formation.entity.Offer;
import bt.formation.repository.OfferRepository;
import bt.formation.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OfferServiceImpl implements OfferService {

    @Autowired
    OfferRepository offerRepository;

    @Override
    public List<OfferDTO> findByCategoryId(Long id) {
//        List<Offer> offerList = offerRepository.findByCategoryId(id);
//        List<OfferDTO> dtoList = new ArrayList<>();
//        for (Offer o : offerList) {
//            dtoList.add(o.toDto());
//        }
//
//        return dtoList;

        return null;
    }

    @Override
    public OfferDTO createOffer(OfferDTO offer) {
        return offerRepository.save(offer.toEntity()).toDto();
    }
}
