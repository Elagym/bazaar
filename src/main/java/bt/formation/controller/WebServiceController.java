package bt.formation.controller;


import bt.formation.dto.OfferDTO;
import bt.formation.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class WebServiceController {

    @Autowired
    OfferService offerService;

    @RequestMapping("/offers/refresh")
    public List<OfferDTO> refreshOffers(){
        return offerService.findAll();
    }

}
