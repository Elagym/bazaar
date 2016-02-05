package bt.formation.controller;

import bt.formation.dto.CommentDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.dto.UserDTO;
import bt.formation.service.CommentService;
import bt.formation.service.OfferService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/offer")
public class OfferController {

    @Autowired
    CommentService commentService;
    @Autowired
    OfferService offerService;
    @Autowired
    UserService userService;

    @RequestMapping("/comment")
    public String comment(@AuthenticationPrincipal UserDTO author, @RequestParam String offerId, @RequestParam String ownerId, @RequestParam String message, @RequestParam String thumb, @RequestParam String title){
        OfferDTO offer = offerService.findById(Long.parseLong(offerId));
        CommentDTO comment = new CommentDTO();
        comment.setTitle(title);
        comment.setDescription(message);
        comment.setLiked(("on".equals(thumb)) ? true : false);
        comment.setAuthor(author);
        comment = commentService.createComment(comment);

        UserDTO owner = userService.findById(Long.parseLong(ownerId));
        owner.getComments().add(comment);
        userService.updateUser(owner);

        return "redirect:/offer/" + offer.getId();
    }
}
