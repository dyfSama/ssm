package com.dyf.modules.menu.pojo;

import com.dyf.common.persistence.DataEntity;
import com.dyf.common.persistence.TreeEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Menu extends TreeEntity<Menu> {

    private static final long serialVersionUID = -4693424418535509253L;

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

    /**
     * 是否显示
     */
    private String isShow;


    public Menu() {
        super();
    }
}