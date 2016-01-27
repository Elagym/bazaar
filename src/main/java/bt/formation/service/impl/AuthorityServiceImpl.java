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
    public AuthorityDTO createOrGetIfExists(String role_user) {
        Authority autho = authorityRepository.findByAuthority(role_user);

        if (autho == null) {
            autho = new Authority();
            autho.setAuthority(role_user);
            autho = authorityRepository.save(autho);
        }

        return autho.toDto();
    }
}
