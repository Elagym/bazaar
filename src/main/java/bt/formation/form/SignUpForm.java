package bt.formation.form;


import bt.formation.dto.AuthorityDTO;
import bt.formation.dto.UserDTO;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.util.Date;

public class SignUpForm {

    @Size(min = 2, max = 30, message = "Username required.")
    @Pattern(regexp = "[a-zA-Z0-9._]{2,20}", message = "Username must contains alphabetical characters or numbers only.")
    private String username;

    @Size(min = 2, max = 30, message = "Password required.")
    @Pattern(regexp = "[a-zA-Z0-9._]{2,20}", message = "Password must contains alphabetical characters or numbers only.")
    private String password;

    @Size(min = 2, max = 30, message = "Passwords must match.")
    @Pattern(regexp = "[a-zA-Z0-9._]{2,20}", message = "Password must contains alphabetical characters or numbers only.")
    private String passwordCheck;

    @Email
    @Pattern(regexp = ".+@.+\\..+", message = "Wrong email!")
    private String email;

    @NotNull(message = "Date of birth required")
    @Past(message = "Date of birth must be past")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;

    @Pattern(regexp = "[0-9]+", message = "Only enter numbers !")
    private String phoneNumber;

    @Size(min = 4, max = 24, message = "Firstname must be between 4 & 24 characters")
    @Pattern(regexp = "[a-zA-Z0-9._]{2,20}", message = "First name must contains alphabetical characters or numbers only.")
    private String firstName;

    @Size(min = 4, max = 24, message = "Lastname must be between 4 & 24 characters")
    @Pattern(regexp = "[a-zA-Z0-9._]{2,20}", message = "Last name must contains alphabetical characters or numbers only.")
    private String lastName;

    private String imageURL;

    private String description;

    private boolean robot;


    @AssertTrue(message = "Passwords must match")
    public boolean isPasswordMatch() {
        if (password == null || passwordCheck == null) {
            return false;
        } else {
            return password.equals(passwordCheck);
        }
    }

    public UserDTO toUser() {
        UserDTO u = new UserDTO();
        u.setUsername(username);
        u.setPassword(password);
        u.setPhoneNumber(phoneNumber);
        u.setBirthdate(dateOfBirth);
        u.setCreationDate(new Date());
        u.setDescription(description);
        u.setEmail(email);
        u.setFirstname(firstName);
        u.setLastname(lastName);
        u.setImageUrl(imageURL);
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordCheck() {
        return passwordCheck;
    }

    public void setPasswordCheck(String passwordCheck) {
        this.passwordCheck = passwordCheck;
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


    public boolean isRobot() {
        return robot;
    }

    public void setRobot(boolean robot) {
        this.robot = robot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
