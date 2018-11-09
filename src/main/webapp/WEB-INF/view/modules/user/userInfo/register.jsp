<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ssm-注册</title>

    <%@include file="/WEB-INF/view/include/head_login_register.jsp" %>

    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>

</head>

<body class="gray-bg" background="${ctxStatic}/images/login/register_backgrouond.jpg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <h3>欢迎注册 ssm</h3>
        <p>创建一个ssm新账户</p>
        <form class="m-t" role="form" id="formId">
            <input type="hidden" name="roleIds" value="9999">
            <input type="hidden" name="deptId" value="100">
            <div class="form-group">
                <input type="text" name="userName" class="form-control" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <input type="password" name="rePassword" class="form-control" placeholder="请再次输入密码">
            </div>
            <div class="form-group">
                <input type="text" name="email" id="email" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="row" style="margin-bottom: 15px">
                <div class="col-xs-7">
                    <input type="text" name="verifyCode" class="form-control" placeholder="验证码">
                </div>
                <div class="col-xs-5">
                    <button class="btn btn-primary" type="button" id="getVCode">获取验证码</button>
                </div>
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding">
                        <input type="checkbox" id="agree" name="agree">
                        <i></i> 我同意注册协议
                    </label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center">
                <small>已经有账户了？</small>
                <a id="toLogin">点此登录</a>
            </p>
        </form>
    </div>
</div>
<script>
    $.modal.pageBlockUI();
    $(function () {
        $('#toLogin').click(function () {
            $.modal.blockUICallBack("正在跳转到登录页面...", function () {
                window.location.href = "${pageContext.request.contextPath}/";

            });
        });

        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "icheckbox_square-green"});

        var $vcode = $('#getVCode');

        //倒计时
        function setTime() {
            if (countdown === 0) {
                $vcode.removeAttr("disabled");
                $vcode.text("获取验证码");
                countdown = 60;
            } else {
                $vcode.attr("disabled", "true");
                $vcode.text("重新发送(" + countdown + ")");
                countdown--;
                setTimeout(function () {
                    setTime();
                }, 1000)
            }

        }

        //获取邮件验证码
        $vcode.click(function () {
            var email = $('#email').val();
            if (email === "" || email === undefined) {
                layer.tips('请先输入邮箱', this, {time: 1000});
                return;
            }
            $vcode.attr("disabled", "true");
            $.modal.ajaxBlockUI("正在发送中...");
            $.ajax({
                url: "${pageContext.request.contextPath}/system/mailSender/sendMailVerifyCode?to=" + email,
                type: "post",
                dataType: "json",
                beforeSend: function () {
                    $vcode.text("正在发送..");
                },
                success: function (data) {
                    if (data.status === '0') {
                        layer.tips('已发送至邮箱:' + email, $vcode, {time: 1500});
                        setTime();
                    } else {
                        layer.tips('发送失败,请检查邮箱:' + email, $vcode, {time: 4000});
                        $vcode.removeAttr("disabled");
                        $vcode.text("获取验证码");
                    }
                },
                error: function () {
                    $.modal.msg_fail('网络忙,请稍后重试!');
                    $vcode.removeAttr("disabled");
                    $vcode.text("获取验证码");
                }
            });

        });
    });

    //计时器
    var countdown = 60;

    //表单验证
    $.validator.setDefaults({
        highlight: function (e) {
            $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
        }, success: function (e) {
            e.closest(".form-group").removeClass("has-error").addClass("has-success")
        }, errorElement: "span", errorPlacement: function (e, r) {
            e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent())
        }, errorClass: "help-block m-b-none", validClass: "help-block m-b-none"
    });

    var e = "<i class='fa fa-times-circle'></i> ";
    $("#formId").validate({
        rules: {
            email: {
                required: true,
                email: true,
                remote: "${pageContext.request.contextPath}/modules/userInfo/checkEmail"
            },
            verifyCode: {required: true},
            userName: {required: true, remote: "${pageContext.request.contextPath}/modules/userInfo/checkUserName"},
            password: {required: true, minlength: 5},
            rePassword: {required: true, equalTo: "#password"},
            agree: "required"
        },
        messages: {
            email: {required: e + "请输入您的E-mail", email: e + "邮箱格式不正确", remote: e + "邮箱已存在"},
            verifyCode: {required: e + "请输入验证码"},
            userName: {required: e + "请输入用户名", remote: e + "用户名已存在"},
            password: {required: e + "请输入新密码", minlength: e + "密码必须5个字符以上"},
            rePassword: {required: e + "请确认新密码", equalTo: "两次输入的密码不一致"},
            agree: {required: e + "必须同意协议后才能注册", element: "#agree-error"}
        },
        submitHandler: function (form) {
            $.modal.ajaxBlockUI("正在注册中...");
            $.ajax({
                url: "${pageContext.request.contextPath}/modules/userInfo/register?",
                type: "post",
                dataType: "json",
                data: $("#formId").serialize(),
                success: function (data) {
                    console.info(data);
                    if (data.status === "0") {
                        layer.msg("注册成功,正在跳转到登录页面...", {time: 800}, function () {
                                window.location.href = "${pageContext.request.contextPath}/";
                            }
                        );
                    } else {
                        $.modal.msg_fail('验证码不正确!');
                    }
                },
                error: function () {
                    $.modal.msg_fail('网络忙,请稍后重试!');
                }
            });
        }
    });


</script>

</body>

</html>
