package com.dyf.common.persistence;

import com.dyf.common.contant.Contants;
import com.dyf.common.utils.IdGen;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @className: DataEntity
 * @description: 数据Entity类
 * @auther: duyafei
 * @date: 2018/10/8 16:56
 */
@Data
public class DataEntity<T> extends BaseEntity<T> {

    private static final long serialVersionUID = 1035856894958904165L;

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


    public DataEntity() {
        super();
        //默认正常
        this.status = Contants.STATUS_NORMAL;
    }

    public DataEntity(String id) {
        super(id);
    }

    /**
     * 插入之前执行方法，需要手动调用
     */
    @Override
    public void preInsert() {
        //设置主键ID
        setId(IdGen.uuid());
        this.updateDate = new Date();
        this.createDate = this.updateDate;
    }

    /**
     * 更新之前执行方法，需要手动调用
     */
    @Override
    public void preUpdate() {
        this.updateDate = new Date();
    }
}
