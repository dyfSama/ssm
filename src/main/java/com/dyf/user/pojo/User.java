package com.dyf.user.pojo;


import com.dyf.common.persistence.DataEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

/* lombok @Data 为类生成 getter、setter、equals、canEqual、hashCode、toString*/
@Data
public class User extends DataEntity<User> {

    /**
     * 实体类实现序列化接口
     */
    private static final long serialVersionUID = 1L;

    private String userName;

    private String loginName;

    private String password;

    private String mobile;

    private String email;

    private String gender;

    private String avatar;

    private BigDecimal salary;


    public User() {
        super();
    }

}
