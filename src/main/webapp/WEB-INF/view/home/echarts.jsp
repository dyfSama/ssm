<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> 百度ECHarts</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<%--<div class="row  border-bottom white-bg dashboard-header">
    <div class="col-sm-12">
        <p>ECharts开源来自百度商业前端数据可视化团队，基于html5
            Canvas，是一个纯Javascript图表库，提供直观，生动，可交互，可个性化定制的数据可视化图表。创新的拖拽重计算、数据视图、值域漫游等特性大大增强了用户体验，赋予了用户对数据进行挖掘、整合的能力。
            <a href="http://echarts.baidu.com/doc/about.html" target="_blank">了解更多</a>
        </p>
        <p>ECharts官网：
            <a href="http://echarts.baidu.com/" target="_blank">http://echarts.baidu.com/</a>
        </p>

    </div>

</div>--%>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>饼状图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="graph_flot.html#">选项1</a>
                            </li>
                            <li>
                                <a href="graph_flot.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="echarts" id="echarts-pie-chart"></div>
                </div>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>柱状图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="graph_flot.html#">选项1</a>
                            </li>
                            <li>
                                <a href="graph_flot.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="echarts" id="echarts-bar-chart"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>仪表盘</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="graph_flot.html#">选项1</a>
                            </li>
                            <li>
                                <a href="graph_flot.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="echarts" id="echarts-gauge-chart"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>折线图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="graph_flot.html#">选项1</a>
                            </li>
                            <li>
                                <a href="graph_flot.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="echarts" id="echarts-line-chart"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>中国地图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="graph_flot.html#">选项1</a>
                            </li>
                            <li>
                                <a href="graph_flot.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div style="height:600px" id="echarts-map-chart"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- jquery --%>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<%-- 下面这俩顺序不能变 --%>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/echarts/echarts-all.js"></script>
<%--<script src="${ctxStatic}/hplus/js/demo/echarts-demo.min.js"></script>--%>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${ctx}/modules/chart/getData",
            type: "post",
            dataType: "json",
            success: function (data) {

                // var data = [{value: 335, name: "直接访问"}, {value: 310, name: "邮件营销"}, {value: 234, name: "联盟广告"}, {
                //     value: 135,
                //     name: "视频广告"
                // }, {value: 1548, name: "搜索引擎"}];

                var l = echarts.init(document.getElementById("echarts-pie-chart"));
                var u = {
                    title: {text: "三国势力分布", subtext: "纯属虚构", x: "center"},
                    tooltip: {trigger: "item", formatter: "{a} <br/>{b} : {c} ({d}%)"},
                    legend: {orient: "vertical", x: "left", data: ["吴国势力", "蜀国势力", "魏国势力", "晋国势力"]},
                    calculable: !0,
                    series: [{
                        name: "势力分布",
                        type: "pie",
                        radius: "55%",
                        center: ["50%", "60%"],
                        data: data
                    }]
                };
                l.setOption(u);
                $(window).resize(l.resize);
            }
        });

        //地图
        var s = echarts.init(document.getElementById("echarts-map-chart")), c = {
            title: {text: "iphone销量", subtext: "纯属虚构", x: "center"},
            tooltip: {trigger: "item"},
            legend: {orient: "vertical", x: "left", data: ["iphone3", "iphone4", "iphone5"]},
            dataRange: {min: 0, max: 2500, x: "left", y: "bottom", text: ["高", "低"], calculable: !0},
            toolbox: {
                show: !0,
                orient: "vertical",
                x: "right",
                y: "center",
                feature: {
                    mark: {show: !0},
                    dataView: {show: !0, readOnly: !1},
                    restore: {show: !0},
                    saveAsImage: {show: !0}
                }
            },
            roamController: {show: !0, x: "right", mapTypeControl: {china: !0}},
            series: [{
                name: "iphone3",
                type: "map",
                mapType: "china",
                roam: !1,
                itemStyle: {normal: {label: {show: !0}}, emphasis: {label: {show: !0}}},
                data: [{name: "北京", value: Math.round(1e3 * Math.random())}, {
                    name: "天津",
                    value: Math.round(1e3 * Math.random())
                }, {name: "上海", value: Math.round(1e3 * Math.random())}, {
                    name: "重庆",
                    value: Math.round(1e3 * Math.random())
                }, {name: "河北", value: Math.round(1e3 * Math.random())}, {
                    name: "河南",
                    value: Math.round(1e3 * Math.random())
                }, {name: "云南", value: Math.round(1e3 * Math.random())}, {
                    name: "辽宁",
                    value: Math.round(1e3 * Math.random())
                }, {name: "黑龙江", value: Math.round(1e3 * Math.random())}, {
                    name: "湖南",
                    value: Math.round(1e3 * Math.random())
                }, {name: "安徽", value: Math.round(1e3 * Math.random())}, {
                    name: "山东",
                    value: Math.round(1e3 * Math.random())
                }, {name: "新疆", value: Math.round(1e3 * Math.random())}, {
                    name: "江苏",
                    value: Math.round(1e3 * Math.random())
                }, {name: "浙江", value: Math.round(1e3 * Math.random())}, {
                    name: "江西",
                    value: Math.round(1e3 * Math.random())
                }, {name: "湖北", value: Math.round(1e3 * Math.random())}, {
                    name: "广西",
                    value: Math.round(1e3 * Math.random())
                }, {name: "甘肃", value: Math.round(1e3 * Math.random())}, {
                    name: "山西",
                    value: Math.round(1e3 * Math.random())
                }, {name: "内蒙古", value: Math.round(1e3 * Math.random())}, {
                    name: "陕西",
                    value: Math.round(1e3 * Math.random())
                }, {name: "吉林", value: Math.round(1e3 * Math.random())}, {
                    name: "福建",
                    value: Math.round(1e3 * Math.random())
                }, {name: "贵州", value: Math.round(1e3 * Math.random())}, {
                    name: "广东",
                    value: Math.round(1e3 * Math.random())
                }, {name: "青海", value: Math.round(1e3 * Math.random())}, {
                    name: "西藏",
                    value: Math.round(1e3 * Math.random())
                }, {name: "四川", value: Math.round(1e3 * Math.random())}, {
                    name: "宁夏",
                    value: Math.round(1e3 * Math.random())
                }, {name: "海南", value: Math.round(1e3 * Math.random())}, {
                    name: "台湾",
                    value: Math.round(1e3 * Math.random())
                }, {name: "香港", value: Math.round(1e3 * Math.random())}, {
                    name: "澳门",
                    value: Math.round(1e3 * Math.random())
                }]
            }, {
                name: "iphone4",
                type: "map",
                mapType: "china",
                itemStyle: {normal: {label: {show: !0}}, emphasis: {label: {show: !0}}},
                data: [{name: "北京", value: Math.round(1e3 * Math.random())}, {
                    name: "天津",
                    value: Math.round(1e3 * Math.random())
                }, {name: "上海", value: Math.round(1e3 * Math.random())}, {
                    name: "重庆",
                    value: Math.round(1e3 * Math.random())
                }, {name: "河北", value: Math.round(1e3 * Math.random())}, {
                    name: "安徽",
                    value: Math.round(1e3 * Math.random())
                }, {name: "新疆", value: Math.round(1e3 * Math.random())}, {
                    name: "浙江",
                    value: Math.round(1e3 * Math.random())
                }, {name: "江西", value: Math.round(1e3 * Math.random())}, {
                    name: "山西",
                    value: Math.round(1e3 * Math.random())
                }, {name: "内蒙古", value: Math.round(1e3 * Math.random())}, {
                    name: "吉林",
                    value: Math.round(1e3 * Math.random())
                }, {name: "福建", value: Math.round(1e3 * Math.random())}, {
                    name: "广东",
                    value: Math.round(1e3 * Math.random())
                }, {name: "西藏", value: Math.round(1e3 * Math.random())}, {
                    name: "四川",
                    value: Math.round(1e3 * Math.random())
                }, {name: "宁夏", value: Math.round(1e3 * Math.random())}, {
                    name: "香港",
                    value: Math.round(1e3 * Math.random())
                }, {name: "澳门", value: Math.round(1e3 * Math.random())}]
            }, {
                name: "iphone5",
                type: "map",
                mapType: "china",
                itemStyle: {normal: {label: {show: !0}}, emphasis: {label: {show: !0}}},
                data: [{name: "北京", value: Math.round(1e3 * Math.random())}, {
                    name: "天津",
                    value: Math.round(1e3 * Math.random())
                }, {name: "上海", value: Math.round(1e3 * Math.random())}, {
                    name: "广东",
                    value: Math.round(1e3 * Math.random())
                }, {name: "台湾", value: Math.round(1e3 * Math.random())}, {
                    name: "香港",
                    value: Math.round(1e3 * Math.random())
                }, {name: "澳门", value: Math.round(1e3 * Math.random())}]
            }]
        };
        s.setOption(c), $(window).resize(s.resize);


        var M = echarts.init(document.getElementById("echarts-gauge-chart")), x = {
            tooltip: {formatter: "{a} <br/>{c} {b}"},
            toolbox: {show: !0, feature: {mark: {show: !0}, restore: {show: !0}, saveAsImage: {show: !0}}},
            series: [{
                name: "cpu",
                type: "gauge",
                min: 0,
                max: 220,
                splitNumber: 11,
                axisLine: {lineStyle: {width: 10}},
                axisTick: {length: 15, lineStyle: {color: "auto"}},
                splitLine: {length: 20, lineStyle: {color: "auto"}},
                title: {textStyle: {fontWeight: "bolder", fontSize: 20, fontStyle: "italic"}},
                detail: {textStyle: {fontWeight: "bolder"}},
                data: [{value: 40, name: "km/h"}]
            }, {
                name: "内存",
                type: "gauge",
                center: ["25%", "55%"],
                radius: "50%",
                min: 0,
                max: 7,
                endAngle: 45,
                splitNumber: 7,
                axisLine: {lineStyle: {width: 8}},
                axisTick: {length: 12, lineStyle: {color: "auto"}},
                splitLine: {length: 20, lineStyle: {color: "auto"}},
                pointer: {width: 5},
                title: {offsetCenter: [0, "-30%"]},
                detail: {textStyle: {fontWeight: "bolder"}},
                data: [{value: 1.5, name: "x1000 r/min"}]
            }, {
                name: "油表",
                type: "gauge",
                center: ["75%", "50%"],
                radius: "50%",
                min: 0,
                max: 2,
                startAngle: 135,
                endAngle: 45,
                splitNumber: 2,
                axisLine: {lineStyle: {color: [[.2, "#ff4500"], [.8, "#48b"], [1, "#228b22"]], width: 8}},
                axisTick: {splitNumber: 5, length: 10, lineStyle: {color: "auto"}},
                axisLabel: {
                    formatter: function (e) {
                        switch (e + "") {
                            case"0":
                                return "E";
                            case"1":
                                return "Gas";
                            case"2":
                                return "F"
                        }
                    }
                },
                splitLine: {length: 15, lineStyle: {color: "auto"}},
                pointer: {width: 2},
                title: {show: !1},
                detail: {show: !1},
                data: [{value: .5, name: "gas"}]
            }, {
                name: "水表",
                type: "gauge",
                center: ["75%", "50%"],
                radius: "50%",
                min: 0,
                max: 2,
                startAngle: 315,
                endAngle: 225,
                splitNumber: 2,
                axisLine: {lineStyle: {color: [[.2, "#ff4500"], [.8, "#48b"], [1, "#228b22"]], width: 8}},
                axisTick: {show: !1},
                axisLabel: {
                    formatter: function (e) {
                        switch (e + "") {
                            case"0":
                                return "H";
                            case"1":
                                return "Water";
                            case"2":
                                return "C"
                        }
                    }
                },
                splitLine: {length: 15, lineStyle: {color: "auto"}},
                pointer: {width: 2},
                title: {show: !1},
                detail: {show: !1},
                data: [{value: .5, name: "gas"}]
            }]
        };
        M.setOption(x), $(window).resize(M.resize);

        var e = echarts.init(document.getElementById("echarts-line-chart")), a = {
            title: {text: "未来一周气温变化"},
            tooltip: {trigger: "axis"},
            legend: {data: ["最高气温", "最低气温"]},
            grid: {x: 40, x2: 40, y2: 24},
            calculable: !0,
            xAxis: [{type: "category", boundaryGap: !1, data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]}],
            yAxis: [{type: "value", axisLabel: {formatter: "{value} °C"}}],
            series: [{
                name: "最高气温",
                type: "line",
                data: [11, 11, 15, 13, 12, 13, 10],
                markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                markLine: {data: [{type: "average", name: "平均值"}]}
            }, {
                name: "最低气温",
                type: "line",
                data: [1, -2, 2, 5, 3, 2, 0],
                markPoint: {data: [{name: "周最低", value: -2, xAxis: 1, yAxis: -1.5}]},
                markLine: {data: [{type: "average", name: "平均值"}]}
            }]
        };
        e.setOption(a), $(window).resize(e.resize);
        var t = echarts.init(document.getElementById("echarts-bar-chart")), n = {
            title: {text: "某地区蒸发量和降水量"},
            tooltip: {trigger: "axis"},
            legend: {data: ["蒸发量", "降水量"]},
            grid: {x: 30, x2: 40, y2: 24},
            calculable: !0,
            xAxis: [{
                type: "category",
                data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
            }],
            yAxis: [{type: "value"}],
            series: [{
                name: "蒸发量",
                type: "bar",
                data: [2, 4.9, 7, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20, 6.4, 3.3],
                markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                markLine: {data: [{type: "average", name: "平均值"}]}
            }, {
                name: "降水量",
                type: "bar",
                data: [2.6, 5.9, 9, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6, 2.3],
                markPoint: {
                    data: [{name: "年最高", value: 182.2, xAxis: 7, yAxis: 183, symbolSize: 18}, {
                        name: "年最低",
                        value: 2.3,
                        xAxis: 11,
                        yAxis: 3
                    }]
                },
                markLine: {data: [{type: "average", name: "平均值"}]}
            }]
        };
        t.setOption(n), window.onresize = t.resize;
    });

</script>

</body>

</html>
