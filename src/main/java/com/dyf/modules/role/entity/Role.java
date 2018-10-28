package com.dyf.modules.role.entity;

import com.dyf.common.persistence.DataEntity;
import com.dyf.modules.menu.entity.Menu;
import lombok.Data;

import java.util.List;

@Data
public class Role extends DataEntity<Role> {

    private static final long serialVersionUID = -4592009926228106756L;


    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色权限字符串
     */
    private String roleKey;

    /**
     * 角色排序
     */
    private Integer roleSort;


    /***************其他信息****************/

    /**
     * 菜单信息
     */
    private List<Menu> menuList;

    /**
     * 菜单组
     */
    private String[] menuIds;


    public Role() {
        super();
    }


}