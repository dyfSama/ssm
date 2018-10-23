<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>菜单表单</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <%-- nprogress --%>
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
</head>

<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <%--<div class="ibox-content">--%>
                <form method="get" class="form-horizontal" id="formId">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="userName" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">真实姓名</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="realName" placeholder="请输入真实姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号码</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="mobile" placeholder="请输入手机号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="email" placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">生日</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="birthday" id="birthday" placeholder="选择生日">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-8">
                            <div class="checkbox i-checks">
                                <input type="checkbox" value="1" name="roleId">管理员&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" value="0" name="roleId">角色1&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" value="0" name="roleId">角色2
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <div class="radio i-checks">
                                <input type="radio" value="1" name="gender" checked> <i></i> 男&nbsp;&nbsp;&nbsp;
                                <input type="radio" value="0" name="gender"> <i></i> 女
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">启用状态</label>
                        <div class="col-sm-8">
                            <div class="radio i-checks">
                                <input type="radio" value="0" name="status" checked> <i></i> 启用&nbsp;&nbsp;&nbsp;
                                <input type="radio" value="1" name="status"> <i></i> 停用
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button class="btn btn-primary" type="submit" id="save">保存内容</button>
                            <button class="btn btn-white" type="button">取消</button>
                        </div>
                    </div>
                </form>

                <%--</div>--%>
            </div>
        </div>
    </div>
</div>

<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>
<%-- layer --%>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<%-- nprogress --%>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<%-- laydate --%>
<script src="${ctxStatic}/hplus/js/plugins/laydate/laydate.js"></script>
<%-- jqueryValidate --%>
<script src="${ctxStatic}/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/validate/messages_zh.min.js"></script>
<%--<script src="${ctxStatic}/hplus/js/demo/form-validate-demo.min.js"></script>--%>

<script>
    layer.load(1, {shade: [0.5, '#393D49']});
    NProgress.start();

    window.onload = function () {
        NProgress.done();
        layer.closeAll('loading');
    };

    laydate.render({
        elem: '#birthday' //指定元素
    });

    // var index = parent.layer.getFrameIndex(window.name);
    // parent.layer.iframeAuto(index);

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
        $.ajax({
            url: "${ctx}/user/get?id=${entity.id}",
            type: "post",
            dataType: "json",
            // data: $("#formId").serialize(),
            // beforeSend: function () {
            //     layer.load();
            // },
            success: function (data) {
                <%--var data = '${entity}';--%>
                console.info(data);
                var el = $("#formId");

                function SetFromValues(el, data) {

                    for (var p in data) {
                        el.find(":input[name='" + p + "']").val(data[p]);
                    }
                }
            }
        });


        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green"});


        var e = "<i class='fa fa-times-circle'></i> ";
        $("#formId").validate({
            rules: {
                email: {required: true, email: true},
                userName: {required: true, minlength: 2, remote: "${ctx}/user/checkLoginName"},
                realName: {required: true, minlength: 2},
                mobile: {required: true, rangelength: [11, 11]},
                birthday: {required: true},
                roleId: {required: true}
            },
            messages: {
                email: e + "请输入您的E-mail",
                userName: {required: e + "请输入您的用户名", minlength: e + "用户名必须两个字符以上", remote: e + "用户已存在"},
                realName: {required: e + "请输入您的真实姓名", minlength: e + "真实姓名必须两个字符以上"},
                mobile: {required: e + "请输入您的手机号", rangelength: e + "手机号应该为11位"},
                birthday: {required: e + "请选择您的生日"},
                roleId: {required: e + "每个用户至少一个角色"}
            },
            submitHandler: function (form) {
                $.ajax({
                    url: "${ctx}/user/save",
                    type: "post",
                    dataType: "json",
                    data: $("#formId").serialize(),
                    beforeSend: function () {
                        layer.load();
                    },
                    success: function (data) {
                        layer.closeAll("loading");
                        if (data.status === "0") {
                            parent.$('#tableId').bootstrapTable('refresh');//刷新父页面
                            parent.layer.close(parent.layer.getFrameIndex(window.name));//关闭弹出层
                            parent.layer.msg(data.message, {icon: 6, time: 500});//父页面提示信息
                        } else {
                            parent.layer.msg(data.message, {icon: 2, time: 2000, anim: 6});
                        }
                    }
                });
            }
        });
    });
</script>

</body>

</html>
