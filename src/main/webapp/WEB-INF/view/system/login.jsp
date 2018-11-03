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
    <link href="${ctxStatic}/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/login.min.css" rel="stylesheet">
    <%-- icheck --%>
    <link href="${ctxStatic}/hplus/js/plugins/iCheck/skins/all.css" rel="stylesheet">

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
                    <a href="#" id="toRegister">立即注册&raquo;</a>
                    <%--<a href="https://www.baidu.com">立即注册&raquo;</a>--%>
                </strong>
            </div>
        </div>
        <div class="col-sm-5">
            <form id="formId">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录ssm</p>
                <input type="text" class="form-control uname" name="username" id='username' placeholder="用户名"/>
                <input type="password" class="form-control pword m-b" name="password" placeholder="密码"/>
                <div class="row" style="margin-top: -12px">
                    <div class="col-xs-6">
                        <input type="text" class="form-control" name="verifyCode" placeholder="验证码"
                               style="width: 125px"/>
                    </div>
                    <div class="col-xs-6">
                        <img src="${pageContext.request.contextPath}/modules/userInfo/getVerifyCode"
                             id="refreshVerifyCode"
                             style="width: 90%;margin-top: 17.5px">
                    </div>
                </div>
                <div class="checkbox i-checks">
                    <input class="i-checks" type="checkbox" name="rememberMe" value="true" title="记住我"/>&nbsp;&nbsp;记住我&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#">忘记密码?</a>
                </div>

                <button class="btn btn-success btn-block" type="submit">登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2018 All Rights Reserved. dyfSama
        </div>
    </div>
</div>
<!--js逻辑-->
<%-- jqueryValidate --%>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<%-- icheck --%>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>
<%-- layer --%>
<script src="${ctxStatic}/hplus/js/plugins/layer-v3.1.1/layer.js"></script>
<%-- jqueryValidate --%>
<script src="${ctxStatic}/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/validate/messages_zh.min.js"></script>
<%--<script src="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/layui.js"></script>--%>
<script>
    $(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        var refreshVerifyCode = $('#refreshVerifyCode');

        refreshVerifyCode.on('click', function () {
            $(this).attr("src", "${pageContext.request.contextPath}/modules/userInfo/getVerifyCode?t=" + Math.random());
        });

        $('#toRegister').click(function () {
            layer.msg("正在跳转到注册页面...", {time: 500}, function () {
                    window.location.href = "${pageContext.request.contextPath}/modules/userInfo/toRegister";
                }
            );
        });
    });
    $("#formId").validate({
        rules: {
            username: {required: true},
            password: {required: true},
            verifyCode: {required: true}
        },
        messages: {
            username: {required: "请输入用户名"},
            password: {required: "请输入密码"},
            verifyCode: {required: "请输入验证码"}
        },
        errorPlacement: function (error, element) {
            layer.tips("必填项", element, {
                tipsMore: true, time: 1000
            });
        },
        submitHandler: function (form) {
            $.ajax({
                url: "${pageContext.request.contextPath}/shiroLogin",
                type: "post",
                dataType: "json",
                data: $('#formId').serialize(),
                beforeSend: function () {
                    layer.msg("正在验证中...", {time: 10000});
                },
                success: function (data) {
                    layer.closeAll();
                    if (data.status === "0") {
                        layer.msg("认证成功,正在跳转到首页...", {time: 500}, function () {
                                window.location.href = "${pageContext.request.contextPath}/index";
                            }
                        );
                    } else {
                        $('#refreshVerifyCode').val("");
                        $('#refreshVerifyCode').attr("src", "${pageContext.request.contextPath}/modules/userInfo/getVerifyCode?t=" + Math.random());
                        layer.msg("认证失败: " + data.message, {time: 3000, anim: 6});
                    }
                },
                error: function () {
                    layer.msg("系统错误: " + data.message, {time: 3000, anim: 6});
                }
            });
        }
    });
</script>
</body>

</html>
