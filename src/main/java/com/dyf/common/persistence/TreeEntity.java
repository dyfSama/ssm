package com.dyf.common.persistence;

import com.dyf.common.utils.IdGen;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @className: TreeEntity
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/17 19:19
 */
@Data
public abstract class TreeEntity<T> {

    private static final long serialVersionUID = -2909163295969479276L;

    /**
     * id
     */
    protected Integer id;

    /**
     * parentId
     */
    protected Integer parentId;
    /**
     * 备注
     */
    protected String remarks;

    /**
     * 创建者
     */
    protected String createBy;

    /**
     * 创建日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    protected Date createDate;

    /**
     * 更新者
     */
    protected String updateBy;

    /**
     * 更新日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    protected Date updateDate;


    /**
     * 数据状态（0：启用；1：删除; 2: 停用）
     */
    protected String status;


    public TreeEntity() {
    }

    /**
     * 插入之前执行方法，子类实现
     */
    public void preInsert() {
        this.updateDate = new Date();
        this.createDate = this.updateDate;
    }

    /**
     * 更新之前执行方法，子类实现
     */
    public void preUpdate() {
        this.updateDate = new Date();

    }


}
