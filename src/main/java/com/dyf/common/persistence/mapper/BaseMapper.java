package com.dyf.common.persistence.mapper;

import com.dyf.common.persistence.DataEntity;

import java.util.List;

/**
 * <p>
 * todo
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/30 11:11
 */
public interface BaseMapper<T> {


    /**
     * id查询
     * @param id
     * @return
     */
    T selectOneById(String id);

    /**
     * 查询List
     * @param entity
     * @return
     */
    List<T> findList(T entity);

    /**
     * 插入一条记录
     * @param entity
     * @return
     */
    int insert(T entity);

    /**
     * 更新记录
     * @param entity
     * @return
     */
    int update(T entity);






    /**
     * 批量逻辑删除
     * @param idList
     * @return
     */
    int deleteLogicalByIdList(List<String> idList);

    /**
     * 批量物理删除
     * @param idList
     * @return
     */
    int deletePhysicalByIdList(List<String> idList);

    /**
     * id 逻辑删除
     * @param id
     * @return
     */
    int deleteLogicalById(String id);

    /**
     *  id 物理删除
     * @param id
     * @return
     */
    int deletePhysicalById(String id);

}
