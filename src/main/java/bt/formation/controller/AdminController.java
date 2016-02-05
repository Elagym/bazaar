package bt.formation.controller;

import bt.formation.dto.OfferDTO;
import bt.formation.entity.Category;
import bt.formation.service.AuthorityService;
import bt.formation.service.CategoryService;
import bt.formation.service.OfferService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String createCategory(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/managecategories";
    }

    @RequestMapping(value = "/createcategory", method = RequestMethod.POST)
    public String createCategoryProcess(@RequestParam String newcategory) {
        categoryService.createOrGetIfExists(newcategory);
        servletContext.setAttribute("categories", categoryService.getCategories());
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
        return "redirect:/admin/managecategories";
    }
}
