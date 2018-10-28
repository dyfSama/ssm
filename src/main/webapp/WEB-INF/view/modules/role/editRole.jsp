<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>角色表单</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>

<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
    <div class="row">
        <div class="col-sm-12">
            <form method="get" class="form-horizontal" id="formId">
                <input type="hidden" name="id">
                <input type="hidden" name="menuIds" id="menuIds">
                <div class="form-group">
                    <label class="col-sm-2 control-label">角色名称</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="roleName" placeholder="请输入角色名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">角色权限标识</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="roleKey" placeholder="请输入角色权限标识">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">启用状态</label>
                    <div class="col-sm-8">
                        <div class="radio i-checks">
                            <input type="radio" value="0" name="status" checked> <i></i> 启用&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="2" name="status"> <i></i> 停用
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" name="remarks" rows="2"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">菜单权限</label>
                    <div class="col-sm-2">
                        <%-- 引入ztreehtml --%>
                        <jsp:include page="/WEB-INF/view/include/ztree.jsp"/>
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
        //ztree自定义参数
        var ztreeOption = {
            setting: {
                data: {
                    key: {
                        name: 'menuName',
                        title: 'permission'
                    },
                    simpleData: {
                        enable: true,
                        idKey: 'id',
                        pIdKey: 'parentId',
                        rootPId: 0
                    }
                },
                check: {
                    enable: true,
                    chkboxType: {"Y": "s", "N": "s"} //关联子操作
                },
                callback: {}
            },
            url: "${ctx}/modules/menu/getMenuTree?roleId=${entityId}"
        };

        $.ztree.init(ztreeOption);
        $('#ztreeKey').hide();
        $('#collapse_expand').hide();

        $.ajax({
            url: "${ctx}/modules/role/getById?id=${entityId}",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.info(data);
                //角色信息
                $("input[name='id']").val(data.id);
                $("input[name='roleName']").val(data.roleName);
                $("input[name='roleKey']").val(data.roleKey);
                $("input[name='remarks']").text(data.remarks);
                if (data.status === "2") {
                    $("input[name='status'][value='2']").iCheck('check');
                } else {
                    $("input[name='status'][value='0']").iCheck('check');
                }
            }
        });


        var e = "<i class='fa fa-times-circle'></i> ";
        $("#formId").validate({
            rules: {
                roleName: {required: true, minlength: 2},
                <%--roleName: {required: true, minlength: 2, remote: "${ctx}/role/checkRoleName"},--%>
                roleKey: {required: true}
            },
            messages: {
                roleName: {required: e + "请输入您的角色名称", minlength: e + "角色必须两个字符以上", remote: e + "角色已存在"},
                roleKey: {required: e + "请输入权限标识符"}
            },
            submitHandler: function (form) {

                //获取menuIds
                var nodes = $.fn.zTree.getZTreeObj("ztree-ul").getCheckedNodes(true);
                var menuIds = [];
                nodes.forEach(function (node) {
                    menuIds.push(node.id);
                });

                if (menuIds.length > 0) {
                    $('#menuIds').val(menuIds);
                }
                $.operator.save("${ctx}/modules/role/save");
            }
        });
    });
</script>

</body>

</html>
