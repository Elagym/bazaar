package bt.formation.form;

import bt.formation.dto.PropositionDTO;
import org.springframework.web.multipart.MultipartFile;

public class ContactForm {

    private String type;
    private String title;
    private String offer;
    private String message;
    private String estimation;
    private MultipartFile image;
    private String targetId;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getEstimation() {
        return estimation;
    }

    public void setEstimation(String estimation) {
        this.estimation = estimation;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public String getTargetId() {
        return targetId;
    }

    public void setTargetId(String targetId) {
        this.targetId = targetId;
    }

    public ContactForm() {
    }

    public PropositionDTO toPropositionDTO() {
        PropositionDTO propositionDTO = new PropositionDTO();
        propositionDTO.setTitle(title);
        propositionDTO.setDescription(message);
        try {
            propositionDTO.setEstimation(Double.parseDouble(estimation));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        propositionDTO.setViewed(false);
        return propositionDTO;
    }
}
