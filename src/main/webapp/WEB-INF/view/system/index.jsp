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
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/css/layui.css" rel="stylesheet">

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
                        <span><img alt="image" class="img-circle"
                                   src="${currentUser.avatar}" width="65px"/>
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs">
                                    <strong class="font-bold"> ${currentUser.realName}</strong>
                                </span>
                                <span class="text-muted text-xs block">
                                    超级管理员<b class="caret"></b>
                                </span>
                            </span>
                        </a>

                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a class="J_menuItem" href="${ctx}/user/formAvatar">修改头像</a>
                            </li>

                            <li>
                                <a class="J_menuItem" href="${ctx}/user/password">修改密码</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/user/info">个人资料</a>
                            </li>
                            <%--<li>--%>
                                <%--<a class="J_menuItem" href="contacts.html">联系我们</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a class="J_menuItem" href="mailbox.html">信箱</a>--%>
                            <%--</li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li>--%>
                                <%--<a href="login.html">安全退出</a>--%>
                            <%--</li>--%>
                        </ul>
                    </div>
                    <div class="logo-element">H+
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i> <span class="nav-label">主页</span> <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/index_v1" data-index="0">主页一</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/index_v2">主页二</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/druid">主页三</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="index_v4.html">主页示例四</a>
                        </li>
                        <!-- <li>
                             <a href="index_v5.html" target="_blank">主页示例五</a>
                         </li>-->
                    </ul>

                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i> <span class="nav-label">数据列表</span> <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="/user/findList2">用户管理[layui]</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="/role/toList">角色管理[layui]</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="/user/findList">用户管理[bootstrap]</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/menu/toList">菜单管理[bootstrap]</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/tools/formValidate">表单校验</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${ctx}/sysLog/toList">日志监控</a>
                        </li>
                    </ul>

                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i> <span class="nav-label">系统管理</span> <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${ctx}/druid">数据库监控</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">日志监控</a>
                        </li>
                    </ul>

                </li>
                <li>
                    <a class="J_menuItem" href="${ctx}/tools/template"><i class="fa fa-columns"></i>
                        <span class="nav-label">空白页</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i> <span class="nav-label">统计图表</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="graph_echarts.html">百度ECharts</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">其他</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="mailbox.html"><i class="fa fa-envelope"></i>
                        <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="mailbox.html">收件箱</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="mail_detail.html">查看邮件</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="mail_compose.html">写信</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit"></i>
                        <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="form_basic.html">基本表单</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="form_validate.html">表单验证</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="form_advanced.html">高级插件</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="form_wizard.html">表单向导</a>
                        </li>
                        <li>
                            <a href="#">文件上传 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="form_webuploader.html">百度WebUploader</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="form_file_upload.html">DropzoneJS</a>
                                </li>
                                <!-- <li>
                                     <a class="J_menuItem" href="form_avatar.html">头像裁剪上传</a>
                                 </li>-->
                            </ul>
                        </li>
                        <li>
                            <a href="#">编辑器 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="form_editors.html">富文本编辑器</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="form_markdown.html">MarkDown编辑器</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="form_avatar.html">头像剪裁上传</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="suggest.html">搜索自动补全</a>
                        </li>
                        <!-- <li>
                             <a class="J_menuItem" href="layerdate.html">日期选择器layerDate</a>
                         </li>-->
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-desktop"></i>
                        <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="contacts.html">联系人</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="profile.html">个人资料</a>
                        </li>

                        <li>
                            <a class="J_menuItem" href="file_manager.html">文件管理器</a>
                        </li>

                        <li>
                            <a href="#">时间轴 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="timeline.html">时间轴</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="timeline_v2.html">时间轴v2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="pin_board.html">标签墙</a>
                        </li>
                        <li>
                            <a href="#">单据 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="invoice.html">单据</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="invoice_print.html">单据打印</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="search_results.html">搜索结果</a>
                        </li>
                        <!--<li>-->
                        <!--<a class="J_menuItem" href="forum_main.html">论坛</a>-->
                        <!--</li>-->
                        <li>
                            <a href="#">即时通讯 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <!--<li>-->
                                <!--<a class="J_menuItem" href="chat_view.html">聊天窗口</a>-->
                                <!--</li>-->
                                <li>
                                    <a class="J_menuItem" href="webim.html">layIM</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">登录注册相关 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="login.html" target="_blank">登录页面</a>
                                </li>
                                <li>
                                    <a href="login_v2.html" target="_blank">登录页面v2</a>
                                </li>
                                <li>
                                    <a href="register.html" target="_blank">注册页面</a>
                                </li>
                                <li>
                                    <a href="lockscreen.html" target="_blank">登录超时</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="404.html">404页面</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="500.html">500页面</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="empty_page.html">空白页</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-flask"></i>
                        <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="typography.html">排版</a>
                        </li>
                        <li>
                            <a href="#">字体图标 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="fontawesome.html">Font Awesome</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="glyphicons.html">Glyphicon</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="">阿里巴巴矢量图标库</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">拖动排序 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="draggable_panels.html">拖动面板</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="agile_board.html">任务清单</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="buttons.html">按钮</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="tabs_panels.html">选项卡 &amp; 面板</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="notifications.html">通知 &amp; 提示</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="badges_labels.html">徽章，标签，进度条</a>
                        </li>
                        <!--<li>-->
                        <!--<a class="J_menuItem" href="grid_options.html">栅格</a>-->
                        <!--</li>-->
                        <li>
                            <a class="J_menuItem" href="plyr.html">视频、音频</a>
                        </li>
                        <li>
                            <a href="#">弹框插件 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="layer.html">Web弹层组件layer</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="modal_window.html">模态窗口</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="sweetalert.html">SweetAlert</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">树形视图 <span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a class="J_menuItem" href="jstree.html">jsTree</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="tree_view.html">Bootstrap Tree View</a>
                                </li>
                                <li>
                                    <a class="J_menuItem" href="nestable_list.html">nestable</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="J_menuItem" href="toastr_notifications.html">Toastr通知</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="spinners.html">加载动画</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table"></i>
                        <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="">layui表格(未添加)</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="table_bootstrap.html">Bootstrap Table
                                <span class="label label-danger pull-right">推荐</span></a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-picture-o"></i>
                        <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="basic_gallery.html">基本图库</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="carousel.html">图片切换</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem" href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span>
                    </a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cutlery"></i>
                        <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="/static/hplus/form_builder.html">表单构建器</a>
                        </li>
                    </ul>
                </li>

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
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search"
                                   id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                    <li class="hidden-xs">
                        <a href="${ctx}/logout" class="">
                            <i class="fa fa-sign-out"></i> 退出
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
                    <a href="javascript:void();" class="active J_menuTab" data-id="index_v1.html">首页</a>
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
            <a href="#" class="roll-nav roll-right J_tabExit"><i class="fa fa-refresh"></i> 刷新</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/index_v1"
                    frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2018
                <a href="" target="_blank">...</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3><i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox"
                                           id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span> <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定宽度 </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox"
                                           id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span> <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/layer/layer.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/hplus/js/hplus.min.js?v=4.1.0"></script>
<script src="${ctxStatic}/hplus/js/contabs.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/pace/pace.min.js"></script>
</body>

</html>



