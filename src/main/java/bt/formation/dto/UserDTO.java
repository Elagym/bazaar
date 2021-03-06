package bt.formation.dto;

import bt.formation.entity.Authority;
import bt.formation.entity.User;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.validation.constraints.Pattern;
import java.util.*;

public class UserDTO implements UserDetails{

    private Long id;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private Date creationDate;
    private Date birthdate;
    private String imageUrl;
    private String description;
    private String lastname;
    private String firstname;
    private List<CommentDTO> comments;
    private Set<AuthorityDTO> authorities;
    private List<PropositionDTO> propositions;
    private List<Long> likedOffers;
    private int newPropsCount;
    private boolean accountNonExpired;
    private boolean accountNonLocked;
    private boolean credentialsNonExpired;
    private boolean enabled;

    public User toEntity(){
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setCreationDate(creationDate);
        user.setBirthDate(birthdate);
        user.setImageUrl(imageUrl);
        user.setDescription(description);
        user.setLastName(lastname);
        user.setFirstName(firstname);
        for (CommentDTO comment : getComments())
                user.getComments().add(comment.toEntity());
        for (AuthorityDTO auth : getAuthorities())
            user.getAuthorities().add(auth.toEntity());
        for (PropositionDTO proposition : getPropositions())
            user.getPropositions().add(proposition.toEntity());
        user.setAccountNonExpired(accountNonExpired);
        user.setAccountNonLocked(accountNonLocked);
        user.setCredentialsNonExpired(credentialsNonExpired);
        user.setEnabled(enabled);
        return user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Set<AuthorityDTO> getAuthorities() {
        if(authorities == null)
            authorities = new HashSet<>();
        return authorities;
    }

    public void setAuthorities(Set<AuthorityDTO> authorities) {
        this.authorities = authorities;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public List<CommentDTO> getComments() {
        if(comments == null)
            comments = new ArrayList<>();
        return comments;
    }

    public void setComments(List<CommentDTO> comments) {
        this.comments = comments;
    }

    public List<PropositionDTO> getPropositions() {
        if(propositions == null)
            propositions = new ArrayList<>();
        return propositions;
    }

    public void setPropositions(List<PropositionDTO> propositions) {
        this.propositions = propositions;
    }

    public List<Long> getLikedOffers() {
        if(likedOffers == null)
            likedOffers = new ArrayList<>();
        return likedOffers;
    }

    public void setLikedOffers(List<Long> likedOffers) {
        this.likedOffers = likedOffers;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getNewPropsCount() {
        return newPropsCount;
    }

    public void setNewPropsCount(int newPropsCount) {
        this.newPropsCount = newPropsCount;
    }
}
