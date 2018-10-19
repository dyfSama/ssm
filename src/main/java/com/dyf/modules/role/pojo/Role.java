package com.dyf.modules.role.pojo;

import com.dyf.common.persistence.DataEntity;
import lombok.Data;

import java.util.Date;

@Data
public class Role extends DataEntity<Role> {

    private static final long serialVersionUID = -4592009926228106756L;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     *  角色权限字符串
     */
    private String roleKey;

    /**
     * 角色排序
     */
    private Integer roleSort;


    public Role() {
        super();
    }


}