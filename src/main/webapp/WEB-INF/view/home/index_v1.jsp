<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>H+ 后台主题UI框架 - 主页示例</title>

    <link rel="shortcut icon" href="${ctxStatic}/hplus/images/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="row  border-bottom white-bg dashboard-header">
    <%--<div class="col-sm-12">--%>
    <%--<blockquote class="text-warning" style="font-size:14px">您是否需要自己做一款后台、会员中心等等的，但是又缺乏html等前端知识… <br>您是否一直在苦苦寻找一款适合自己的后台主题…--%>
    <%--<br>您是否想做一款自己的web应用程序… <br>…………--%>
    <%--<h4 class="text-danger">那么，现在H+来了</h4>--%>
    <%--</blockquote>--%>

    <%--<hr>--%>
    <%--</div>--%>
    <div class="col-sm-3">
        <h2>Hello,${fns:getCurrentUser().userName}</h2>
        <small>移动设备访问请扫描以下二维码：</small>
        <br> <br>
        <img src="${ctxStatic}/images/QRCode/mobile_access.png" width="100%" style="max-width:264px;">
        <br> <br>
        <p>
            纯粹是写着玩了, 只有些基本功能, 以后再慢慢迭代了。
        </p>
        <br>
        <p>
            <a class="btn btn-white btn-bitbucket" href="https://github.com/dyfSama/ssm" target="_blank">
                <i class="fa fa-github"></i> gitHub
            </a>
        </p>
    </div>
    <div class="col-sm-4">
        <h3>技术选型：</h3>
        <h4>后端</h4>
        <ol>
            <li>Spring Framework 4.3.13</li>
            <li>Apache Shiro 1.4.0</li>
            <li>MyBatis 3.4.6</li>
            <li>Alibaba Druid 1.1.10</li>
            <li>Ehcache 2.6.11、Redis</li>
            <li>SLF4J 1.7.25、logback 1.2.3</li>
            <li>other: lombok、pagehelper、commons-lang3、mp..</li>
            <li>...</li>
        </ol>
        <h4>前端</h4>
        <ol>
            <li>
                <a href="http://www.zi-han.net/theme/hplus/" target="_blank">
                    H+ 后台主题UI框架
                </a> 和
                <a href="https://www.layui.com/admin/std/dist/views/" target="_blank">
                    layuiAdmin 后台管理模板
                </a>
            </li>
            <li>jQuery 2.1.4</li>
            <li>layer 3.1.1</li>
            <li>bootstrap 3.3.7、bootstrap-table、bootstrap-treetable、bootstrap-select</li>
            <li>ztree 3.5.37</li>
            <li>JQuery Validate 1.13.0</li>
            <li>laydate 5.0.9</li>
            <li>iCheck 1.0.2</li>
            <li>font-awesome 4.7.0</li>
            <li>...</li>
        </ol>
        <h4>平台</h4>
        <ol>
            <li>mysql、idea、maven、git、jenkins..</li>
        </ol>
    </div>
    <div class="col-sm-5">
        <div class="ibox float-e-margins">
            <div class="">
                <h3>啦啦啦</h3>
            </div>
            <div class="ibox-content no-padding">
                <div class="panel-body">
                    <div class="panel-group" id="version">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#version" href="#v41">v1.1.0</a>
                                </h5>
                            </div>
                            <div id="v41" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <ol>
                                        <li>注册用户试试吧<(￣︶￣)↗[GO!]</li>
                                        <li>新用户的角色默认是: <b>游客</b> 只能查看</li>
                                        <li>图表数据还是静态数据</li>
                                        <li>工具中:用户管理layui,只是<b> layui(贤心大神) </b>的一个数据表格demo</li>
                                        <li>工具中:代码生成器还没开始, 准备使用<b> mybatis-plus </b>来搞</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row">
        <%--<div class="col-sm-4">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>二次开发</h5>
                </div>
                <div class="ibox-content">
                    <p>我们提供基于H+的二次开发服务，具体费用请联系作者。</p>
                    <p>同时，我们也提供以下服务：</p>
                    <ol>
                        <li>基于WordPress的网站建设和主题定制</li>
                        <li>PSD转WordPress主题</li>
                        <li>PSD转XHTML</li>
                        <li>Html页面（CSS+XHTML+jQuery）制作</li>
                    </ol>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>联系信息</h5>

                </div>
                <div class="ibox-content">
                    <p><i class="fa fa-send-o"></i> 博客：
                        <a href="http://www.zi-han.net" target="_blank">http://www.zi-han.net</a>
                    </p>
                    <p><i class="fa fa-weixin"></i> 微信：
                        <a href="javascript:;">zheng-zihan</a>
                    </p>
                    <p><i class="fa fa-credit-card"></i> 支付宝：
                        <a href="javascript:;" class="支付宝信息">zheng-zihan@qq.com / *子涵</a>
                    </p>
                </div>
            </div>
        </div>--%>
        <div class="col-sm-12">

        </div>
    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/layer-v3.1.1/layer.js" type="text/javascript"></script>

</body>

</html>
