package com.dyf.modules.dept.service.impl;

import com.dyf.common.service.impl.CrudService;
import com.dyf.modules.dept.mapper.DeptMapper;
import com.dyf.modules.dept.entity.Dept;
import com.dyf.modules.dept.service.DeptService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DelptServiceImpl extends CrudService<DeptMapper, Dept> implements DeptService {

    @Resource
    private DeptMapper deptMapper;


    @Override
    public List<Dept> getDeptTree(Dept entity) {
        return deptMapper.getDeptTree(entity);
    }

    /**
     * 保存更新菜单
     * @param entity
     * @return
     */
    @Override
    public boolean saveOrUpdate(Dept entity) {
        int rows = 0;
        //设置祖先列表: 该菜单的父ID+ 父菜单的祖先列表
        entity.setParentIds(super.getById(entity.getParentId()).getParentIds() + "," + entity.getParentId());
        if (StringUtils.isNotBlank(entity.getId())) {
            //有ID 更新
            entity.preUpdate();
            rows = deptMapper.update(entity);
        } else {
            //新增
            entity.preInsert();
            rows = deptMapper.insert(entity);
        }
        return rows > 0;
    }
}
