<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>日志记录</title>
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

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <%--        <div class="col-sm-2">
                    <div class=" ibox float-e-margins">
                        <div class="ibox-content" style="height: 720px;">
                            <input type="text" class="form-control" id="ztreeKey" placeholder="录入字符试试吧">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </div>
                </div>--%>
        <div class="col-sm-12">
            <div class=" ibox float-e-margins">
                <div class="ibox-content">
                    <form id="formSearch" class="form-horizontal">
                        <div class="form-group" style="margin-top:15px">
                            <label class="control-label col-sm-1" for="module">功能模块</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="module" placeholder="请输入模块名   ">
                            </div>
                            <label class="control-label col-sm-1" for="businessType">业务类型</label>
                            <div class="col-sm-2">
                                <select class="form-control m-b" name="businessType" id="businessType">
                                    <option value=""></option>
                                    <option value=0>新增</option>
                                    <option value=1>更新</option>
                                    <option value=2>删除</option>
                                    <option value=3>查询</option>
                                    <option value=4>登录</option>
                                    <option value=5>注销</option>
                                    <option value=6>其他</option>
                                </select>
                            </div>
                            <div class="col-sm-4" style="text-align:left;">
                                <button type="button" id="btn_query" class="btn btn-primary">
                                    <i class="fa fa-search" aria-hidden="true"></i> 查询
                                </button>
                                <button type="button" id="btn_reset" class="btn">
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
                    <table id="tableId" data-mobile-responsive="true"></table>
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
<script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.exhide.js"></script>
<script type="text/javascript" src="${ctxStatic}/ztree/js/fuzzysearch.js"></script>


<script type="text/javascript">
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    $(function () {

        /*  //ztree自定义参数
          var setting = {
              data: {
                  simpleData: {
                      enable: true
                  }
              }
          };

          //初始化ztree
          $.ajax({
              url: "
        ${ctx}/menu/getMenuTree",
            type: "post",
            dataType: "json",
            success: function (data) {
                $.fn.zTree.init($("#treeDemo"), setting, data);
                //初始化模糊搜索方法
                fuzzySearch('treeDemo', '#ztreeKey', null, true);
            }
        });*/

        //table自定义参数
        var option = {
            $tableId: $("#tableId"),
            url: "${ctx}/sysLog/getList",
            tableToolbar: "talbeToolbar",
            queryParams: function (params) {
                return {// 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    //key是后台分页参数, value是bootstrap提供的参数
                    page: Math.ceil(params.offset / params.limit) + 1,  //offset当前记录起始索引,转换为页码page
                    limit: params.limit,  //每页多少条
                    order: params.order,
                    ordername: params.sort,
                    module: $("#module").val(), // 额外添加的参数
                    businessType: $("#businessType").val()
                }
            },
            columns: [
                {checkbox: true},
                {title: '序号', align: 'center',width:50,formatter: 'indexFormatter'},
                {field: 'id', title: 'ID', visible: false},
                {field: 'module', title: '用户名', align: 'center', width: 80},
                {field: 'businessType', title: '业务类型', align: 'center'},
                {field: "execMethod", title: "执行方法", align: 'center', formatter: 'lengthFormatter'},
                {field: 'remoteUrl', title: '请求地址', align: 'center'},
                {field: 'requestMethod', title: '请求类型', align: 'center'},
                {field: 'remoteAddr', title: 'IP地址', align: 'center'},
                {field: 'time', title: '执行时间(ms)', align: 'center'},
                {field: 'isException', title: '是否异常', align: 'center', formatter: 'statusFormatter'},
                // {field: 'exceptionInfo', title: '异常信息', align: 'center', formatter: 'lengthFormatter'},
                {
                    title: '操作',
                    width: 150,
                    align: 'center',
                    valign: 'middle',
                    events: operateEvents,
                    formatter: 'operateFormatter'
                }
            ]
        };


        bootstrapTableInit(option);

        //查询方法
        $('#btn_query').click(function () {
            option.$tableId.bootstrapTable('refresh');
        });

        //重置方法
        $('#btn_reset').click(function () {
            $('.form-control').val('');
        });

    });


    //表格初始化通用方法
    function bootstrapTableInit(option) {
        option.$tableId.bootstrapTable({
            url: option.url,
            dataType: "json",
            toolbar: "#" + option.tableToolbar,
            showRefresh: true, //右上角按钮
            showToggle: true, //右上角按钮
            showColumns: true, //右上角按钮
            iconSize: "outline", //右上角按钮风格
            uniqueId: "id",
            editable: true,//开启编辑模式
            // clickToSelect: true,//点击复选框选中
            pageNumber: 1,
            pageSize: 10,
            pagination: true, // 在表格底部显示分页组件，默认false
            sidePagination: 'server', //设置为服务器端分页
            pageList: '[5, 10, 20, 30, 40, 50]',  // 设置页面可以显示的数据条数
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            queryParamsType: "limit",
            queryParams: option.queryParams,
            icons: {
                refresh: " glyphicon-repeat",
                toggle: "glyphicon-list-alt",
                columns: "glyphicon-list"
            },
            columns: option.columns,
            onLoadSuccess: function () {  //加载成功时执行
            },
            onLoadError: function () {  //加载失败时执行
            }
        });
    }


    //长度格式化
    function lengthFormatter(value, row, index) {
        if (value.length > 20) {
            return "<span title='" + value + "'>" + value.substring(0, 20) + "..." + "</span>";
        } else {
            return "<span title='" + value + "'>" + value.substring(0, value.length) + "</span>";
        }
    }

    //序号格式化
    function indexFormatter (value, row, index) {
        //获取每页显示的数量
        var pageSize=$('#tableId').bootstrapTable('getOptions').pageSize;
        //获取当前是第几页
        var pageNumber=$('#tableId').bootstrapTable('getOptions').pageNumber;
        //返回序号，注意index是从0开始的，所以要加上1
        return pageSize * (pageNumber - 1) + index + 1;
    }

    //头像格式化
    function avatarFormatter(value, row, index) {
        if (value === undefined || value === "") {
            return ""
        } else {
            return '<img style="width:30px;magrin:0px" src=" ${ctx}/static/images/head/' + value + '">';
        }
    }

    //性别格式化
    function genderFormatter(value, row, index) {
        return value === "1" ? '<i class="fa fa-mars" ></i>' : '<i class="fa fa-venus" ></i>';
    }

    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfdetail btn btn-xs  btn-info" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;详情</button>',
        ].join('');
    }

    // 格式化状态
    function statusFormatter(value, row, index) {
        if (value === 0) {
            return '<span class="label label-success">正常</span>';
        } else {
            return '<span class="label label-info">异常</span>';
        }
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfdetail': function (e, value, row, index) {
            console.info(row.id);
            // update(row.id);
        }
    }
</script>
</body>

</html>
