package bt.formation.form;


import bt.formation.dto.AuthorityDTO;
import bt.formation.dto.UserDTO;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.util.Date;

public class UpdateUserForm {

    private String username;

    @Email
    private String email;

    @NotNull(message = "Date of birth required")
    @Past(message = "Date of birth must be past")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;

    private String phoneNumber;

    private String firstName;

    private String lastName;

    private MultipartFile imageURL;

    private String description;

    public UserDTO toUser() {
        UserDTO u = new UserDTO();
        u.setUsername(username);
        u.setPhoneNumber(phoneNumber);
        u.setBirthdate(dateOfBirth);
        u.setCreationDate(new Date());
        u.setDescription(description);
        u.setEmail(email);
        u.setFirstname(firstName);
        u.setLastname(lastName);
//        u.setCredentialsNonExpired(true);
//        u.setAccountNonLocked(true);
//        u.setAccountNonExpired(true);
//        u.setEnabled(true);
        return u;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public MultipartFile getImageURL() {
        return imageURL;
    }

    public void setImageURL(MultipartFile imageURL) {
        this.imageURL = imageURL;
    }
}
