<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 空白页</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/cdn/font-awesome.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
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
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <div class="panel panel-default">
                        <%--<div class="panel-heading">查询条件</div>--%>
                        <div class="panel-body">
                            <form id="formSearch" class="form-horizontal">
                                <div class="form-group" style="margin-top:15px">
                                    <label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="txt_search_departmentname">
                                    </div>
                                    <label class="control-label col-sm-1" for="txt_search_statu">状态</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="txt_search_statu">
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
                    <div class="example">
                        <%--<div class="alert alert-success" id="examplebtTableEventsResult" role="alert">
                            事件结果
                        </div>--%>
                        <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                            <button type="button" class="btn btn-outline btn-success">
                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 添加
                            </button>
                            <button type="button" class="btn btn-outline btn-primary ">
                                <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> 修改
                            </button>
                            <button type="button" class="btn btn-outline btn-danger">
                                <i class="glyphicon glyphicon-trash" aria-hidden="true"></i> 删除
                            </button>
                        </div>
                        <table id="exampleTableEvents" data-mobile-responsive="true">
                            <%--<thead>
                            <tr>
                                <th data-field="state" data-checkbox="true"></th>
                                <th data-field="id">ID</th>
                                <th data-field="name">名称</th>
                                <th data-field="price">价格</th>
                            </tr>
                            </thead>--%>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/nprogress/nprogress.js"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/static/hplus/js/demo/bootstrap_table_demo.min.js"></script>--%>
<script type="text/javascript">
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };

    $(function () {
        $("#exampleTableEvents").bootstrapTable({
            // url: "/static/hplus/js/demo/bootstrap_table_test.json",
            url: "/user/getList?pageNumber=1&pageSize=10",
            search: true,
            pagination: true,
            showRefresh: true,
            showToggle: true,
            showColumns: true,
            // showFooter:true,
            // sortable:true,
            sidePagination: 'server',
            iconSize: "outline",
            pageList: '[10, 25, 50, 100]',
            toolbar: "#exampleTableEventsToolbar",
            icons: {
                refresh: " glyphicon-repeat",
                toggle: "glyphicon-list-alt",
                columns: "glyphicon-list"
            },
            columns: [[
                {checkbox: true},
                {title: '序号', type: 'numbers', width: 60},
                {field: 'id', title: 'ID', visible: false},
                {
                    field: 'loginName',
                    title: '用户名',
                    titleTooltip: "登录的名字",
                    align: 'center',
                    // sortable: true,
                    // clickToSelect: true
                },
                {field: 'userName', title: '真实姓名'},
                {field: "avatar", title: "头像", width: 60},
                {field: 'gender', title: '性别', width: 60},
                {field: 'mobile', title: '手机'},
                {field: 'email', title: '邮箱'},
                {field: 'createDate', title: '创建时间'},
                {field: 'updateDate', title: '更新时间'},
                {field: 'delFlag', title: '状态', width: 100},
                {title: '操作', width: 200}
            ]],
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
    });
</script>
</body>

</html>
