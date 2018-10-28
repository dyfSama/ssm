package com.dyf.modules.dept.service;

import com.dyf.common.persistence.mapper.BaseMapper;
import com.dyf.common.service.BaseSerivce;
import com.dyf.modules.dept.entity.Dept;

import java.util.List;

public interface DeptService extends BaseSerivce<Dept> {

    List<Dept> getDeptTree(Dept entity);
}
