package com.dyf.common.persistence;

import com.dyf.common.utils.IdGen;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @className: TreeEntity
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/17 19:19
 */
@Data
public abstract class TreeEntity<T>  extends  DataEntity<T> implements Serializable {

    private static final long serialVersionUID = -2909163295969479276L;

    /**
     * parentId
     */
    protected String parentId;

    /**
     * 是否显示
     */
    private String isShow;


    public TreeEntity() {
    }


}
