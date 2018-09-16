package com.dyf.user.controller;

import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import javafx.scene.control.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;


    @RequestMapping("/findList")
    public String list(Model model, User user) {

        PageHelper.startPage(5,20,true);

        List<User> userList = userService.findList(user);



        PageInfo<User> page = new PageInfo<>(userList,20);
        model.addAttribute("page", page);
        logger.info("page.getSize(): " + page.getSize());
        logger.info("page.getPages(): " + page.getPages());
        logger.info("page.getPageSize(): " + page.getPageSize());
        logger.info("page.getPageNum(): " + page.getPageNum());
        logger.info("page.getPrePage(): " + page.getPrePage());
        logger.info("page.getNextPage(): " + page.getNextPage());
        return "userList";
    }


    @RequestMapping("/delete")
    public String delete(Model model, User user){
       userService.delete(user.getId());
       model.addAttribute("删除成功");
       return "a";
    }


}
