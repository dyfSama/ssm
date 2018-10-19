package com.dyf.base;

import com.dyf.common.utils.IdGen;
import com.dyf.modules.user.pojo.User;
import com.dyf.modules.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-context.xml"})
@WebAppConfiguration
@Slf4j
public class SpringTestBase {

    @Autowired
    private WebApplicationContext context;
    private MockMvc mockMvc;
    @Autowired
    private UserService userService;

    //@Before
    public void setup() {
        //构造 MockMvc
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }



    @Test
    public void testUserController() throws Exception {
            System.out.println(mockMvc);
        MvcResult result = mockMvc
                .perform(MockMvcRequestBuilders.get("/ssm/user/findList"))
                .andReturn();
        System.out.println(result);
    }


    @Test
    public void testUserService() {
//        User user  = new User("admin",0);
//        user.setPassword("admin");
//        userService.save(user);

        //  userService.save(user);
        // userService.delete(3);
      /*  List<User> userList = userService.findList(null);

        for (User user1 : userList) {
            user1.setPassword("admin");
            userService.save(user1);
        }*/


        for (int i = 0; i <3000; i++) {
            int num = (int)(10+Math.random()*(60-20+1));
            User u = new User();
            u.setPassword("admin");
            u.setEmail(IdGen.uuid()+"@qq.com");
            u.setGender((i%2==0) ?  "1" : "0");
            u.setUserName("userName"+IdGen.uuid());
//            u.setLoginName("loginName" + IdGen.uuid());
//            u.setMobile("1231323123");
//            u.setSalary(BigDecimal.valueOf(8888.88));
            userService.save(u);

        }

    }


    @Test
    public void test111(){
       String s =  "1231232.jpg";
        String suffix = s.substring(s.lastIndexOf("."));
        System.out.println("==========================="+suffix);
    }

}
