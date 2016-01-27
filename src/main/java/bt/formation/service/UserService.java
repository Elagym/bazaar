package bt.formation.service;


import bt.formation.entity.Authority;
import bt.formation.entity.User;

import java.util.Collection;

public interface UserService {
    User signUpUser(User user);

    Collection<User> getUsers();
}
