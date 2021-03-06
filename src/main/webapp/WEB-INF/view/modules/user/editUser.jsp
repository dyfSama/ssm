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
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
    <div class="row">
        <div class="col-sm-12">
            <form method="get" class="form-horizontal" id="formId">
                <input type="hidden" name="id">
                <input type="hidden" name="deptId" id="deptId">
                <div class="form-group">
                    <label class="col-sm-2 control-label">所属机构</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="deptName" name="deptName" placeholder="点击选择机构"
                               readonly>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="userName" placeholder="请输入用户名" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">真实姓名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="realName" placeholder="请输入真实姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">角色</label>
                    <div class="col-sm-8">
                        <select class="selectpicker" name="roleIds" multiple data-live-search="true"
                                data-placeholder="请选择角色" data-style="btn-white" style="width: 400px">
                            <%--<option value="" selected></option>--%>
                            <option value="0">超级管理员</option>
                            <option value="1">主公</option>
                            <option value="2">将军</option>
                            <option value="3">谋士</option>
                            <option value="4">佳人</option>
                            <option value="9999">游客</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-8">
                        <div class="radio i-checks">
                            <input type="radio" value="1" name="gender"> 男&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="0" name="gender"> 女
                        </div>
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
                    <label class="col-sm-2 control-label">启用状态</label>
                    <div class="col-sm-8">
                        <div class="radio i-checks ">
                            <input type="radio" value="0" name="status"> 启用&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="2" name="status"> 停用
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" name="remarks" rows="3"></textarea>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <button class="btn btn-primary" type="submit" id="save">保存内容</button>
                        <%--<button class="btn btn-white" type="button" id="cancel">取消</button>--%>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $.modal.NProgres();

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
        $('#deptName').focus(function () {
            $.modal.open('选择部门', '${ctx}/modules/dept/toDeptTree', '300px', '500px');
        });

        $.ajax({
            url: "${ctx}/modules/user/getById?id=${entityId}",
            type: "post",
            dataType: "json",
            success: function (data) {
                // console.info(data);
                //用户信息
                $("input[name='id']").val(data.id);
                $("input[name='userName']").val(data.userName);
                $("input[name='realName']").val(data.realName);
                $("input[name='email']").val(data.email);
                $("input[name='mobile']").val(data.mobile);
                // document.getElementsByName("remarks").innerHTML = '111';
                // // $("input[name='remarks']").innerh(data.remarks);
                if (data.gender === "1") {
                    $("input[name='gender'][value='1']").iCheck('check');
                } else {
                    $("input[name='gender'][value='0']").iCheck('check');
                }
                if (data.status === "2") {
                    $("input[name='status'][value='2']").iCheck('check');
                } else {
                    $("input[name='status'][value='0']").iCheck('check');
                }

                var roles = data.roles;
                //角色信息
                var roleid = [];
                roles.forEach(function (role) {
                    roleid.push(role.id);
                });
                $('.selectpicker').selectpicker('val', roleid).trigger("change");
                laydate.render({
                    elem: '#birthday', //指定元素
                    value: data.birthday
                });

                //部门信息
                $("input[name='deptId']").val(data.deptId);
                if (data.dept !== null && data.dept !== '' && data.dept !== undefined) {
                    $("input[name='deptName']").val(data.dept.deptName);
                }
            }
        });


        var e = "<i class='fa fa-times-circle'></i> ";
        $("#formId").validate({
            rules: {
                email: {required: true, email: true},
                realName: {required: true, minlength: 2},
                mobile: {required: true, rangelength: [11, 11]},
                birthday: {required: true},
                roleId: {required: true}
            },
            messages: {
                email: e + "请输入您的E-mail",
                realName: {required: e + "请输入您的真实姓名", minlength: e + "真实姓名必须两个字符以上"},
                mobile: {required: e + "请输入您的手机号", rangelength: e + "手机号应该为11位"},
                birthday: {required: e + "请选择您的生日"},
                roleId: {required: e + "每个用户至少一个角色"}
            },
            submitHandler: function (form) {
                $.operator.save("${ctx}/modules/user/save");
            }
        });
    });
</script>

</body>

</html>
