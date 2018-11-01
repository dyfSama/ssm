package com.dyf.common.service.impl;

import com.dyf.common.contant.Contants;
import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.common.persistence.DataEntity;
import com.dyf.common.service.BaseSerivce;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * （ 泛型：M 是 mapper 对象，T 是实体 ）
 * </p>
 *
 * @auther: duyafei
 * @date: 2018/10/30 12:37
 */
public abstract class CrudService<M extends BaseMapper<T>, T extends DataEntity<T>> implements BaseSerivce<T> {

    /**
     * 是否是物理删除,默认逻辑删除
     */
    protected final static boolean isPhysical = true;

    @Autowired
    protected M baseMapper;

    /**
     * 保存或者修改
     *
     * @param entity
     * @return
     */
    @Override
    public boolean saveOrUpdate(T entity) {
        int rows = 0;
        if (StringUtils.isBlank(entity.getId())) {
            entity.preInsert();
            rows = baseMapper.insert(entity);
        } else {
            //id不为空
            entity.preUpdate();
            rows = baseMapper.update(entity);
        }
        return rows > 0;
    }


    /**
     * 数据列表查询
     *
     * @param entity
     * @return
     */
    @Override
    public List<T> findList(T entity) {
        return baseMapper.findList(entity);
    }


    /**
     * 获取单条记录
     *
     * @param id
     * @return
     */
    @Override
    public T getById(String id) {
        return baseMapper.selectOneById(id);
    }


    /**
     * 逻辑删除(id)
     *
     * @param ids
     * @return
     */
    @Override
    public boolean deleteById(String id) {
        return this.deleteById(id, !isPhysical);
    }

    /**
     * 选择逻辑/物理删除(by id)(默认逻辑删除)
     *
     * @param ids
     * @return
     */
    @Override
    public boolean deleteById(String id, boolean isPhysical) {
        return isPhysical ? baseMapper.deletePhysicalById(id) > 0 : baseMapper.deleteLogicalById(id) > 0;
    }


    /**
     * 批量逻辑删除(idList,id 集合)
     *
     * @param idList
     * @return
     */
    @Override
    public boolean deleteByIdList(List<String> idList) {
        return this.deleteByIdList(idList, false);
    }

    /**
     * 批量逻辑/逻辑删除(idList,id 集合)
     *
     * @param idList
     * @return
     */
    @Override
    public boolean deleteByIdList(List<String> idList, boolean isPhysical) {
        return isPhysical ? baseMapper.deletePhysicalByIdList(idList) > 0 : baseMapper.deleteLogicalByIdList(idList) > 0;
    }

    /**
     * 批量逻辑删除(String[] id 数组)
     *
     * @param idArray
     * @return
     */
    @Override
    public boolean deleteByIdArray(String[] idArray) {
        List<String> idList = Arrays.asList(idArray);
        return this.deleteByIdList(idList);
    }

    /**
     * 批量逻辑删除(ids,逗号拼接的字符串)
     *
     * @param ids
     * @return
     */
    @Override
    public boolean deleteByIds(String ids) {
        String[] idArray = ids.split(Contants.SPLIT_1);
        List<String> idList = Arrays.asList(idArray);
        return idArray.length > 0 && this.deleteByIdArray(idArray);
    }

}
