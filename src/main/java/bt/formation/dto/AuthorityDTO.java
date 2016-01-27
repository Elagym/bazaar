package bt.formation.dto;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by Student on 27-01-16.
 */
public class AuthorityDTO implements GrantedAuthority {

    private Long id;
    private String authority;

    @Override
    public String getAuthority() {
        return authority;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}
