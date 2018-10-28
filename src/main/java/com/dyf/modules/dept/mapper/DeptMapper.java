package com.dyf.modules.dept.mapper;

import com.dyf.common.persistence.annotaion.MyBatisDao;
import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.modules.dept.entity.Dept;

import java.util.List;

public interface DeptMapper extends BaseMapper<Dept> {

    List<Dept> getDeptTree(Dept entity);
}