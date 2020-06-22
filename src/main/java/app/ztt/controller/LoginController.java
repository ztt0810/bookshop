package app.ztt.controller;

import app.ztt.entity.Book;
import app.ztt.entity.User;
import app.ztt.service.AdminService;
import app.ztt.service.BookService;
import app.ztt.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class LoginController {

    private final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String Login(){
        return "login";
    }

    @RequestMapping(value = "/usrLogin", method = RequestMethod.POST)
    public String getHomePage(@RequestParam("userName") String userName,
                              @RequestParam("userPassword") String userPassword,
                              @RequestParam("authority") String role,
                              Model map,
                              HttpSession session){
        if(role.equals("usr")){
            if(userService.checkUserService(userName, userPassword)){
                session.setAttribute("loginUser", userName);
                return "redirect:homePage";
            }else{
                return "login";
            }
        }else if(role.equals("admin")){
            if(adminService.checkAdminService(userName, userPassword)){
                return "adminPage";
            }else{
                return "login";
            }
        }
        return "login";
    }
}
