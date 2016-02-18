package bt.formation.controller;

import bt.formation.dto.*;
import bt.formation.entity.Authority;
import bt.formation.entity.User;
import bt.formation.form.ContactForm;
import bt.formation.form.CreateOfferForm;
import bt.formation.form.SignUpForm;
import bt.formation.form.UpdateUserForm;
import bt.formation.model.PincodeVerify;
import bt.formation.service.*;
import com.google.gson.Gson;
import org.hibernate.search.indexes.serialization.javaserialization.impl.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import java.nio.file.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;


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

    @Autowired
    PropositionService propositionService;

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
        admin.setImageUrl("01.jpg");
        UserDTO adminDTO = userService.signUpUser(admin.toDto());

        User user = new User();
        user.setUsername("user");
        user.setPassword("user");
        user.setEmail("user@user.com");
        user.setPhoneNumber("0474483902");
        Authority authority2 = new Authority();
        authority2.setAuthority("ROLE_USER");
        authorityService.createOrGetAuthority(authority2);
        user.getAuthorities().add(authority2);
        user.setImageUrl("05.jpg");
        UserDTO userDTO = userService.signUpUser(user.toDto());

        categoryService.createOrGetIfExists("Autres");
        categoryService.createOrGetIfExists("Voiture");
        categoryService.createOrGetIfExists("Animaux");
        categoryService.createOrGetIfExists("Cuisine");
        categoryService.createOrGetIfExists("Salon");
        categoryService.createOrGetIfExists("Bijoux");
        categoryService.createOrGetIfExists("Collections");
        categoryService.createOrGetIfExists("Jardin");
        categoryService.createOrGetIfExists("Loisirs");
        categoryService.createOrGetIfExists("Accessoires");

        servletContext.setAttribute("categories", categoryService.findAllByOrderByNameAsc());

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
        offer.setImageUrl("02.jpg");
        offer.getCategories().add(categoryService.findById(1L));
        offer.getCategories().add(categoryService.findById(2L));
        offer.getCategories().add(categoryService.findById(3L));
        offer.getCategories().add(categoryService.findById(4L));
        offer = offerService.createOffer(offer);

        OfferDTO offer2 = new OfferDTO();
        offer2.setTitle("Volvo S60 2.4 d 126ch*Cuir*Clim auto*Ja*Carnet d'entretien*");
        offer2.setDescription("***Volvo S60 2.4 turbo diesel 126ch année 07/2007 avec 94000km et un carnet d'entretien à jour.");
        offer2.setEstimation(7950);
        offer2.setExpectation("Voiture de sport");
        offer2.setCreationDate(new Date());
        offer2.setOwner(userService.findById(adminDTO.getId()));
        offer2.setExpirationDate(new Date());
        offer2.setAddress("Avenue Pastur 21");
        offer2.setZipCode(6001);
        offer2.setImageUrl("03.jpg");
        offer2.getCategories().add(categoryService.findById(2L));
        offerService.createOffer(offer2);

        OfferDTO offer3 = new OfferDTO();
        offer3.setTitle("Salon massive en chêne");
        offer3.setDescription("Salon massive en chêne (3 sièges, 2 sièges, 1 siège, 1 siège, 1 table) en bon état.");
        offer3.setEstimation(5000);
        offer3.setExpectation("Voiture");
        offer3.setCreationDate(new Date());
        offer3.setOwner(userService.findById(adminDTO.getId()));
        offer3.setExpirationDate(new Date());
        offer3.setAddress("Rue d'Aiur 26");
        offer3.setZipCode(2142);
        offer3.setImageUrl("04.jpg");
        offer3.getCategories().add(categoryService.findById(5L));
        offerService.createOffer(offer3);

        PropositionDTO propositionDTO = new PropositionDTO();
        propositionDTO.setOffer(offer);
        propositionDTO.setViewed(false);
        propositionDTO.setDescription("Here is my proposition BOBBY !");
        propositionDTO.setEstimation(19999);
        propositionDTO.setTitle("A brand new car");
        propositionDTO.setAuthor(adminDTO);
        propositionDTO = propositionService.createProposition(propositionDTO);

        PropositionDTO propositionDTO2 = new PropositionDTO();
        propositionDTO2.setOffer(offer);
        propositionDTO2.setViewed(false);
        propositionDTO2.setDescription("I have nothing to say about it...");
        propositionDTO2.setEstimation(1500);
        propositionDTO2.setTitle("Laptop");
        propositionDTO2.setAuthor(adminDTO);
        propositionDTO2 = propositionService.createProposition(propositionDTO2);

        PropositionDTO propositionDTO3 = new PropositionDTO();
        propositionDTO3.setOffer(offer);
        propositionDTO3.setViewed(false);
        propositionDTO3.setDescription("Do you accept my proposition ?");
        propositionDTO3.setEstimation(45);
        propositionDTO3.setTitle("DVD's");
        propositionDTO3.setAuthor(adminDTO);
        propositionDTO3 = propositionService.createProposition(propositionDTO3);


        userDTO.getPropositions().add(propositionDTO);
        userDTO.getPropositions().add(propositionDTO2);
        userDTO.getPropositions().add(propositionDTO3);
        userService.updateUser(userDTO);

    }

    @RequestMapping("")
    public String index(@AuthenticationPrincipal UserDTO user, Model model) {
        model.addAttribute("offers", offerService.findAllTop7());
        if (user != null)
            model.addAttribute("user", user);
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
            authority = authorityService.createOrGetAuthority(authority).toEntity();
            user.getAuthorities().add(authority);
            if (signUpForm.getImageURL() != null) {
                try {
                    user.setImageUrl(uploadFile(signUpForm.getImageURL()));
                } catch (IOException e) {
                    System.err.println(e.getMessage());
                }
            }
            userService.signUpUser(user.toDto());
            return "redirect:/login";
        }
    }

    @RequestMapping("/profile/{id}")
    public String profile(@PathVariable Long id, @AuthenticationPrincipal UserDTO currentUser, Model model) {
        UserDTO user = userService.findById(id);
        model.addAttribute("user", user);
        if (currentUser != null) {
            model.addAttribute("currentUser", currentUser);
        }
        List<OfferDTO> otherOffers = offerService.findByUserId(user.getId());
        model.addAttribute("otherOffers", otherOffers);

        int thumbsUp = 0;
        int thumbsDown = 0;
        for (CommentDTO comm : user.getComments()) {
            if (comm.isLiked()) thumbsUp++;
            else thumbsDown++;
        }

        model.addAttribute("thumbsUp", thumbsUp);
        model.addAttribute("thumbsDown", thumbsDown);

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

            if (convertToLatLong(createOfferForm.getAddress()) == null) {
                //TODO Rediriger vers une page d'érreur ou créer un pop up pour prévenir que l'addresse n'existe pas
                return "redirect:/user/create";
            }

            for (Long id : createOfferForm.getCategories()) {
                offer.getCategories().add(categoryService.findById(id));
            }

            if (createOfferForm.getImage() != null)
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

    public void removeFile(String file) {
        String url = "C:/tmp/bazaar/" + file;
        File f = new File(url);
        f.delete();
    }

    @RequestMapping("/showimage/{filename:.+}")
    public void showImage(HttpServletResponse response, @PathVariable String filename) throws IOException {
        File file = new File("C:/tmp/bazaar/" + filename);
        String mimeType = URLConnection.guessContentTypeFromName(filename);
        if (mimeType == null)
            mimeType = "application/octet-stream";
        response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
        response.setContentType(mimeType);
        response.setContentLength((int) file.length());

        InputStream is = new BufferedInputStream(new FileInputStream(file));
        FileCopyUtils.copy(is, response.getOutputStream());
    }

    @RequestMapping("/offers")
    public String offers(Model model) {
        model.addAttribute("offers", offerService.findAll());
        return "offers";
    }

    @RequestMapping("/offers/cat_id={id}")
    public String offersFromCat(@PathVariable Long id, Model model) {
        model.addAttribute("offers", offerService.findByCategoryId(id));
        model.addAttribute("category", categoryService.findById(id));
        return "offers";
    }

    @RequestMapping("/offer/{id}")
    public String offer(@PathVariable Long id, Model model, @AuthenticationPrincipal UserDTO currentUser) {

        OfferDTO offer = offerService.findById(id);
        if (offer != null) {

            try {
//            double[] locs = convertToLatLong("32 Avenue des tritons Bruxelles");
                double[] locs = convertToLatLong(offer.getAddress() + "," + offer.getZipCode());
                model.addAttribute("lat", locs[0]);
                model.addAttribute("long", locs[1]);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            offer = offerService.findById(1l);
        }
        model.addAttribute("offer", offer);
        model.addAttribute("owner", offer.getOwner());
        if (currentUser != null) {
            model.addAttribute("currentUserId", currentUser.getId());
            //Besoin de recharger le userDTO sur base de l'id du Principal pour recuperer la liste d'annonces favorites
            UserDTO user = userService.findById(currentUser.getId());
            model.addAttribute("alreadyLiked", user.getLikedOffers().contains(id));
        }

        int thumbsUp = 0;
        int thumbsDown = 0;
        for (CommentDTO comm : offer.getOwner().getComments()) {
            if (comm.isLiked()) thumbsUp++;
            else thumbsDown++;
        }

        model.addAttribute("thumbsUp", thumbsUp);
        model.addAttribute("thumbsDown", thumbsDown);

        List<OfferDTO> otherOffers = offerService.findByUserId(offer.getOwner().getId());
        model.addAttribute("otherOffers", otherOffers);
        ContactForm contactForm = new ContactForm();
        contactForm.setTargetId(offer.getOwner().getId().toString());
        model.addAttribute("contactForm", contactForm);

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
        } catch (IndexOutOfBoundsException ioobe) {
            System.out.println("Address not correct.");
            return null;
        }
    }

    @RequestMapping(value = "/user/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable Long id, @AuthenticationPrincipal UserDTO currentUser, Model model) {
        UserDTO user = userService.findById(id);
        model.addAttribute("user", user);
        UpdateUserForm updateUserForm = new UpdateUserForm();
        updateUserForm.setUsername(user.getUsername());
        updateUserForm.setPhoneNumber(user.getPhoneNumber());
        updateUserForm.setDateOfBirth(user.getBirthdate());
        updateUserForm.setDescription(user.getDescription());
        updateUserForm.setEmail(user.getEmail());
        updateUserForm.setFirstName(user.getFirstname());
        updateUserForm.setLastName(user.getLastname());
        model.addAttribute("updateUserForm", updateUserForm);
        return "user/update";
    }

    @RequestMapping(value = "/user/update/{id}", method = RequestMethod.POST)
    public String updateUserProcess(@PathVariable Long id, @Valid UpdateUserForm updateUserForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "redirect:/user/update/" + id;
        } else {
            UserDTO updated = updateUserForm.toUser();
            UserDTO toUpdate = userService.findById(id);
            if (updated.getPhoneNumber() != null && !updated.getPhoneNumber().equalsIgnoreCase(toUpdate.getPhoneNumber()))
                toUpdate.setPhoneNumber(updated.getPhoneNumber());
            if (updated.getBirthdate() != null && !updated.getBirthdate().equals(toUpdate.getBirthdate()))
                toUpdate.setBirthdate(updated.getBirthdate());
            if (updated.getDescription() != null && !updated.getDescription().equalsIgnoreCase(toUpdate.getDescription()))
                toUpdate.setDescription(updated.getDescription());
            if (updated.getEmail() != null && !updated.getEmail().equalsIgnoreCase(toUpdate.getEmail()))
                toUpdate.setEmail(updated.getEmail());
            if (updated.getFirstname() != null && !updated.getFirstname().equalsIgnoreCase(toUpdate.getFirstname()))
                toUpdate.setFirstname(updated.getFirstname());
            if (updated.getLastname() != null && !updated.getLastname().equalsIgnoreCase(toUpdate.getLastname()))
                toUpdate.setLastname(updated.getLastname());
            if (updateUserForm.getImageURL() != null && !updateUserForm.getImageURL().isEmpty()) {
                try {
                    removeFile(toUpdate.getImageUrl());
                    toUpdate.setImageUrl(uploadFile(updateUserForm.getImageURL()));
                } catch (IOException e) {
                    System.err.println(e.getMessage());
                }
            }
            userService.updateUser(toUpdate);
            return "redirect:/profile/" + id;
        }
    }

    @RequestMapping(value = "/offer/{id}", method = RequestMethod.POST)
    public String questionOrOffer(@PathVariable Long id, @Valid ContactForm contactForm, @AuthenticationPrincipal UserDTO user, BindingResult bindingResult) {
        if (contactForm.getType().equalsIgnoreCase("question")) {
            System.out.println("Question or offer ? -> Question");
        }
        if (contactForm.getType().equalsIgnoreCase("offer")) {
            PropositionDTO propositionDTO = contactForm.toPropositionDTO();
            propositionDTO.setAuthor(userService.findById(user.getId()));
            propositionDTO.setOffer(offerService.findById(id));
            if (contactForm.getImage() != null)
                try {
                    propositionDTO.setImage(uploadFile(contactForm.getImage()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            propositionDTO = propositionService.createProposition(propositionDTO);
            UserDTO userDTO = userService.findById(Long.parseLong(contactForm.getTargetId()));
            userDTO.getPropositions().add(propositionDTO);
            userService.updateUser(userDTO);
            System.out.println("Question or offer ? -> Offer");
        }
        System.out.println("End of questionOrOffer : " + contactForm.getType());
        return "redirect:/offer/" + id;
    }
}
