<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>ssm</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">
    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/css/layui.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/login.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/><![endif]-->
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location
        }
    </script>

</head>

<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>[ H+ ]</h1>
                </div>
                <div class="m-b"></div>
                <h4>欢迎使用 <strong>H+ 后台主题UI框架</strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
                </ul>
                <strong>还没有账号？
                    <a href="${ctx}/user/toRegister">立即注册&raquo;</a>
                    <%--<a href="https://www.baidu.com">立即注册&raquo;</a>--%>
                </strong>
            </div>
        </div>
        <div class="col-sm-5">
            <form class="layui-form" method="post" action="">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录ssm</p>
                <input type="text" class="form-control uname" name="loginName" id='loginName' placeholder="用户名"
                       lay-verify="required"/>
                <input type="password" class="form-control pword m-b" name="password" placeholder="密码"
                       lay-verify="required"/>
                <%--<input  type="checkbox" name="rememberme" />&nbsp;&nbsp;记住我--%>
                <a href="">忘记密码了？</a>
                <button class="btn btn-success btn-block" lay-submit type="submit" lay-filter="login">登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2015 All Rights Reserved. H+
        </div>
    </div>
</div>
<!--js逻辑-->
<script src="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['form', 'jquery'], function () {
        var form = layui.form;
        var $ = layui.jquery;

        form.on('submit(login)', function (data) {
            $.ajax({
                <%--url: "${ctx}/loginAuth",--%>
                url: "${ctx}/shiroLogin",
                type: "post",
                dataType: "json",
                data: $('.layui-form').serialize(),
                beforeSend: function () {
                    layer.msg("正在验证中...",{time: 10000});
                },
                success: function (data) {
                    layer.closeAll();
                    if (data.status === "0") {
                        layer.msg("验证成功,正在跳转到首页....", {time: 500, anim: 5}, function () {
                                var loginName = $('#loginName').val();
                                window.location.href = "${ctx}/index?loginName=" + loginName;
                            }
                        );
                    } else {
                        layer.msg(data.message, {anim: 6}, function () {
                                $('.layui-input').val("");
                            }
                        );

                       /* layer.msg( "用户或密码不正确！", {icon:5,anim: 6}, function () {
                                $('.layui-input').val("");
                            }
                        );*/
                    }

                }
            });
            return false;
        });
    });
</script>
</body>

</html>
