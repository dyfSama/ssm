<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>ssm</title>

    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/><![endif]-->
    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <%-- nprogress --%>
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span>
                            <img alt="image" class="img-circle"
                                 src="${ctx}/modules/userInfo/getAvatarById?id=${fns:getCurrentUser().id}"
                                 width="70px"/>
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" data-hover="dropdown" href="#">
                            <span class="clear">
                                <span class="block m-t-xs">
                                    <strong class="font-bold"> ${fns:getCurrentUser().realName}</strong>
                                </span>
                                <span class="text-muted text-xs block">
                                    ${fns:getCurrentUser().dept.deptName}<b class="caret"></b>
                                </span>
                            </span>
                        </a>
                    </div>
                    <div class="logo-element">ssm
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i> <span class="nav-label">主页</span> <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="index_v1.html" data-index="0"><i class="fa fa-star"></i>首页</a>
                        </li>
                    </ul>
                </li>
                <c:forEach items="${menuList}" var="menu">
                    <li>
                        <a href="#">
                            <i class="${menu.icon}"></i> <span class="nav-label">${menu.menuName}</span> <span
                                class="fa arrow"></span>
                        </a>

                        <c:if test="${menu.children.size() > 0}">
                            <c:forEach items="${menu.children}" var="chideMenu">
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="J_menuItem" href="${ctx}${chideMenu.url}"> <i
                                                class="${chideMenu.icon}"></i>${chideMenu.menuName}
                                        </a>
                                    </li>
                                </ul>
                            </c:forEach>
                        </c:if>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <%--<li class="dropdown hidden-xs">--%>
                    <%--<a class="right-sidebar-toggle" aria-expanded="false">--%>
                    <%--<i class="fa fa-tasks"></i> 主题--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <li class="hidden-xs">
                        <span>
                            <img alt="image" class="img-circle"
                                 src="${ctx}/modules/userInfo/getAvatarById?id=${fns:getCurrentUser().id}"
                                 width="55px"/>
                        </span>
                    </li>
                    <li class="hidden-xs">
                        <a href="#" class="logout">
                            <i class="fa fa-sign-out"></i> 注销
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">页签操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive">
                        <a>定位当前页签</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll">
                        <a>关闭全部页签</a>
                    </li>
                    <li class="J_tabCloseOther">
                        <a>关闭其他页签</a>
                    </li>
                </ul>
            </div>
            <a href="#" class="roll-nav roll-right J_tabExit J_tabRefresh"><i class="fa fa-refresh"></i> 刷新</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index_v1.html?v=4.1.0"
                    frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2018
                <a href="https://github.com/dyfSama/ssm" target="_blank">dyfSama</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/layer-v3.1.1/layer.js" type="text/javascript"></script>
<script src="${ctxStatic}/hplus/js/hplus.min.js?v=4.1.0"></script>
<script src="${ctxStatic}/hplus/js/contabs.min.js"></script>
<%-- icheck --%>
<link href="${ctxStatic}/hplus/js/plugins/iCheck/skins/all.css" rel="stylesheet">
<%-- icheck --%>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctxStatic}/custom/dyfSama.js"></script>
<%-- nprogress --%>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<%-- 遮罩 --%>
<script src="${ctxStatic}/hplus/js/plugins/jquery-block-ui/jquery.blockUI.js"></script>
<%-- 遮罩样式 --%>
<div style="display: none" id="loading"><img src="${ctxStatic}/images/loading/loading2.gif" alt="loading" width="25px"/>&nbsp;&nbsp;&nbsp;&nbsp;<span
        id="loadingText">载入中,请稍后...</span></div>
</body>
<script type="text/javascript">
    $.modal.pageBlockUI();
    $(function () {
        //刷新
        //修改头像
        var $avatar = $('.img-circle');
        $avatar.mouseover(function () {
            layer.tips("点击更换头像", this, {
                tipsMore: true, time: 1000
            });
        });
        $avatar.click(function () {
            var id = '${fns:getCurrentUser().id}';
            var realName = '${fns:getCurrentUser().realName}';
            $.modal.edit("修改 [ " + realName + " ] 的头像", "${ctx}/modules/userInfo/toAvatar", "510px", "630px", id);
        });

        //退出操作
        $('.logout').click(function () {
            $.modal.confirm("确定注销吗?", function () {
                layer.msg("正在清除用户信息...", {icon: 6, time: 1000}, function () {
                        window.location.href = "${ctx}/logout";
                    }
                );
            });
        });
    })
</script>
</html>



