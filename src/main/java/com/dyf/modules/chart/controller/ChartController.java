package com.dyf.modules.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *    todo
 * </p>
 *
 * @auther: duyafei
 * @date:   2018/10/31 15:17
 */
@Controller
@RequestMapping("/modules/chart")
public class ChartController {

    @RequestMapping("/toChart")
    public String toChart() {
        return "home/echarts";
    }



    @ResponseBody
    @RequestMapping("/getData")
    public List<Map<String, Object>> getDate() {

        List<Map<String, Object>> list = new ArrayList<>();

        Map<String,Object> m1 = new HashMap<>();
        Map<String,Object> m2 = new HashMap<>();
        Map<String,Object> m3 = new HashMap<>();
        Map<String,Object> m4 = new HashMap<>();

        m1.put("name","吴国势力");
        m1.put("value",50);

        m2.put("name","蜀国势力");
        m2.put("value",40);

        m3.put("name","魏国势力");
        m3.put("value",100);

        m4.put("name","晋国势力");
        m4.put("value",10);
        list.add(m1);
        list.add(m2);
        list.add(m3);
        list.add(m4);
        return list;
    }
}
