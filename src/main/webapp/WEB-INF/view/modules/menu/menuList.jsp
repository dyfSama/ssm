<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>菜单列表</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>

</head>

<body class="gray-bg">
<div class="row wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content queryForm">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:5px;margin-bottom: -10px">
                        <label class="control-label col-sm-1" for="menuName">菜单名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="menuName" placeholder="请输入菜单名称   ">
                        </div>
                        <label class="control-label col-sm-1" for="isShow">是否显示</label>
                        <div class="col-sm-2">
                            <select class="form-control m-b" id="isShow">
                                <option value=""></option>
                                <option value="0">显示</option>
                                <option value="1">隐藏</option>
                            </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" class="btn btn-primary btn-query">
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
                    <button type="button" class="btn btn-outline btn-info queryFormToggle">
                        <i class="fa fa-search-plus" aria-hidden="true"></i>
                    </button>
                </div>
                <table id="tree-table" data-classes="table table-no-bordered"></table>
            </div>
        </div>
    </div>
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
</div>
</body>
<script type="text/javascript">
    $.modal.pageBlockUI();
    $(function () {
        var option = {
            url: "${ctx}/modules/menu/list",
            tableToolbar: "talbeToolbar",
            columns: [
                {
                    field: 'selectItem',
                    radio: true
                },
                {
                    field: 'menuName',
                    title: '菜单名称',
                    width: "100px",
                    align: 'left',
                    formatter: nameFormatter
                },
                /*{
                    field: 'id',
                    title: '菜单编号',
                    width: "5%",
                    sortable: true,
                    align: 'center'
                },*/
                /*  {
                      field: 'parentId',
                      title: '父级编号',
                      width: "5%",
                      sortable: true,
                      align: 'center'
                  },*/
                {
                    field: 'menuSort',
                    title: '排序',
                    width: "5%",
                    align: 'center'
                },
                {
                    field: 'permission',
                    title: '权限标识',
                    width: "10%",
                    align: 'center'
                },
                {
                    field: 'url',
                    title: '请求地址',
                    width: "10%",
                    align: 'center'
                },
                {
                    field: 'menuType',
                    title: '菜单类型',
                    width: "5%",
                    align: 'center',
                    formatter: typeFormatter
                },
                {
                    field: 'isShow',
                    title: '是否显示',
                    width: "5%",
                    align: 'center',
                    formatter: isShowFormatter
                },
                {
                    field: 'status',
                    title: '状态',
                    width: '5%',
                    align: 'center',
                    formatter: statusFormatter
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    width: '100px',
                    clickToSelect: false,
                    // events: operateEvents,
                    formatter: operateFormatter
                    // formatter: function(value, row, index) {
                    // }
                }
            ]
        };

        $.treeTable.init(option);

        //刷新
        $('.btn-query').click(function () {
            var params = {
                menuName: $('#menuName').val(),
                isShow: $('#isShow').val()
            };
            $.modal.ajaxBlockUI("正在努力加载数据中...");
            $.treeTable.refresh(params);
        });

        $('#add').click(function () {
            // var checkData = $("#tree-table").bootstrapTable('getSelections');
            // console.info(checkData);
            $.modal.add("新增菜单", "${ctx}/modules/menu/toForm", "50%", "90%");
        });


    });


    // 格式化按钮
    function operateFormatter(value, row, index) {
        var actions = [];
        // actions.push('<a class="btn btn-primary btn-xs " href="#" onclick="addChild(\'' + row.id + '\')"><i class="fa fa-plus"></i>新增下级菜单</a>&nbsp; ');
        actions.push('<a class="btn btn-success btn-xs " href="#" onclick="edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> &nbsp;');
        actions.push('<a class="btn btn-danger btn-xs " href="#" onclick="del(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>&nbsp;');
        return actions.join('');
        // return [
        //     '<button type="button" class="RoleOfadd btn btn-xs   btn-primary" style="margin-right:15px;"><i class="fa fa-plus" ></i>&nbsp;新增下级菜单</button>',
        //     '<button type="button" class="RoleOfedit btn btn-xs   btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;编辑</button>',
        //     '<button type="button" class="RoleOfdelete btn btn-xs   btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
        // ].join('');

    }


    // 格式化状态
    function statusFormatter(value, row, index) {
        if (value === '0') {
            return '<span class="label label-success">启用</span>';
        } else {
            return '<span class="label label-info">停用</span>';
        }
    }

    // 是否显示
    function isShowFormatter(value, row, index) {
        if (value === false) {
            return '<span class="label label-success">隐藏</span>';
        } else {
            return '<span class="label label-info">显示</span>';
        }
    }

    // 名字图标
    function nameFormatter(value, row, index) {
        if (row.icon == null || row === "") {
            return row.menuName;
        } else {
            return '<i class="' + row.icon + '"></i> <span class="nav-label">' + row.menuName + '</span>';
        }
    }

    //菜单类型
    function typeFormatter(value, row, index) {
        if (value === 'C') {
            return '<span class="label label-warning">目录</span>';
        } else if (value === 'M') {
            return '<span class="label label-success">菜单</span>';
        } else if (value === 'B') {
            return '<span class="label label-info">按钮</span>';
        }
    }


    function addChild(parentId) {
        $.modal.edit("新增下级菜单", "${ctx}/modules/menu/toForm", "50%", "90%", parentId);
    }

    function edit(id) {
        $.modal.edit("编辑菜单", "${ctx}/modules/menu/toForm", "50%", "90%", id);

    }

    function del(id) {
        $.operator.delete("${ctx}/modules/menu/delete", id);

    }

    /* //初始化操作按钮的方法
     window.operateEvents = {
         'click .RoleOfadd': function (e, value, row, index) {

             $.modal.edit("新增菜单", "${ctx}/modules/menu/toForm", "50%", "90%", row.id);
        },
        'click .RoleOfdelete': function (e, value, row, index) {
            $.operator.delete("${ctx}/modules/menu/delete", row.id);

        },
        'click .RoleOfedit': function (e, value, row, index) {
            $.modal.edit("编辑菜单", "${ctx}/modules/menu/toForm", "50%", "90%", row.id);
        }
    };*/


</script>
</html>
