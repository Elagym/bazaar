package bt.formation.entity;

import javax.annotation.Generated;
import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
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
        return Id;
    }

    public void setId(Long id) {
        Id = id;
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
}
