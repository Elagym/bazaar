package bt.formation.entity;

import bt.formation.dto.OfferDTO;

import javax.annotation.Generated;
import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String imageUrl;
    private Date creationDate;
    private Date modifDate;
    private Date expirationDate;
    private Integer popularity;
    private String address;
    private Integer zipCode;
    private Double estimation;

    @ManyToMany
    private Set<Category> categories;


    public Offer() {
    }

    public Offer(String title, String description, String imageUrl, Date creationDate, Date modifDate, Date expirationDate, Integer popularity, String address, Integer zipCode, Double estimation) {
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.creationDate = creationDate;
        this.modifDate = modifDate;
        this.expirationDate = expirationDate;
        this.popularity = popularity;
        this.address = address;
        this.zipCode = zipCode;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getModifDate() {
        return modifDate;
    }

    public void setModifDate(Date modifDate) {
        this.modifDate = modifDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Integer getPopularity() {
        return popularity;
    }

    public void setPopularity(Integer popularity) {
        this.popularity = popularity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }

    public Double getEstimation() {
        return estimation;
    }

    public void setEstimation(Double estimation) {
        this.estimation = estimation;
    }

    public Set<Category> getCategories() {
        if (categories == null) categories = new HashSet<>();
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public OfferDTO toDto(){
        OfferDTO dto = new OfferDTO();
        dto.setId(id);
        dto.setTitle(title);
        dto.setDescription(description);
        dto.setAddress(address);
        dto.setCreationDate(creationDate);
        dto.setEstimation(estimation);
        dto.setExpirationDate(expirationDate);
        dto.setImageUrl(imageUrl);
        dto.setModifDate(modifDate);
        dto.setPopularity(popularity);
        dto.setZipCode(zipCode);
        for (Category cat : getCategories()) {
            dto.getCategories().add(cat.toDto());
        }
        return dto;

    }
}
