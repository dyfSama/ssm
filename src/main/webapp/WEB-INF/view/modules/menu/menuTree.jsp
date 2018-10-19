<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 空白页</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <%-- 标签图标 --%>
    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">

    <%-- bootstrap, bootstrap-table--%>
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <%-- hplus--%>
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <%-- nprogress --%>
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
    <%--ztree --%>
    <link rel="stylesheet" href="${ctxStatic}/ztree/css/metroStyle/metroStyle.css" type="text/css">
</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">

            <div class="form-group">
                <label class="col-sm-2 control-label">上级菜单</label>
                <div class="row">
                    <div class="col-sm-6">
                        <input type="input" class="form-control"  id="parentName" readonly>
                        <input type="input"  name="parentId" id="parentId">
                    </div>
                    <div class="col-sm-2">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<%-- jquery --%>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<%-- 下面这俩顺序不能变 --%>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<%-- bootstrap-table  --%>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%-- layer --%>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<%-- nprogress --%>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<%-- ztree --%>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript">
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    $(function () {

        $('#parentName').focus(function () {
            var setting = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onMouseDown: onMouseDown,
                    onMouseUp: onMouseUp
                }
            };

            function onMouseDown(event, treeId, treeNode) {
                console.info(event);
                console.info(treeId);
               // console.info(treeNode.name,treeNode.id);
              /*  $('#parentName').val(treeNode.name);
                $('#parentId').val(treeNode.id);*/
            }

            function onMouseUp(event, treeId, treeNode) {
                // showLog("[ "+getTime()+" onMouseUp ]&nbsp;&nbsp;" + (treeNode?treeNode.name:"root"), "up" );
            }
            $.ajax({
                url: "${ctx}/menu/getMenuTree",
                type: "post",
                dataType: "json",
                beforeSend: function () {
                    layer.load();
                },
                success: function (data) {
                    layer.closeAll("loading");
                    console.info(data);
                    $.fn.zTree.init($("#treeDemo"), setting, data);
                }
            });
        });

    });
</script>
</body>

</html>

