package bt.formation.service.impl;

import bt.formation.dto.AuthorityDTO;
import bt.formation.entity.Authority;
import bt.formation.repository.AuthorityRepository;
import bt.formation.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    AuthorityRepository authorityRepository;

    @Override
    public AuthorityDTO createOrGetAuthority(Authority authority) {
        Authority auth = authorityRepository.findByAuthority(authority.getAuthority());
        if(auth != null)
            return auth.toDto();
        auth = authorityRepository.save(authority);
        return auth.toDto();
    }
}
