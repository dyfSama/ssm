package com.dyf.modules.logger.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.dyf.modules.logger.entity.Logger;
import com.dyf.modules.logger.service.LoggerService;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @className: SysLogController
 * @description: syslog
 * @auther: duyafei
 * @date: 2018/10/22 18:36
 */
@Slf4j
@Controller
@RequestMapping("/modules/logger")
public class LoggerController extends BaseController {

    @Autowired
    private LoggerService loggerService;

    @RequestMapping("/toList")
    public String toList(Logger entity) {
        return "modules/logger/loggerList";
    }

    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("module:logger:list")
    public TableDataInfo list(HttpServletRequest request, Logger entity) {
        startPage(request);
        List<Logger> userList = loggerService.findList(entity);
        return getTableInfo(userList);
    }

    @RequestMapping("/toForm")
    public String form(Logger entity, Model model) {
        model.addAttribute("entityId", entity.getId());
        return "modules/logger/loggerDetail";
    }


    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("module:logger:delete")
    @Log(moduleName = "日志管理", businessType = BusinessType.DELETE)
    public MsgInfo delete(Logger entity) {
        return getMsgInfo(loggerService.deleteById(entity.getId(), true), MsgInfo.OPT_DEL);
    }

    /**
     * 批量删除
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/batchDelete")
    @RequiresPermissions("module:logger:delete")
    @Log(moduleName = "日志管理", businessType = BusinessType.DELETE_BATCH)
    public MsgInfo batchDelete(Logger entity) {
        return getMsgInfo(loggerService.deleteByIds(entity.getId()), MsgInfo.OPT_DEL);
    }

    /**
     * 获取单条记录
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/getById")
    public Logger getById(Logger entity) {
        return loggerService.getById(entity.getId());
    }
}
