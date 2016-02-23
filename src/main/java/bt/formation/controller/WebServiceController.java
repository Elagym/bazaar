package bt.formation.controller;


import bt.formation.dto.*;
import bt.formation.entity.Offer;
import bt.formation.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    @Autowired
    ReportService reportService;

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

    @RequestMapping("/user/ispropositionviewed/{id}")
    public boolean isViewed(@PathVariable Long id){
        PropositionDTO dto = propositionService.findById(id);
        return dto.isViewed();
    }

    @RequestMapping("/user/getnewpropscount/{id}")
    public List<PropositionDTO> getNewPropsCount(@PathVariable Long id){
        UserDTO dto = userService.findById(id);
        List<PropositionDTO> toReturn = dto.getPropositions();
        toReturn.removeIf(p -> p.isViewed());
        return toReturn;
    }

    @RequestMapping("/user/getfavsoffers/{userId}")
    public List<OfferDTO> getFavsOffers(@PathVariable Long userId){
        return offerService.findFavoriteOffers(userId);
    }

    @RequestMapping("/admin/viewreport/{id}")
    public ReportDTO viewReport(@PathVariable Long id){
        ReportDTO report = reportService.findById(id);
        report.setViewed(true);
        return reportService.updateReport(report);
    }

    @RequestMapping("/admin/getnewreportscount")
    public int getNewReportsCount(){
        return reportService.getNewReportsCount();
    }
}
