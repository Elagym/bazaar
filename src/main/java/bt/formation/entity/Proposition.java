package bt.formation.entity;

import bt.formation.dto.PropositionDTO;

import javax.persistence.*;

@Entity
public class Proposition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private Double estimation;
    private boolean viewed;

    @ManyToOne
    private Offer offer;

    @ManyToOne
    private User author;

    public Proposition() {
    }

    public Proposition(String title, String description, Double estimation) {
        this.title = title;
        this.description = description;
        this.estimation = estimation;
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

    public Double getEstimation() {
        return estimation;
    }

    public void setEstimation(Double estimation) {
        this.estimation = estimation;
    }

    public Offer getOffer() {
        return offer;
    }

    public void setOffer(Offer offer) {
        this.offer = offer;
    }

    public boolean isViewed() {
        return viewed;
    }

    public void setViewed(boolean viewed) {
        this.viewed = viewed;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public PropositionDTO toDto(){
        PropositionDTO dto = new PropositionDTO();
        dto.setId(id);
        dto.setEstimation(estimation);
        dto.setDescription(description);
        dto.setTitle(title);
        dto.setViewed(viewed);
        dto.setOffer(offer.toDto());
        dto.setAuthor(author.toDto());
        return dto;
    }
}
