package bt.formation.dto;

import bt.formation.entity.Proposition;

/**
 * Created by Student on 27-01-16.
 */
public class PropositionDTO {

    private Long id;
    private String title;
    private String description;
    private double estimation;
    private boolean viewed;
    private OfferDTO offer;

    public Proposition toEntity(){
        Proposition proposition = new Proposition();
        proposition .setId(id);
        proposition.setTitle(title);
        proposition.setDescription(description);
        proposition.setEstimation(estimation);
        proposition.setViewed(viewed);
        proposition.setOffer(offer.toEntity());
        return proposition;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getEstimation() {
        return estimation;
    }

    public void setEstimation(double estimation) {
        this.estimation = estimation;
    }

    public boolean isViewed() {
        return viewed;
    }

    public void setViewed(boolean viewed) {
        this.viewed = viewed;
    }

    public OfferDTO getOffer() {
        return offer;
    }

    public void setOffer(OfferDTO offer) {
        this.offer = offer;
    }
}
