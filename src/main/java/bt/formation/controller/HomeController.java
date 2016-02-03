package bt.formation.controller;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.entity.Authority;
import bt.formation.entity.Category;
import bt.formation.entity.User;
import bt.formation.form.CreateOfferForm;
import bt.formation.form.SignUpForm;
import bt.formation.model.PincodeVerify;
import bt.formation.service.AuthorityService;
import bt.formation.service.CategoryService;
import bt.formation.service.OfferService;
import bt.formation.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Set;


@Controller
@RequestMapping("")
public class HomeController {

    @Autowired
    UserService userService;

    @Autowired
    AuthorityService authorityService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ServletContext servletContext;

    @Autowired
    OfferService offerService;

    @PostConstruct
    public void init() {
        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setEmail("admin@admin.com");
        Authority authority = new Authority();
        authority.setAuthority("ROLE_ADMIN");
        authorityService.createOrGetAuthority(authority);
        admin.getAuthorities().add(authority);
        userService.signUpUser(admin.toDto());

        CategoryDTO cat1 = new CategoryDTO();
        cat1.setName("Electronique");
        categoryService.createOrGetIfExists(cat1.getName());

        CategoryDTO cat2 = new CategoryDTO();
        cat2.setName("Voiture");
        categoryService.createOrGetIfExists(cat2.getName());

        CategoryDTO cat3 = new CategoryDTO();
        cat3.setName("Ménager");
        categoryService.createOrGetIfExists(cat3.getName());

        CategoryDTO cat4 = new CategoryDTO();
        cat4.setName("Cuisine");
        categoryService.createOrGetIfExists(cat4.getName());

        servletContext.setAttribute("categories", categoryService.getCategories());

    }

    @RequestMapping("")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@RequestParam(required = false) String error, Model model) {
        if (error != null)
            model.addAttribute("errorMessage", "Wrong credentials");
        return "login";
    }

    @RequestMapping("/process")
    public String loginSuccess() {
        return "index";
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
            Authority authority = new Authority();
            authority.setAuthority("ROLE_USER");
            authorityService.createOrGetAuthority(authority);
            user.getAuthorities().add(authority);
            userService.signUpUser(user.toDto());
            return "redirect:/login";
        }
    }

    @RequestMapping("/profile")
    public String profile() {
        return "profile";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createOffer(Model model) {
        model.addAttribute("createOfferForm", new CreateOfferForm());
        model.addAttribute("categorySet", categoryService.findAll());
        return "create";
    }

//    @RequestMapping(value = "/create", method = RequestMethod.POST)
//    public String processCreateOffer(@RequestParam String[] categories, @RequestParam String title, @RequestParam String desc, @RequestParam String estimation, @RequestParam String expectation, @RequestParam String address, @RequestParam String zipcode, @RequestParam String keywords /* TODO image */ ) {
//
//        OfferDTO offerDTO = new OfferDTO();
//        offerDTO.setTitle(title);
//        offerDTO.setDescription(desc);
//        offerDTO.setEstimation(Double.parseDouble(estimation));
//        offerDTO.setExpectation(expectation);
//        offerDTO.setAddress(address);
//        offerDTO.setZipCode(Integer.parseInt(zipcode));
//        offerDTO.setCreationDate(new Date(GregorianCalendar.getInstance().getTimeInMillis()));
//        offerDTO.setModifDate(null);
//        offerDTO.setPopularity(0);
//        offerDTO.setExpirationDate(null);
//        //TODO categories
//        Set<Category> categorySet = new HashSet<>();
//        for (String category: categories) {
//
//        }
//        //TODO keywords
//        //TODO image
//        offerDTO.setImageUrl("");
//
//        return "redirect:/offer/";
//    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String processCreateOffer(@Valid CreateOfferForm createOfferForm, BindingResult bindingResult){

        if (!bindingResult.hasErrors()) {


            OfferDTO offer = createOfferForm.toOffer();

            for (Long id: createOfferForm.getCategories()){
                offer.getCategories().add(categoryService.findById(id));
            }
            Long id = offerService.createOffer(offer).getId();
            return "redirect:/offer/" + id;
        } else {
            for (ObjectError oe : bindingResult.getAllErrors()) {
                System.out.println(oe.toString());
            }
            return "create";
        }
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
