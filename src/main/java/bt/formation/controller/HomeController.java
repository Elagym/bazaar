package bt.formation.controller;

import bt.formation.dto.AuthorityDTO;
import bt.formation.dto.UserDTO;
import bt.formation.service.AuthorityService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("")
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    AuthorityService authorityService;

    @RequestMapping("")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String processLogin() {
        return "login";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String processSignup(@RequestParam String inputUsername, @RequestParam String inputPassword, @RequestParam String inputEmail) {
        UserDTO newUser = new UserDTO();
        newUser.setUsername(inputUsername);
        newUser.setPassword(inputPassword);
        newUser.setEmail(inputEmail);

        AuthorityDTO authority = authorityService.createOrGetIfExists("ROLE_USER");
        newUser.getAuthorities().add(authority);

        newUser.setAccountNonLocked(true);
        newUser.setAccountNonExpired(true);
        newUser.setEnabled(true);
        newUser.setCredentialsNonExpired(true);
        userService.signUpUser(newUser.toEntity());
        return "redirect:/login";
    }

    @RequestMapping("/profile")
    public String profile() {
        return "profile";
    }

    @RequestMapping("/offers")
    public String offers() {
        return "offers";
    }
}
