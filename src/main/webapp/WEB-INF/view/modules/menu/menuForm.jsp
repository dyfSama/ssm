<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>H+ 后台主题UI框架 - 基本表单</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <%--<link href="${ctxStatic}/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">--%>
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <%--ztree --%>
    <link rel="stylesheet" href="${ctxStatic}/ztree/css/metroStyle/metroStyle.css" type="text/css">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <%-- <div class="ibox-title">
                     &lt;%&ndash; <h5>所有表单元素
                          <small>包括自定义样式的复选和单选按钮</small>
                      </h5>&ndash;%&gt;
                     <div class="ibox-tools">
                         <a class="collapse-link">
                             <i class="fa fa-chevron-up"></i>
                         </a>
                         <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                             <i class="fa fa-wrench"></i>
                         </a>
                         <ul class="dropdown-menu dropdown-user">
                             <li>
                                 <a href="form_basic.html#">选项1</a>
                             </li>
                             <li>
                                 <a href="form_basic.html#">选项2</a>
                             </li>
                         </ul>
                         <a class="close-link">
                             <i class="fa fa-times"></i>
                         </a>
                     </div>
                 </div>--%>
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" id="formId">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">上级菜单</label>
                            <div class="col-sm-8">
                                <input type="input" class="form-control" id="parentName" readonly>
                                <input type="hidden" name="parentId" id="parentId">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">菜单名称</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="menuName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">请求地址</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="url">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">权限标识</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="permission">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">菜单排序</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="menuSort">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">图标</label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="icon">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">菜单类型</label>
                            <div class="col-sm-8">
                                <select class="form-control m-b" name="menuType">
                                    <option value="M" selected>菜单</option>
                                    <option value="C">目录</option>
                                    <option value="B">按钮</option>
                                </select>

                                <%--<div class="col-sm-4 m-l-n">
                                    <select class="form-control" multiple="">
                                        <option>选项 1</option>
                                        <option>选项 2</option>
                                        <option>选项 3</option>
                                        <option>选项 4</option>
                                    </select>
                                </div>--%>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否显示<br/>
                                <%--<small class="text-navy">自定义样式</small>--%>
                            </label>
                            <div class="col-sm-8">
                                <div class="radio i-checks">
                                    <input type="radio" value="0" name="isShow" checked> <i></i> 是&nbsp;&nbsp;&nbsp;
                                    <input type="radio" value="1" name="isShow"> <i></i> 否
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">启用状态<br/>
                                <%--<small class="text-navy">自定义样式</small>--%>
                            </label>
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
                                <button class="btn btn-primary" type="button" id="save">保存内容</button>
                                <button class="btn btn-white" type="button">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>
<link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
<%-- layer --%>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<%-- ztree --%>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.exedit.js"></script>
<script>
    layer.load(1, {shade: [0.5, '#393D49']});
    // NProgress.start();
    window.onload = function () {
        layer.closeAll('loading');
        // NProgress.done();
    };


    $(document).ready(function () {

        $('#parentName').focus(function () {
            var setting = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onMouseUp: onMouseUp
                }
            };

            //点击方法最好用Up
            function onMouseUp(event, treeId, treeNode) {
                if(treeNode !== undefined){
                    $('#parentName').val(treeNode.name);
                    $('#parentId').val(treeNode.id);
                    $.fn.zTree.destroy('treeDemo');
                }
            }

            $.ajax({
                url: "${ctx}/menu/getMenuTree",
                type: "post",
                dataType: "json",
                beforeSend: function () {
                    layer.load("1");
                },
                success: function (data) {
                    layer.closeAll("loading");
                    console.info(data);
                    $.fn.zTree.init($("#treeDemo"), setting, data);
                }
            });
        });


        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
        $('#save').click(function () {
            $.ajax({
                url: "${ctx}/menu/save",
                type: "post",
                dataType: "json",
                data: $('#formId').serialize(),
                beforeSend: function () {
                    layer.load();
                },
                success: function (data) {
                    if (data.status === "0") {
                        layer.msg(data.message, {icon: 6, time: 500}, function () {
                            parent.layer.close(parent.layer.getFrameIndex(window.name));
                        });
                    } else {
                        layer.msg(data.message, {icon: 2, time: 2000, anim: 6});
                    }
                }
            });
        });
    });
</script>

</body>

</html>
