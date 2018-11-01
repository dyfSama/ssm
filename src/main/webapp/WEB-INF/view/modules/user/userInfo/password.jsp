<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>菜单表单</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-4">
            <form method="get" class="form-horizontal" id="formId">
                <input type="hidden" name="id">
                <div class="form-group">
                    <%--<label class="col-sm-2 control-label">当前密码</label>--%>
                    <div class="col-sm-4" style="width: 300px">
                        <input type="password" class="form-control" name="oldPassword" placeholder="请输入当前密码">
                    </div>
                </div>
                <div class="form-group">
                    <%--<label class="col-sm-2 control-label">新密码</label>--%>
                    <div class="col-sm-4" style="width: 300px">
                        <input type="password" class="form-control" name="password" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="form-group">
                    <%--<label class="col-sm-2 control-label">确认密码</label>--%>
                    <div class="col-sm-4" style="width: 300px">
                        <input type="password" class="form-control" name="rePassword" placeholder="请再次输入密码">
                    </div>
                </div>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2" style="float: right">
                        <button class="btn btn-primary" type="submit" id="save">保存</button>
                        <%--<button class="btn btn-white" type="button" id="cancel">取消</button>--%>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    $.validator.setDefaults({
        highlight: function (e) {
            $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
        }, success: function (e) {
            e.closest(".form-group").removeClass("has-error").addClass("has-success")
        }, errorElement: "span", errorPlacement: function (e, r) {
            e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent())
        }, errorClass: "help-block m-b-none", validClass: "help-block m-b-none"
    });


    $(function () {
        var e = "<i class='fa fa-times-circle'></i> ";
        $("#formId").validate({
            rules: {
                oldPassword: {required: true},
                password: {required: true, minlength: 5},
                rePassword: {required: true, equalTo: "#password"},
            },
            messages: {
                oldPassword: {required: e + "请输入当前密码"},
                password: {required: e + "请输入新密码", minlength: e + "密码必须5个字符以上"},
                rePassword: {required: e + "请确认新密码", equalTo: "两次输入的密码不一致"},
            },
            submitHandler: function (form) {
                $.operator.save("${ctx}/modules/user/save");
            }
        });
    });
</script>

</body>

</html>
