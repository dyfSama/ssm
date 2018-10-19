package com.dyf.modules.user.pojo;


import com.dyf.common.persistence.DataEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/* lombok @Data 为类生成 getter、setter、equals、canEqual、hashCode、toString*/
@Data
public class User extends DataEntity<User> {

    /**
     * 实体类实现序列化接口
     */
    private static final long serialVersionUID = 1L;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 用户姓名
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别
     */
    private String gender;

    /**
     * 头像url
     */
    private String avatar;

    /**
     * 生日
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthday;


    private String roleId;

    public User() {
        super();
    }

}
