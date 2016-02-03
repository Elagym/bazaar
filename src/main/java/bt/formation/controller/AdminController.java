package bt.formation.controller;

import bt.formation.service.AuthorityService;
import bt.formation.service.CategoryService;
import bt.formation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
