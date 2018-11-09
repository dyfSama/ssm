<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>机构表单</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <%@include file="/WEB-INF/view/include/head.jsp" %>

</head>

<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <form method="post" class="form-horizontal" id="formId">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="parentId" id="parentId">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">上级机构</label>
                        <div class="col-sm-8">
                            <input type="input" class="form-control" id="parentName" name="parentName"
                                   placeholder="点击选择上级机构" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">机构名称</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="deptName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否显示<br/>
                        </label>
                        <div class="col-sm-8">
                            <div class="radio i-checks">
                                <input type="radio" value="0" name="isShow"> <i></i> 是&nbsp;&nbsp;&nbsp;
                                <input type="radio" value="1" name="isShow"> <i></i> 否
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">机构排序</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="deptSort">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图标</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="icon">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">启用状态<br/>
                        </label>
                        <div class="col-sm-8">
                            <div class="radio i-checks">
                                <input type="radio" value="0" name="status"> <i></i> 启用&nbsp;&nbsp;&nbsp;
                                <input type="radio" value="2" name="status"> <i></i> 停用
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
                            <%--<button class="btn btn-white" type="button">取消</button>--%>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $.modal.pageBlockUI();

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
            url: "${ctx}/modules/dept/getById?id=${entityId}",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.info(data);
                //用户信息
                $("input[name='id']").val(data.id);
                $("input[name='parentId']").val(data.parentId);
                $("input[name='parentName']").val(data.parentName);
                $("input[name='deptName']").val(data.deptName);
                $("input[name='deptSort']").val(data.deptSort);
                $("input[name='icon']").val(data.icon);
                if (data.isShow === "1") {
                    $("input[name='isShow'][value='1']").iCheck('check');
                } else {
                    $("input[name='isShow'][value='0']").iCheck('check');
                }
                if (data.status === "2") {
                    $("input[name='status'][value='2']").iCheck('check');
                } else {
                    $("input[name='status'][value='0']").iCheck('check');
                }
            }
        });




        $('#parentName').focus(function () {
            $.modal.open('选择机构', '${ctx}/modules/dept/toDeptTree', '250px', '500px');
        });

        var e = "<i class='fa fa-times-circle'></i> ";
        $("#formId").validate({
            rules: {
                deptName: {required: true, minlength: 2},
                <%--userName: {required: true, minlength: 2, remote: "${ctx}/user/checkMenuName"},--%>
                url: {required: true},
                menuSort: {required: true}
            },
            messages: {
                deptName: {required: e + "请输入机构名字", minlength: e + "用户名必须两个字符以上"},
                url: {required: e + "请输入url"},
                menuSort: {required: e + "请输入机构排序"}
            },
            submitHandler: function (form) {
                $.operator.save("${ctx}/modules/dept/save");
            }
        });
    });
</script>

</body>

</html>
