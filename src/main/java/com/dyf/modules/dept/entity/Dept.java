package com.dyf.modules.dept.entity;

import com.dyf.common.persistence.DataEntity;
import lombok.Data;

/**
 * @description: 机构表
 * @auther: duyafei
 * @date: 2018/10/26 15:13
 */
@Data
public class Dept extends DataEntity<Dept> {

    private static final long serialVersionUID = 3222819809227668167L;


    /**
     * 父id
     */
    private String parentId;

    /**
     * 祖先Id
     */
    private String parentIds;

    /**
     * 机构名称
     */
    private String deptName;

    /**
     * 是否显示
     */
    private String isShow;

    /**
     * 图标
     */
    private String icon;

    /**
     * 机构排序
     */
    private String deptSort;


    /**
     * 是否打开
     */
    private String open;

    /**
     * 父机构名称
     */
    private String parentName;
}