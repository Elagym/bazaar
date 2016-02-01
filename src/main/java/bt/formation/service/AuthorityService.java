package bt.formation.service;

import bt.formation.dto.AuthorityDTO;
import bt.formation.entity.Authority;

public interface AuthorityService {
    AuthorityDTO createOrGetAuthority(Authority authority);
}
