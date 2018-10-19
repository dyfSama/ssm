package com.dyf.common.controller;

import com.dyf.common.contant.Contants;
import com.dyf.common.msg.MsgInfo;
import com.dyf.common.page.TableDataInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @className: BaseController
 * @description: TODO
 * @auther: duyafei
 * @date: 2018/10/12 15:15
 */
public abstract class BaseController {


    /**
     * 管理基础路径
     */
    @Value("/a")
    protected String adminPath;



    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    /**
     * 设置分页请求数据
     *
     * @param request
     */
    protected void startPage(HttpServletRequest request) {
        int pageNum = 0;
        int pageSize = 10;
        try {
            //layui
            pageNum = Integer.valueOf(request.getParameter(Contants.PAGE_NUM));
            pageSize = Integer.valueOf(request.getParameter(Contants.PAGE_SIZE));
        }catch (Exception e){
            //bootStrap-table
            pageNum = Integer.valueOf(request.getParameter(Contants.PAGE_NUM_2));
            pageSize = Integer.valueOf(request.getParameter(Contants.PAGE_SIZE_2));
        }

        PageHelper.startPage(pageNum, pageSize);
    }


    /**
     * 封装分页数据为TableDataInfo的格式(按照laytable和bootstrap-table来)
     *
     * @param dataList
     * @return
     */
    protected TableDataInfo getTableInfo(List<?> dataList) {
        TableDataInfo tableDataInfo = new TableDataInfo();
        tableDataInfo.setCode(0);
        tableDataInfo.setMsg("");
        //layui
        tableDataInfo.setData(dataList);
        tableDataInfo.setCount(new PageInfo<>(dataList).getTotal());
        //bootstrap-table
        tableDataInfo.setRows(dataList);
        tableDataInfo.setTotal(new PageInfo<>(dataList).getTotal());
        return tableDataInfo;
    }


    /**
     * @param rows - 记录数
     * @param optType save, update, delete , upload
     * @return
     */
    protected MsgInfo getMsgInfo(int rows, int optType) {
        boolean optFlag = rows > 0;
        switch (optType) {
            case 0:
                return optFlag ? MsgInfo.success(MsgInfo.SAVE_SUCCESS) : MsgInfo.error(MsgInfo.SAVE_FAIl);
            case 1:
                return optFlag ? MsgInfo.success(MsgInfo.UPDATE_SUCCESS) : MsgInfo.error(MsgInfo.UPDATE_FAIl);
            case 2:
                return optFlag ? MsgInfo.success(MsgInfo.DEL_SUCCESS) : MsgInfo.error(MsgInfo.DEL_FAIl);
            case 3:
                return optFlag ? MsgInfo.success(MsgInfo.UPLOAD_SUCCESS) : MsgInfo.error(MsgInfo.UPLOAD_FAIL);
            default:
                return optFlag ? MsgInfo.success() : MsgInfo.error();
        }
    }

    protected MsgInfo getMsgInfo(int rows) {
        return getMsgInfo(rows, -1);
    }

}
