package bt.formation.form;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.service.CategoryService;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class CreateOfferForm {

    @NotEmpty
    private String title;
    @NotEmpty
    private String desc;
    @NotEmpty
    private String estimation;
    private String expectation;
    private List<Long> categories;
    @NotEmpty
    private String address;
    @NotEmpty
    private String zipcode;
    private String keywords;
    private String image;

    public OfferDTO toOffer(){
        OfferDTO offerDTO = new OfferDTO();
        offerDTO.setTitle(title);
        offerDTO.setDescription(desc);
        offerDTO.setEstimation(Double.parseDouble(estimation));
        offerDTO.setExpectation(expectation);
        offerDTO.setAddress(address);
        offerDTO.setZipCode(Integer.parseInt(zipcode));
        offerDTO.setCreationDate(new Date(GregorianCalendar.getInstance().getTimeInMillis()));
        offerDTO.setModifDate(null);
        offerDTO.setPopularity(0);
        offerDTO.setExpirationDate(null);

        String[] words = keywords.split(",");
        for (String word: words) {
            word = word.replaceAll("\\s","");
            //TODO
        }
        offerDTO.setImageUrl(image);
        return offerDTO;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getEstimation() {
        return estimation;
    }

    public void setEstimation(String estimation) {
        this.estimation = estimation;
    }

    public String getExpectation() {
        return expectation;
    }

    public void setExpectation(String expectation) {
        this.expectation = expectation;
    }

    public List<Long> getCategories() {
        if(categories == null)
            categories = new ArrayList<>();
        return categories;
    }

    public void setCategories(List<Long> categories) {
        this.categories = categories;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
