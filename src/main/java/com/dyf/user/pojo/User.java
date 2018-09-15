package com.dyf.user.pojo;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/* lombok @Data 为类生成 getter、setter、equals、canEqual、hashCode、toString*/
@Data
public class User {

    private Integer id;
    private String name;
    private Integer age;

    public User() {
    }

    public User(String name, Integer age) {
        this.name = name;
        this.age = age;
    }


}
