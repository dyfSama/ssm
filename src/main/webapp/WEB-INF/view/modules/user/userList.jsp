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

<body >
<%--<div class="row wrapper border-bottom white-bg page-heading">--%>
<%--<div class="col-sm-4">--%>
<%--<h2>标题</h2>--%>
<%--<ol class="breadcrumb">--%>
<%--<li>--%>
<%--<a href="index.html">数据列表</a>--%>
<%--</li>--%>
<%--<li>--%>
<%--<strong>用户数据[bootstrap]</strong>--%>
<%--</li>--%>
<%--</ol>--%>
<%--</div>--%>
<%--<div class="col-sm-8">--%>
<%--<div class="title-action">--%>
<%--<a href="javascript:location.replace(location.href);" class="btn btn-primary">--%>
<%--<i class="fa fa-refresh"></i></a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2">
            <ul id="treeDemo" class="ztree"></ul>
            <div class="ibox float-e-margins">
                <div class="ibox-content">

                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="formSearch" class="form-horizontal">
                        <div class="form-group" style="margin-top:15px">
                            <label class="control-label col-sm-1" for="userName">用户名</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="userName">
                            </div>
                            <label class="control-label col-sm-1" for="status">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control m-b" name="status" id="status">
                                    <option value="">所有</option>
                                    <option value="0">启用</option>
                                    <option value="2">停用</option>
                                </select>
                            </div>
                            <div class="col-sm-4" style="text-align:left;">
                                <button type="button" style="margin-left:50px" id="btn_query"
                                        class="btn btn-primary">查询
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="btn-group hidden-xs" id="talbeToolbar" role="group">
                <button type="button" class="btn btn-outline btn-success" id="add">
                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 添加
                </button>
                <button type="button" class="btn btn-outline btn-primary ">
                    <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> 修改
                </button>
                <button type="button" class="btn btn-outline btn-danger">
                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i> 删除
                </button>
            </div>
            <table id="tableId" data-mobile-responsive="true"></table>
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
        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            }
        };

        var zNodes =[
            { id:11, pId:1, name:"父节点11"},
            { id:1, pId:0, name:"父节点1", open:true},
            { id:111, pId:11, name:"叶子节点111"},
            { id:112, pId:11, name:"叶子节点112"},
            { id:113, pId:11, name:"叶子节点113"},
            { id:114, pId:11, name:"叶子节点114"},
            { id:12, pId:1, name:"父节点12"},
            { id:13, pId:1, name:"父节点13", isParent:true},
            { id:121, pId:12, name:"叶子节点121"},
            { id:122, pId:12, name:"叶子节点122"},
            { id:123, pId:12, name:"叶子节点123"},
            { id:124, pId:12, name:"叶子节点124"},
            { id:2, pId:0, name:"父节点2"},
            { id:21, pId:2, name:"父节点21", open:true},
            { id:211, pId:21, name:"叶子节点211"},
            { id:212, pId:21, name:"叶子节点212"},
            { id:213, pId:21, name:"叶子节点213"},
            { id:214, pId:21, name:"叶子节点214"},
            { id:22, pId:2, name:"父节点22"},
            { id:221, pId:22, name:"叶子节点221"},
            { id:222, pId:22, name:"叶子节点222"},
            { id:223, pId:22, name:"叶子节点223"},
            { id:224, pId:22, name:"叶子节点224"},
            { id:23, pId:2, name:"父节点23"},
            { id:231, pId:23, name:"叶子节点231"},
            { id:232, pId:23, name:"叶子节点232"},
            { id:233, pId:23, name:"叶子节点233"},
            { id:234, pId:23, name:"叶子节点234"},
            { id:3, pId:0, name:"父节点3", isParent:true}
        ];
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);

        $("#tableId").bootstrapTable({
            // url: "/static/hplus/js/demo/bootstrap_table_test.json",
            url: "${ctx}/user/getList?pageNumber=1&pageSize=10",
            toolbar: "#talbeToolbar",
            // search: true,  //搜索框
            showRefresh: true, //右上角按钮
            showToggle: true, //右上角按钮
            showColumns: true, //右上角按钮
            iconSize: "outline", //右上角按钮风格
            pageNumber: 1,
            pageSize: 10,
            pagination: true, // 在表格底部显示分页组件，默认false
            sidePagination: 'server', //设置为服务器端分页
            // queryParamsType:'limit',
            pageList: '[10, 25, 50, 100]',  // 设置页面可以显示的数据条数
            queryParams: function (params) {
                // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                return {
                    //key是后台分页参数, value是bootstrap提供的参数
                    page: params.offset,  //当前记录起始索引
                    limit: params.limit,  //每页多少条
                    // pageSize: params.limit, // 每页要显示的数据条数
                    // offset: params.offset, // 每页显示数据的开始行号
                    // sort: params.sort, // 要排序的字段
                    // sortOrder: params.order, // 排序规则
                    userName: $("#userName").val(), // 额外添加的参数
                    status: $("#status").val()
                }
            },

            icons: {
                refresh: " glyphicon-repeat",
                toggle: "glyphicon-list-alt",
                columns: "glyphicon-list"
            },
            columns: [[
                {checkbox: true},
                {field: 'id', title: 'ID', visible: false},
                {field: 'userName', title: '用户名'},
                {field: 'realName', title: '真实姓名'},
                {field: "avatar", title: "头像", width: 60},
                {
                    field: 'gender', title: '性别', width: 60,
                    formatter: function (value, row, index) {
                        var text = "-"
                        if (value === "1") {
                            text = "男";
                        } else {
                            text = "女";
                        }
                        return text;
                    }
                },
                {field: 'mobile', title: '手机'},
                {field: 'email', title: '邮箱'},
                {field: 'birthday', title: '生日'},
                // {field: 'createDate', title: '创建时间'},
                // {field: 'updateDate', title: '更新时间'},
                {
                    title: '操作', width: 100, align: 'center', valign: 'middle',
                    formatter: function (value, row, index) {
                        return '<a class="btn btn-outline btn-danger btn-xs" onclick="del(\'' + row.id + '\')">删除</a> '
                            + ' <a class="btn btn-outline btn-success btn-xs" onclick="edit(\'' + row.id + '\')">编辑</a>';
                    }
                }
            ]],
            onLoadSuccess: function () {  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function () {  //加载失败时执行
                console.info("加载数据失败");
            }

            /*rowStyle: function (row, index) {
                var classesArr = ['success', 'info'];
                var strclass = "";
                if (index % 2 === 0) {//偶数行
                    strclass = classesArr[0];
                } else {//奇数行
                    strclass = classesArr[1];
                }
                return {classes: strclass};
            },//隔行变色*/
        });

        $('#add').click(function () {
            layer.open({
                type: 2,
                title: '添加用户',
                maxmin: true,
                area: ['40%', '90%'],
                content: '/user/form',
                end: function () {
                    // table.reload('tableId'); //数据刷新
                }
            });
        });

    });
</script>
</body>

</html>
