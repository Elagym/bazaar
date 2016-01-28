package bt.formation.controller;

import bt.formation.controller.map.GoogleResponse;
import bt.formation.dto.AuthorityDTO;
import bt.formation.dto.UserDTO;
import bt.formation.service.AuthorityService;
import bt.formation.service.UserService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.xml.transform.Result;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


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

    @RequestMapping("/offer/{id}")
    public String offer(@PathVariable Long id, Model model){

        GoogleResponse gr;

        try {
            gr = convertToLatLong("Avenue des tritons 32 Bruxelles");

            for (Result res:gr.getResults()) {
                System.out.println(res.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "offer";
    }


    private static final String URLl = "http://maps.googleapis.com/maps/api/geocode/json";

    public GoogleResponse convertToLatLong(String fullAddress) throws IOException {

  /*
   * Create an java.net.URL object by passing the request URL in
   * constructor. Here you can see I am converting the fullAddress String
   * in UTF-8 format. You will get Exception if you don't convert your
   * address in UTF-8 format. Perhaps google loves UTF-8 format. :) In
   * parameter we also need to pass "sensor" parameter. sensor (required
   * parameter) — Indicates whether or not the geocoding request comes
   * from a device with a location sensor. This value must be either true
   * or false.
   */
        URL url = new URL(URLl + "?address="
                + URLEncoder.encode(fullAddress, "UTF-8") + "&sensor=false");
        // Open the Connection
        URLConnection conn = url.openConnection();

        InputStream in = conn.getInputStream() ;
        ObjectMapper mapper = new ObjectMapper();
        GoogleResponse response = (GoogleResponse)mapper.readValue(in,GoogleResponse.class);
        in.close();
        return response;


    }
}
