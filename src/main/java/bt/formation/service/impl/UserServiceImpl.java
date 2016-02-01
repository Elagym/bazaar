package bt.formation.service.impl;

import bt.formation.dto.UserDTO;
import bt.formation.entity.Authority;
import bt.formation.entity.User;
import bt.formation.repository.AuthorityRepository;
import bt.formation.repository.UserRepository;
import bt.formation.service.AuthorityService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

@Service
@Transactional
public class UserServiceImpl implements UserService, UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AuthorityRepository authorityRepository;

    @Autowired
    AuthorityService authorityService;

    @Override
    public UserDTO loadUserByUsername(String s) throws UsernameNotFoundException {
        return userRepository.findByUsername(s).toDto();
    }

    @Override
    public UserDTO signUpUser(UserDTO user) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String hash = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(hash);

        user.setCredentialsNonExpired(true);
        user.setAccountNonExpired(true);
        user.setAccountNonLocked(true);
        user.setEnabled(true);

        return userRepository.save(user.toEntity()).toDto();
    }

    @Override
    public Collection<User> getUsers() {
        return userRepository.findAll();
    }
}
