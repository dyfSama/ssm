package com.dyf.base;

import com.dyf.user.pojo.User;
import com.dyf.user.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml"})
@WebAppConfiguration
public class SpringTestBase  {

    @Autowired
    private WebApplicationContext context;
    private MockMvc mockMvc;
    @Autowired
    private UserService userService;
    //@Before
    public void setup(){
        //构造 MockMvc
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }

    @Test
    public void testUserController() throws Exception {
        MvcResult result =  mockMvc
                .perform(MockMvcRequestBuilders.get("/ssm/user/findList"))
                .andReturn();
        System.out.println(result);
    }


    @Test
    public void testUserService(){
        User user = new User("lili", 20);
        user.setId(2);

        userService.save(user);
       // userService.delete(3);
       /* List<User> userList =userService.findList(user);

        for (User user1 : userList) {
            System.out.println(user1);
        }*/


       /* for (int i = 0; i < 100; i++) {
            int num = (int)(10+Math.random()*(60-20+1));
            User u = new User(UUID.randomUUID().toString().replace("-",""), num);
            userService.save(u);

        }*/

    }

}
