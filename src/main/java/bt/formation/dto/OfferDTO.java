package bt.formation.dto;

import bt.formation.entity.Category;
import bt.formation.entity.Offer;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Student on 27-01-16.
 */
public class OfferDTO {

    private Long id;
    private String title;
    private String description;
    private String imageUrl;
    private Date creationDate;
    private Date modifDate;
    private int popularity;
    private String address;
    private int zipCode;
    private double estimation;
    private Date expirationdate;
    private Set<Category> categories;

    public Offer toEntity(){
        Offer offer = new Offer();
        offer.setId(id);
        offer.setTitle(title);
        offer.setDescription(description);
        offer.setImageUrl(imageUrl);

        return offer;
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

    public int getPopularity() {
        return popularity;
    }

    public void setPopularity(int popularity) {
        this.popularity = popularity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public double getEstimation() {
        return estimation;
    }

    public void setEstimation(double estimation) {
        this.estimation = estimation;
    }

    public Date getExpirationdate() {
        return expirationdate;
    }

    public void setExpirationdate(Date expirationdate) {
        this.expirationdate = expirationdate;
    }

    public Set<Category> getCategories() {
        if(categories == null)
            categories = new HashSet<>();
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }
}