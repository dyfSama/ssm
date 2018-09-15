package com.dyf.user.controller;

import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/findList")
    public String list(Model model, User user) {
        List<User> userList = userService.findList(user);
        model.addAttribute("list", userList);
        return "userList";
    }

}
