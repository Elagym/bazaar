package bt.formation.controller;


import bt.formation.dto.CommentDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.service.CommentService;
import bt.formation.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class WebServiceController {

    @Autowired
    OfferService offerService;
    @Autowired
    CommentService commentService;

    @RequestMapping("/offers/refresh")
    public List<OfferDTO> refreshOffers(){
        return offerService.findAll();
    }

    @RequestMapping("/profile/{id}/comments")
    public List<CommentDTO> getComments(@PathVariable Long id){
        return commentService.findByUserId(id);
    }

}
