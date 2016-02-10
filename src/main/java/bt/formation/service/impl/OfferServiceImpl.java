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
import java.util.stream.Collectors;

@Service
@Transactional
public class OfferServiceImpl implements OfferService {

    @Autowired
    OfferRepository offerRepository;

    @Override
    public List<OfferDTO> findByCategoryId(Long id) {
        List<OfferDTO> dtos = offerRepository.findByCategoryId(id).stream().map(Offer::toDto).collect(Collectors.toList());
        return dtos;
    }

    @Override
    public OfferDTO createOffer(OfferDTO offer) {
        return offerRepository.save(offer.toEntity()).toDto();
    }

    @Override
    public OfferDTO findById(Long id) {
        if(offerRepository.findOne(id) == null)
            return null;
        return offerRepository.findOne(id).toDto();
    }

    @Override
    public List<OfferDTO> findAll() {
        List<OfferDTO> list = new ArrayList<>();
        for (Offer o : offerRepository.findAllByCreationDateAsc()) {
            list.add(o.toDto());
        }
        return list;
    }

    @Override
    public List<OfferDTO> findByUserId(Long id) {
        List<OfferDTO> list = new ArrayList<>();
        for (Offer o : offerRepository.findByUserId(id)) {
            list.add(o.toDto());
        }
        return list;
    }

    @Override
    public List<OfferDTO> findAllTop7() {
        List<OfferDTO> list = new ArrayList<>();
        for (Offer o : offerRepository.findTop7ByOrderByCreationDateDesc()) {
            list.add(o.toDto());
        }
        return list;
    }


}
