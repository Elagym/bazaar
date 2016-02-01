package bt.formation.controller;

import bt.formation.dto.AuthorityDTO;
import bt.formation.dto.UserDTO;
import bt.formation.entity.Authority;
import bt.formation.entity.User;
import bt.formation.form.SignUpForm;
import bt.formation.model.PincodeVerify;
import bt.formation.service.AuthorityService;
import bt.formation.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;


@Controller
@RequestMapping("")
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    AuthorityService authorityService;

    @PostConstruct
    public void init(){
        User admin = new User();
        admin.setEnabled(true);
        admin.setCredentialsNonExpired(true);
        admin.setAccountNonLocked(true);
        admin.setAccountNonExpired(true);
        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setEmail("admin@admin.com");
        userService.signUpUser(admin);
    }

    @RequestMapping("")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String processLogin(Model model) {
        model.addAttribute("errorMessage", "Wrong credentials");
        return "login";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(Model model) {
        model.addAttribute("signUpForm", new SignUpForm());
        return "signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String processSignUp(@Valid SignUpForm signUpForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/signup";
        } else {
            User user = signUpForm.toUser().toEntity();
            AuthorityDTO authority = authorityService.createOrGetIfExists("ROLE_USER");
            user.getAuthorities().add(authority.toEntity());
            userService.signUpUser(user);
            return "redirect:/login";
        }
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
    public String offer(@PathVariable Long id, Model model) {

        try {
            double[] locs = convertToLatLong("32 Avenue des tritons Bruxelles");
            model.addAttribute("lat", locs[0]);
            model.addAttribute("long", locs[1]);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "offer";
    }


    private static final String URLl = "http://maps.googleapis.com/maps/api/geocode/json";

    public double[] convertToLatLong(String fullAddress) throws IOException {

        String url_address = URLEncoder.encode(fullAddress, "UTF-8");

        try {
            URL url = new URL("http://maps.googleapis.com/maps/api/geocode/json?address=" + url_address + "&sensor=true");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
            }

            BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

            String output = "", full = "";
            while ((output = br.readLine()) != null) {
                System.out.println(output);
                full += output;
            }


            PincodeVerify gson = new Gson().fromJson(full, PincodeVerify.class);

            double lat = gson.getResults().get(0).getGeometry().getLocation().getLat();
            double lon = gson.getResults().get(0).getGeometry().getLocation().getLng();

            conn.disconnect();

            return new double[]{lat, lon};

        } catch (NullPointerException e) {
            System.out.println("Address, latitude on longitude is null");
            return null;
        }
    }
}
