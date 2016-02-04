package bt.formation.form;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.service.CategoryService;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class CreateOfferForm {

    private String title;
    private String desc;
    private String estimation;
    private String expectation;
    private List<Long> categories;
    private String address;
    private String zipcode;
    private String keywords;
    private MultipartFile image;

    public OfferDTO toOffer(){
        OfferDTO offerDTO = new OfferDTO();
        offerDTO.setTitle(title);
        offerDTO.setDescription(desc);
        try {
            Double est = Double.parseDouble(estimation);
            offerDTO.setEstimation(est);
        } catch (Exception e) {
            e.printStackTrace();
            offerDTO.setEstimation(0d);
        }
        offerDTO.setExpectation(expectation);
        offerDTO.setAddress(address);
        try {
            Integer zip = Integer.parseInt(zipcode);
            offerDTO.setZipCode(zip);
        } catch (Exception e) {
            e.printStackTrace();
            offerDTO.setZipCode(0);
        }
        offerDTO.setCreationDate(new Date());
        offerDTO.setModifDate(null);
        offerDTO.setPopularity(0);
        offerDTO.setExpirationDate(null);

        /*
        String[] words = keywords.split(",");
        for (String word: words) {
            word = word.replaceAll("\\s","");
            //TODO
        }
        */

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

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
