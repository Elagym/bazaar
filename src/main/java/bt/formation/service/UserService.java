package bt.formation.service;


import bt.formation.dto.UserDTO;
import bt.formation.entity.Authority;
import bt.formation.entity.User;

import java.util.Collection;

public interface UserService {
    UserDTO signUpUser(UserDTO user);
    UserDTO updateUser(UserDTO user);
    Collection<User> getUsers();
    UserDTO findById(Long id);
    boolean handleLikedOffer(Long userId, Long offerId);
}
