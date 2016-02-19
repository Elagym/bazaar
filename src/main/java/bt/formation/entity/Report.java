package bt.formation.entity;

import bt.formation.dto.OfferDTO;
import bt.formation.dto.ReportDTO;
import bt.formation.dto.UserDTO;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String type;
    private String message;
    private Date date;

    @ManyToOne
    private User author;

    @ManyToOne
    private Offer offer;


    public Report() {
    }

    public Report(String type, String title, String message) {
        this.type = type;
        this.message = message;
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDetails() {
        return message;
    }

    public void setDetails(String details) {
        this.message = details;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Offer getOffer() {
        return offer;
    }

    public void setOffer(Offer offer) {
        this.offer = offer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ReportDTO toDto() {
        ReportDTO dto = new ReportDTO();
        dto.setId(id);
        dto.setMessage(message);
        dto.setType(type);
        dto.setTitle(title);
        dto.setDate(date);

        UserDTO u = new UserDTO();
        u.setId(author.getId());
        u.setUsername(author.getUsername());
        u.setEmail(author.getEmail());
        dto.setAuthor(u);

        OfferDTO o = new OfferDTO();
        o.setId(offer.getId());
        o.setTitle(offer.getTitle());
        o.setDescription(offer.getDescription());
        o.setOwner(u);
        dto.setOffer(o);

        return dto;
    }
}
