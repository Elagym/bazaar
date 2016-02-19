package bt.formation.dto;

import bt.formation.entity.Report;

import java.util.Date;

/**
 * Created by Student on 27-01-16.
 */
public class ReportDTO {

    private Long id;
    private String type;
    private String title;
    private String message;
    private Date date;
    private UserDTO author;
    private OfferDTO offer;

    public Report toEntity(){
        Report report = new Report();
        report.setId(id);
        report.setType(type);
        report.setTitle(title);
        report.setDetails(message);
        report.setAuthor(author.toEntity());
        report.setOffer(offer.toEntity());
        report.setDate(date);
        return report;
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

    public UserDTO getAuthor() {
        return author;
    }

    public void setAuthor(UserDTO author) {
        this.author = author;
    }

    public OfferDTO getOffer() {
        return offer;
    }

    public void setOffer(OfferDTO offer) {
        this.offer = offer;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
