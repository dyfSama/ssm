<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>菜单列表</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">

    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-table/bootstrap-table.css">
    <link href="${ctxStatic}/hplus/js/plugins/jquery-treegrid/jquery.treegrid.css">
    <%-- nprogress --%>
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="row wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="userName">用户名</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="userName" placeholder="请输入用户名   ">
                        </div>
                        <label class="control-label col-sm-1" for="status">状态</label>
                        <div class="col-sm-2">
                            <select class="form-control m-b" name="status" id="status">
                                <option value=""></option>
                                <option value="0">启用</option>
                                <option value="2">停用</option>
                            </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" id="btn-query" class="btn btn-primary">
                                <i class="fa fa-search" aria-hidden="true"></i> 查询
                            </button>
                            <button type="reset" class="btn">
                                <i class="fa fa-reply" aria-hidden="true"></i> 重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="ibox-content">
                <div class="btn-group hidden-xs" id="talbeToolbar" role="group">
                    <button type="button" class="RoleOfadd btn btn-outline btn-success" id="add">
                        <i class="fa fa-plus-square-o" aria-hidden="true"></i> 添加
                    </button>
                    <button type="button" class="btn btn-outline btn-danger" id="batchDel">
                        <i class="fa fa-trash-o" aria-hidden="true"></i> 批量删除
                    </button>
                </div>
                <table id="tree-table" data-classes="table table-no-bordered"></table>
            </div>
        </div>
    </div>
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table-treegrid/bootstrap-table-treegrid.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/jquery-treegrid/jquery.treegrid.js"></script>

<%-- layer --%>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<%-- nprogress --%>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
<%--<script src="${ctxStatic}/custom/dyfSama.js"></script>--%>
</body>
<script type="text/javascript">
    var $table = $('#tree-table');
    $(function () {
        $.ajax({
            url: '${ctx}/menu/getList',
            type: "get",
            dataType: "json",
            success: function (resutlt) {
                //初始化 ztree
                $table.bootstrapTable({
                    data:resutlt,
                    // height: $(window).height(),
                    dataType: 'json',
                    toolbar: "#talbeToolbar",
                    // striped: true,
                    idField: 'id',
                    clickToSelect: false,
                    search: true,
                    showRefresh: true,
                    showToggle: true,
                    showColumns: true, //右上角列按钮
                    iconSize: "outline", //右上角按钮风格
                    icons: {refresh: " glyphicon-repeat", toggle: "glyphicon-list-alt", columns: "glyphicon-list"}, //右上角按钮图标
                    columns: [
                        {field: 'id', title: '编号', width: 80, sortable: true},
                        {field: 'parentId', title: '父级编号', width: 80, sortable: true},
                        {
                            field: 'menuName',
                            title: '名称'
                        }
                    ],
                    // bootstrap-table-tree-column.js 插件配置
                    // treeShowField: 'name',
                    // parentIdField: 'pid'
                    // bootstrap-table-tree-column.js 插件配置

                    // bootstrap-table-treegrid.js 插件配置
                    treeShowField: 'menuName',
                    parentIdField: 'parentId',
                    onLoadSuccess: function (data) {
                        console.info(data);
                        console.log('load');
                        // jquery.treegrid.js
                        $table.treegrid({
                            initialState: 'collapsed',
                            treeColumn: 1,
                            expanderExpandedClass: 'glyphicon glyphicon-chevron-down',
                            expanderCollapsedClass: 'glyphicon glyphicon-chevron-right',
                            onChange: function () {
                                $table.bootstrapTable('resetWidth');
                            }
                        });
                    }
                    // bootstrap-table-treetreegrid.js 插件配置
                });
            }
        });

    });

    function aaa(data) {

    }

    // 格式化类型
    function typeFormatter(value, row, index) {
        if (value === 'menu') {
            return '菜单';
        }
        if (value === 'button') {
            return '按钮';
        }
        if (value === 'api') {
            return '接口';
        }
        return '-';
    }

    // 格式化状态
    function statusFormatter(value, row, index) {
        if (value === 1) {
            return '<span class="label label-success">正常</span>';
        } else {
            return '<span class="label label-default">锁定</span>';
        }
    }
</script>
</html>
