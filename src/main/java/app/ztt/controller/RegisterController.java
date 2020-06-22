package app.ztt.controller;


import app.ztt.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    private Logger logger = LoggerFactory.getLogger(RegisterController.class);
    @Autowired
    UserService userService;
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/usrRegister", method = RequestMethod.POST)
    public String userRegister(@RequestParam("userName")        String userName,
                               @RequestParam("userPassword")    String password,
                               @RequestParam("confirmPassword") String confirmPassword,
                               @RequestParam("realName")        String realName,
                               @RequestParam("phone")           Integer phone,
                               @RequestParam("address")         String address,
                               @RequestParam("email")           String email ){
        if(userService.registerService(userName, password, confirmPassword, realName, phone, address, email) == 1) return "redirect:homePage";
        else return "register";
    }
}
