package com.dyf.modules.menu.entity;

import com.dyf.common.persistence.DataEntity;
import lombok.Data;

@Data
public class Menu extends DataEntity<Menu> {

    private static final long serialVersionUID = -4693424418535509253L;

    /**
     * parentId
     */
    private String parentId;

    /**
     * 是否显示
     */
    private String isShow;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单排序
     */
    private Integer menuSort;

    /**
     * 菜单类型(C:目录; B:按钮,;M:菜单)
     */
    private String menuType;

    /**
     * 请求地址
     */
    private String url;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 权限标识
     */
    private String permission;


    /****************其他信息**************************/

    private boolean checked;


    private String roleId;


    public Menu() {
        super();
    }
}