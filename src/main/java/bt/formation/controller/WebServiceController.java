package bt.formation.controller;


import bt.formation.dto.CommentDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.dto.PropositionDTO;
import bt.formation.dto.UserDTO;
import bt.formation.service.CommentService;
import bt.formation.service.OfferService;
import bt.formation.service.PropositionService;
import bt.formation.service.UserService;
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
    @Autowired
    UserService userService;
    @Autowired
    PropositionService propositionService;

    @RequestMapping("/offers/refresh")
    public List<OfferDTO> refreshOffers(){
        return offerService.findAll();
    }

    @RequestMapping("/profile/{id}/comments")
    public List<CommentDTO> getComments(@PathVariable Long id){
        return commentService.findByUserId(id);
    }

    @RequestMapping("/like/{offerId}/{userId}")
    public boolean likeOffer(@PathVariable Long offerId, @PathVariable Long userId){

        OfferDTO offer = offerService.findById(offerId);
        UserDTO user = userService.findById(userId);
        if(!user.getLikedOffers().contains(offerId)){
            offer.setPopularity(offer.getPopularity()+1);
            offerService.createOffer(offer); //create = update
            return userService.handleLikedOffer(userId, offerId);
        }else{
            offer.setPopularity(offer.getPopularity()-1);
            offerService.createOffer(offer); //create = update
            return userService.handleLikedOffer(userId, offerId);
        }
    }

    @RequestMapping("/user/viewproposition/{id}")
    public PropositionDTO viewProposition(@PathVariable Long id){
        PropositionDTO dto = propositionService.findById(id);
        dto.setViewed(true);
        return propositionService.updateProposition(dto);
    }

}
