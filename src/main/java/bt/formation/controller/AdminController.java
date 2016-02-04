package bt.formation.controller;

import bt.formation.service.AuthorityService;
import bt.formation.service.CategoryService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;

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

    @RequestMapping("/members")
    public String admin(Model model) {
        model.addAttribute("users", userService.getUsers());
        return "admin/members";
    }

    @RequestMapping(value = "/createcategory", method = RequestMethod.GET)
    public String createCategory(Model model) {
        model.addAttribute("categories", categoryService.getCategories());
        return "admin/createcategory";
    }

    @RequestMapping(value = "/createcategory", method = RequestMethod.POST)
    public String createCategoryProcess(@RequestParam String newcategory) {
        categoryService.createOrGetIfExists(newcategory);
        servletContext.setAttribute("categories", categoryService.getCategories());
        return "redirect:/admin/createcategory";
    }
}
