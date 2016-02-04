package bt.formation.controller;

import bt.formation.dto.CategoryDTO;
import bt.formation.dto.OfferDTO;
import bt.formation.dto.UserDTO;
import bt.formation.entity.Authority;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.net.*;
import java.util.Date;
import java.util.GregorianCalendar;


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
        admin.setPhoneNumber("0474483901");
        Authority authority = new Authority();
        authority.setAuthority("ROLE_ADMIN");
        authorityService.createOrGetAuthority(authority);
        admin.getAuthorities().add(authority);
        UserDTO adminDTO = userService.signUpUser(admin.toDto());

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

        OfferDTO offer = new OfferDTO();
        offer.setTitle("Mockup offer");
        offer.setDescription("description blablabla");
        offer.setEstimation(150);
        offer.setExpectation("A huge dildo");
        offer.setCreationDate(new Date());
        offer.setOwner(userService.findById(adminDTO.getId()));
        offer.setExpirationDate(new Date());
        offer.setAddress("Avenue des Tritons, 32");
        offer.setZipCode(1170);
        offer.setImageUrl("1454591755174chair.jpg");

        offerService.createOffer(offer);

    }

    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("offers", offerService.findAll());
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
    public String profile(@AuthenticationPrincipal UserDTO user, Model model) {
        model.addAttribute("user", user);
        return "profile";
    }

    @RequestMapping(value = "/user/create", method = RequestMethod.GET)
    public String createOffer(Model model) {
        model.addAttribute("createOfferForm", new CreateOfferForm());
        // model.addAttribute("categorySet", categoryService.findAll());
        return "user/create";
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

    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public String processCreateOffer(@Valid CreateOfferForm createOfferForm, BindingResult bindingResult, @AuthenticationPrincipal UserDTO user) throws IOException {

        if (!bindingResult.hasErrors()) {

            OfferDTO offer = createOfferForm.toOffer();

            System.out.println("OFFER EXPECTATION : " + offer.getExpectation());

            for (Long id: createOfferForm.getCategories()){
                offer.getCategories().add(categoryService.findById(id));
            }

            if(createOfferForm.getImage() != null)
                offer.setImageUrl(uploadFile(createOfferForm.getImage()));

            offer.setOwner(user);

            Long id = offerService.createOffer(offer).getId();
            return "redirect:/offer/" + id;
        } else {
            for (ObjectError oe : bindingResult.getAllErrors()) {
                System.out.println(oe.toString());
            }
            return "user/create";
        }
    }

    //returns file url
    public String uploadFile(MultipartFile file) throws IOException {
        String newFilenameWithoutExtension = GregorianCalendar.getInstance().getTimeInMillis() + file.getOriginalFilename();
        String url = "C:/tmp/bazaar/" + newFilenameWithoutExtension;
        FileCopyUtils.copy(file.getBytes(), new File(url));

        return newFilenameWithoutExtension;
    }

    @RequestMapping("/showimage/{filename:.+}")
    public void showImage(HttpServletResponse response, @PathVariable String filename) throws IOException {
        File file = new File("C:/tmp/bazaar/" + filename);
        String mimeType = URLConnection.guessContentTypeFromName(filename);
        if(mimeType == null)
            mimeType = "application/octet-stream";
        response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
        response.setContentType(mimeType);
        response.setContentLength((int)file.length());

        InputStream is = new BufferedInputStream(new FileInputStream(file));
        FileCopyUtils.copy(is, response.getOutputStream());
    }

    @RequestMapping("/offers")
    public String offers() {
        return "offers";
    }

    @RequestMapping("/offer/{id}")
    public String offer(@PathVariable Long id, Model model) {

        OfferDTO offer = offerService.findById(id);
        if(offer != null) {

            try {
//            double[] locs = convertToLatLong("32 Avenue des tritons Bruxelles");
                double[] locs = convertToLatLong(offer.getAddress() + "," + offer.getZipCode());
                model.addAttribute("lat", locs[0]);
                model.addAttribute("long", locs[1]);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            offer = offerService.findById(1l);
        }
        model.addAttribute("offer", offer);
        model.addAttribute("owner", offer.getOwner());

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
//                System.out.println(output);
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
