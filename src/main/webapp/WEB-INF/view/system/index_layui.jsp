<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet"
          href="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/layuiadmin/dist/layuiadmin/style/admin.css"
          media="all">
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
</head>
<body class="layui-layout-body">
<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="https://github.com/dyfSama" target="_blank" title="gitHub">
                        <i class="layui-icon layui-icon-"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <input type="text" placeholder="搜索..." autocomplete="off" class="layui-input layui-input-search"
                           layadmin-event="serach" lay-action="template/search.html?keywords=">
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
                        <i class="layui-icon layui-icon-notice"></i>

                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <img alt="image" id="img-circle"
                         src="${ctx}/modules/userInfo/getAvatarById?id=${fns:getCurrentUser().id}"
                         width="35px"/>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>${fns:getCurrentUser().realName}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="${ctx}/user/info">基本资料</a></dd>
                        <dd><a lay-href="${ctx}/user/password">修改密码</a></dd>
                        <hr>
                        <dd style="text-align: center;"><a href="javascript:;" id="logout">退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event=""><%--<i
                            class="layui-icon layui-icon-more-vertical"></i>--%></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu ">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="${ctx}/console">
                    <span>dyfSama</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                        </a>
                        <dl class="layui-nav-child ">
                            <dd data-name="console" class="layui-this">
                                <a lay-href="${ctx}/console">控制台</a>
                            </dd>
                            <dd>
                                <a lay-href="${ctx}/index_v1">主页一</a>
                            </dd>
                            <dd data-name="console">
                                <a lay-href="${ctx}/index_v2">主页二</a>
                            </dd>
                        </dl>
                    </li>
                    <c:forEach items="${menuList}" var="menu">
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="${menu.menuName}" lay-direction="2">
                                <i class="layui-icon ${menu.icon}"></i>
                                <cite>${menu.menuName}</cite>
                            </a>
                            <c:if test="${menu.children.size() > 0}">
                                <c:forEach items="${menu.children}" var="chideMenu">
                                    <dl class="layui-nav-child">
                                        <dd data-name="console">
                                            <a lay-href="${ctx}${chideMenu.url}">${chideMenu.menuName}</a>
                                        </dd>
                                    </dl>
                                </c:forEach>
                            </c:if>
                        </li>
                    </c:forEach>
                    <li data-name="set" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="设置" lay-direction="2">
                            <i class="layui-icon layui-icon-set"></i>
                            <cite>设置</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd class="layui-nav-itemed">
                                <a href="javascript:;">系统设置</a>
                                <dl class="layui-nav-child">
                                    <dd><a lay-href="set/system/website.html">网站设置</a></dd>
                                    <dd><a lay-href="set/system/email.html">邮件服务</a></dd>
                                </dl>
                            </dd>
                            <dd class="layui-nav-itemed">
                                <a href="javascript:;">我的设置</a>
                                <dl class="layui-nav-child">
                                    <dd><a lay-href="${ctx}/set/user/info.html">基本资料</a></dd>
                                    <dd><a lay-href="set/user/password.html">修改密码</a></dd>
                                </dl>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="${ctx}/console" lay-attr="${ctx}/console" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src='${ctx}/console' frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>
        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/layer-v3.1.1/layer.js"></script>
<script src="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/layui.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<script src="${ctxStatic}/custom/dyfSama.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>

<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    layui.config({
        base: '${ctxStatic}/layuiadmin/dist/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
    $(function () {
        //修改头像
        var $avatar = $('#img-circle');
        $avatar.click(function () {
            var id = '${fns:getCurrentUser().id}';
            var realName = '${fns:getCurrentUser().realName}';
            console.info(id);
            $.modal.edit("修改 [ " + realName + " ] 的头像", "${ctx}/modules/userInfo/toAvatar", "510px", "630px", id);
        });

        //退出操作
        $('#logout').click(function () {
            $.modal.confirm("确定注销吗?", function () {

                layer.msg("正在清除用户信息...", {time: 1000}, function () {
                        window.location.href = "${ctx}/logout";
                    }
                );
            });
        });
    })
</script>

</body>
</html>


