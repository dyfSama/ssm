<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>角色列表</title>

    <%@include file="/WEB-INF/view/include/head.jsp" %>

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class=" ibox float-e-margins">
                <div class="ibox-content queryForm">
                    <form id="formSearch" class="form-horizontal">
                        <div class="form-group" style="margin-top:5px;margin-bottom: -10px">
                            <label class="control-label col-sm-1" for="roleName">角色名称</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="roleName" placeholder="请输角色名">
                            </div>
                            <label class="control-label col-sm-1" for="status">启用状态</label>
                            <div class="col-sm-2">
                                <select class="form-control m-b" name="status" id="status">
                                    <option value=""></option>
                                    <option value="0">启用</option>
                                    <option value="2">停用</option>
                                </select>
                            </div>
                            <div class="col-sm-4" style="text-align:left;">
                                <button type="button" class="btn btn-primary btn-query">
                                    <i class="fa fa-search" aria-hidden="true"></i> 查询
                                </button>
                                <button type="reset" class="btn btn-reset">
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
                        <button type="button" class="btn btn-outline btn-info queryFormToggle">
                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                        </button>
                    </div>
                    <table id="bootstrap-table" data-toggle="bootstrap-table" data-classes="table table-no-bordered">
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
</div>

<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    //table自定义参数
    $(function () {
        var option = {
            // $tableId: $("#tableId"),
            url: "${ctx}/modules/role/list",
            tableToolbar: "talbeToolbar",
            queryParams: function (params) {
                return {// 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    //key是后台分页参数, value是bootstrap提供的参数
                    page: Math.ceil(params.offset / params.limit) + 1,  //offset当前记录起始索引,转换为页码page
                    limit: params.limit,  //每页多少条
                    order: params.order,
                    ordername: params.sort,
                    roleName: $("#roleName").val(), // 额外添加的参数
                    status: $("#status").val()
                }
            },
            columns: [
                {checkbox: true},
                {
                    title: '序号',
                    align: 'center',
                    width: 50,
                    formatter: 'indexFormatter'
                },
                {
                    field: 'id',
                    title: 'ID',
                    align: 'center',

                    visible: false
                },
                {
                    field: 'roleName',
                    title: '角色名称',
                    align: 'center'
                },
                {
                    field: 'roleSort',
                    title: '排序',
                    align: 'center'
                },
                {
                    field: 'roleKey',
                    title: '角色权限标识',
                    align: 'center'
                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    width: 70,
                    formatter: 'statusFormatter'
                },
                {
                    field: 'remarks',
                    title: '备注',
                    align: 'center'
                },
                {
                    title: '操作',
                    width: 300,
                    align: 'center',
                    events: operateEvents,
                    clickToSelect: false,
                    formatter: 'operateFormatter'
                }
            ]
        };
        //初始化表格
        $.table.init(option);

        //查询方法
        $('.btn-query').click(function () {
            var opt = {
                url: option.url,
                // silent: true,
                roleName: $("#roleName").val(), // 额外添加的参数
                status: $("#status").val()
            };
            $('#bootstrap-table').bootstrapTable('refresh', opt);
        });

        //添加方法
        $('#add').click(function () {
            // $.modal.msg_success("添加角色")
            $.modal.add("添加角色", "${ctx}/modules/role/toForm", "50%", "90%");
        });
        //批量删除方法
        $('#batchDel').click(function () {
            $.operator.batchDelete("${ctx}/modules/role/batchDelete");
        })
    });


    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfdelete': function (e, value, row, index) {
            $.operator.delete("${ctx}/modules/role/delete", row.id);
        },
        'click .RoleOfedit': function (e, value, row, index) {
            $.modal.edit("编辑角色", "${ctx}/modules/role/toForm", "50%", "90%", row.id);
        },
        'click .RoleOfauthorize': function (e, value, row, index) {
            $.modal.edit('配置菜单权限', '${ctx}/modules/menu/toMenuTree', '300px', '500px', row.id);
        },
        'click .RoleOfassign': function (e, value, row, index) {
            $.modal.msg_success("给角色指派用户");
        }
    };

    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            // '<button type="button" class="RoleOfassign btn btn-xs  btn-default" style="margin-right:15px;"><i class="fa fa-user" ></i>&nbsp;分配</button>',
            // '<button type="button" class="RoleOfauthorize btn btn-xs  btn-success" style="margin-right:15px;"><i class="fa fa-hand-o-left" ></i>&nbsp;授权</button>',
            '<button type="button" class="RoleOfedit btn btn-xs  btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;编辑</button>',
            '<button type="button" class="RoleOfdelete btn btn-xs  btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
        ].join('');
    }

    // 格式化状态
    function statusFormatter(value, row, index) {
        if (value === '0') {
            return '<span class="label label-success">启用</span>';
        } else {
            return '<span class="label label-info">停用</span>';
        }
    }


</script>
</body>
</html>
