<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 空白页</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link href="${ctxStatic}/images/login/favicon.ico" rel="shortcut icon">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">


</head>
<!-- 灰色背景 -->
<body class="gray-bg">
<%-- 头 --%>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-4">
        <h2>标题</h2>
        <ol class="breadcrumb">
            <li>
                <a href="index.html">主页</a>
            </li>
            <li>
                <strong>包屑导航</strong>
            </li>
        </ol>
    </div>
    <div class="col-sm-8">
        <div class="title-action">
            <a href="empty_page.html" class="btn btn-primary">活动区域</a>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <%--<div class="ibox-title">--%>
                    <%--&lt;%&ndash;<h5>标题</h5>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="ibox-tools">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a class="collapse-link">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<i class="fa fa-chevron-up"></i>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a class="dropdown-toggle" data-toggle="dropdown" href="typography.html#">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<i class="fa fa-wrench"></i>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<ul class="dropdown-menu dropdown-user">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<a href="typography.html#">选项1</a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<a href="typography.html#">选项2</a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a class="close-link">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<i class="fa fa-times"></i>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</div>--%>
                <div class="ibox-content">
                    主题
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class=" ibox float-e-margins">
                <div class="ibox-title">
                    <h5>标题</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="typography.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="typography.html#">选项1</a>
                            </li>
                            <li>
                                <a href="typography.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    主题
                </div>
            </div>
        </div>
    </div>

</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<script type="text/javascript">
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
</script>
</body>

</html>
