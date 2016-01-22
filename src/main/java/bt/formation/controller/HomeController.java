package bt.formation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Student on 14-01-16.
 */
@Controller
@RequestMapping("")
public class HomeController {

    @RequestMapping("")
    public String index(){
        return "index";
    }
}
