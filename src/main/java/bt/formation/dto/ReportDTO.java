package bt.formation.dto;

import bt.formation.entity.Report;

/**
 * Created by Student on 27-01-16.
 */
public class ReportDTO {

    private Long id;
    private String type;
    private String name;
    private String email;
    private String details;
    private UserDTO user;
    private OfferDTO offer;

    public Report toEntity(){
        Report report = new Report();
        report.setId(id);
        report.setType(type);
        report.setName(name);
        report.setEmail(email);
        report.setDetails(details);
        report.setUser(user.toEntity());
        report.setOffer(offer.toEntity());
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public OfferDTO getOffer() {
        return offer;
    }

    public void setOffer(OfferDTO offer) {
        this.offer = offer;
    }
}
