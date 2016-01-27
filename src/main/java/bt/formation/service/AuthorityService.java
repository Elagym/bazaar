package bt.formation.service;

import bt.formation.dto.AuthorityDTO;

public interface AuthorityService {
    AuthorityDTO createOrGetIfExists(String role_user);
}
