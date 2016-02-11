package bt.formation.controller;

import bt.formation.dto.OfferDTO;
import bt.formation.dto.UserDTO;
import bt.formation.entity.Category;
import bt.formation.entity.User;
import bt.formation.service.AuthorityService;
import bt.formation.service.CategoryService;
import bt.formation.service.OfferService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

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

    @RequestMapping("/members")
    public String admin(Model model) {
        model.addAttribute("users", userService.getUsers());
        return "admin/members";
    }

    @RequestMapping(value = "/managecategories", method = RequestMethod.GET)
    public String createCategory() {
        servletContext.setAttribute("categories", categoryService.findAllByOrderByNameAsc());
        return "admin/managecategories";
    }

    @RequestMapping(value = "/createcategory", method = RequestMethod.POST)
    public String createCategoryProcess(@RequestParam String newcategory) {
        categoryService.createOrGetIfExists(newcategory);
        servletContext.setAttribute("categories", categoryService.findAllByOrderByNameAsc());
        return "redirect:/admin/managecategories";
    }

    @RequestMapping(value = "/deletecategory", method = RequestMethod.POST)
    public String deleteCategory(@RequestParam String categorynumber) {
        Long id = Long.parseLong(categorynumber);
        List<OfferDTO> list = offerService.findByCategoryId(id);
        if (list != null && offerService.findByCategoryId(id).size() == 0) {
            categoryService.deleteCategory(id);
        } else {
            categoryService.replaceCategoryByOtherAndDelete(id);
        }
        servletContext.setAttribute("categories", categoryService.findAllByOrderByNameAsc());
        return "redirect:/admin/managecategories";
    }

    @RequestMapping(value = "/disable/{id}")
    public String disableUser(@PathVariable Long id) {
        UserDTO user = userService.findById(id);
        user.setEnabled(false);
        userService.updateUser(user);
        return "redirect:/admin/members";
    }

    @RequestMapping(value = "/enable/{id}")
    public String enableUser(@PathVariable Long id) {
        UserDTO user = userService.findById(id);
        user.setEnabled(true);
        userService.updateUser(user);
        return "redirect:/admin/members";
    }

    @RequestMapping(value = "/update/{id}")
    public String updateUser(@PathVariable Long id) {
        //TODO Une jsp pour que l'admin puisse modifier les infos d'un user pour une quelconque raison (fausse adresse mail ou tel)
        return "redirect:/admin/members";
    }
}
