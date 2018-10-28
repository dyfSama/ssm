package com.dyf.common.service;

import com.dyf.common.contant.Contants;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 顶级service T 实体
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/30 12:39
 */
public interface BaseSerivce<T> {


    /**
     * 保存或者修改
     *
     * @param entity
     * @return
     */
    boolean saveOrUpdate(T entity);

    /**
     * 数据列表查询
     *
     * @param entity
     * @return
     */
    List<T> findList(T entity);

    /**
     * 获取单条记录
     *
     * @param id
     * @return
     */
    T getById(String id);

    /**
     * 逻辑删除(id)
     *
     * @param ids
     * @return
     */
    boolean deleteById(String id);

    /**
     * 物理删除
     *
     * @param id
     * @param isPhysical
     * @return
     */
    boolean deleteById(String id, boolean isPhysical);


    /**
     * 批量删除(idList,id 集合)
     *
     * @param idList
     * @return
     */
    boolean deleteByIdList(List<String> idList);

    /**
     * 批量逻辑/物理删除(idList,id 集合)
     *
     * @param idList
     * @return
     */
    boolean deleteByIdList(List<String> idList, boolean physical);

    /**
     * 批量删除(String[] id 数组)
     *
     * @param idArray
     * @return
     */
    boolean deleteByIdArray(String[] idArray);

    /**
     * 批量逻辑/物理删除(String[] id 数组)
     *
     * @param idArray
     * @return
     */
//    boolean deleteByIdArray(String[] idArray, boolean physical);


    /**
     * 批量逻辑/物理删除(ids,逗号拼接的字符串)
     *
     * @param ids
     * @return
     */
//    boolean deleteByIds(String ids, boolean physical);

    /**
     * 批量删除(ids,逗号拼接的字符串)
     *
     * @param ids
     * @return
     */
    boolean deleteByIds(String ids);


}
