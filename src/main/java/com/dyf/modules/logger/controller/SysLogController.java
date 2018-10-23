package com.dyf.modules.logger.controller;

import com.dyf.common.controller.BaseController;
import com.dyf.common.page.TableDataInfo;
import com.dyf.modules.logger.pojo.SysLog;
import com.dyf.modules.logger.service.SysLogService;
import com.dyf.modules.user.pojo.User;
import com.dyf.system.aspect.annotation.Log;
import com.dyf.system.aspect.enums.BusinessType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @className: SysLogController
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/22 18:36
 */
@Slf4j
@Controller
@RequestMapping("sysLog")
public class SysLogController extends BaseController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping("toList")
    public String toList(SysLog entity) {
        return "modules/sysLog/sysLogList";
    }

    @ResponseBody
    @RequestMapping("getList")
    public TableDataInfo getList(HttpServletRequest request, SysLog entity) {
        startPage(request);
        log.info(entity.getModule());
        log.info(entity.getBusinessType()+"");
        List<SysLog> userList = sysLogService.findList(entity);
        return getTableInfo(userList);
    }
}
