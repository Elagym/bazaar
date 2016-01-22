package bt.formation.service.imp;

import bt.formation.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Created by Student on 14-01-16.
 */
public class UserServiceImp implements UserService, UserDetailsService{

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        //TODO
        return null;
    }
}
