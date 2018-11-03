package com.dyf.modules.dept.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.modules.dept.entity.Dept;
import com.dyf.modules.dept.service.DeptService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @className: DeptController
 * @description: 机构
 * @auther: duyafei
 * @date: 2018/10/26 15:14
 */
@Slf4j
@Controller
@RequestMapping("/modules/dept")
public class DeptController extends BaseController {

    @Autowired
    private DeptService deptService;


    @RequestMapping("/toList")
    public String toList(Dept menu) {
        return "modules/dept/deptList";
    }


    @RequestMapping("toForm")
    public String toForm(Dept entity, Model model) {
        if (StringUtils.isNotBlank(entity.getId())) {
            model.addAttribute("entityId", entity.getId());
            return "modules/dept/editDept";
        } else {
            return "modules/dept/addDept";
        }
    }

    @ResponseBody
    @RequestMapping("/list")
    public List<Dept> list(Dept entity) {
        List<Dept> deptList = deptService.findList(entity);
        for (Dept dept : deptList) {
            if ("100".equals(dept.getId())) {
                dept.setOpen("true");
            }
        }
        return deptList;
    }

    @RequestMapping("/toDeptTree")
    public String toDeptTree(Dept entity) {
        return "modules/dept/deptTree";
    }

    @ResponseBody
    @RequestMapping("/getDeptTree")
    public List<Dept> getMenuTree(Dept entity) {
        List<Dept> deptList = deptService.getDeptTree(entity);
        for (Dept dept : deptList) {
            if ("100".equals(dept.getId())) {
                dept.setOpen("true");
            }
        }
        return deptList;
    }

    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("module:dept:edit")
    @Log(moduleName = "机构管理", businessType = BusinessType.INSERT_UPDATE)
    public MsgInfo save(Dept entity) {
        return getMsgInfo(deptService.saveOrUpdate(entity), MsgInfo.OPT_SAVE);
    }

    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("module:menu:delete")
    @Log(moduleName = "机构管理", businessType = BusinessType.DELETE)
    public MsgInfo delete(Dept entity) {
        return getMsgInfo(deptService.deleteById(entity.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 获取单条记录
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/getById")
    public Dept getById(Dept entity) {
        Dept dept = deptService.getById(entity.getId());
        if(!"0".equals(dept.getParentId())){
            dept.setParentName(deptService.getById(dept.getParentId()).getDeptName());
        }
        return dept;
    }

}
