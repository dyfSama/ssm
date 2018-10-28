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
            <div class="ibox-content">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:5px;margin-bottom: -10px">
                        <label class="control-label col-sm-1" for="deptName">机构名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="deptName" placeholder="请输入机构名称   ">
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
                    <button type="button" class="btn btn-outline btn-primary" id="edit">
                        <i class="fa fa-trash-o" aria-hidden="true"></i> 编辑
                    </button>
                    <button type="button" class="btn btn-outline btn-danger" id="delete">
                        <i class="fa fa-trash-o" aria-hidden="true"></i> 删除
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
    $(function () {
        var option = {
            url: "${ctx}/modules/dept/list",
            tableToolbar: "talbeToolbar",
            columns: [
                {
                    field: 'selectItem',
                    radio: true
                },
                {
                    field: 'deptName',
                    title: '机构名称',
                    width: "8%"
                },
                {
                    field: 'id',
                    title: '机构编号',
                    width: "5%",
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'parentId',
                    title: '父级编号',
                    width: "5%",
                    sortable: true,
                    align: 'center'
                },
                {
                    field: 'deptSort',
                    title: '排序',
                    width: "5%",
                    align: 'center'
                },
                {
                    field: 'isShow',
                    title: '是否显示',
                    width: "5%", align: 'center',
                    formatter: isShowFormatter
                },
                {
                    field: 'status',
                    title: '状态',
                    width: '5%', align: 'center',
                    formatter: statusFormatter
                },
                {
                    field: 'operate',
                    title: '操作',
                    align: 'center',
                    width: '250px',
                    clickToSelect: false,
                    events: operateEvents,
                    formatter: operateFormatter
                }
            ]
        };

        $.treeTable.init(option);

        //刷新
        $('.btn-query').click(function () {
            var params = {
                deptName: $('#deptName').val(),
                isShow: $('#isShow').val()
            };
            $.treeTable.refresh(params);
        });

        $('#add').click(function () {
            $.modal.add("新增机构", "${ctx}/modules/dept/toForm", "50%", "90%");
        });
        $('#edit').click(function () {
            $.modal.edit("编辑机构", "${ctx}/modules/dept/toForm", "50%", "90%","120");
        });

    });


    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfadd btn btn-xs   btn-primary" style="margin-right:15px;"><i class="fa fa-plus" ></i>&nbsp;新增下级机构</button>',
            '<button type="button" class="RoleOfedit btn btn-xs   btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;编辑</button>',
            '<button type="button" class="RoleOfdelete btn btn-xs   btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
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

    // 是否显示
    function isShowFormatter(value, row, index) {
        if (value === '0') {
            return '<span class="label label-success">隐藏</span>';
        } else {
            return '<span class="label label-info">显示</span>';
        }
    }

    // 名字图标
    function nameFormatter(value, row, index) {
        if (row.icon == null || row == "") {
            return row.deptName;
        } else {
            return '<i class="' + row.icon + '"></i> <span class="nav-label">' + row.deptName + '</span>';
        }
    }


    $('#delete').click(function () {
        var checkData = $("#bootstrap-table").bootstrapTable('getSelections');
        console.info(checkData);
    });

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfadd': function (e, value, row, index) {

            $.modal.edit("新增机构", "${ctx}/menu/form", "50%", "90%", row.id);
        },
        'click .RoleOfdelete': function (e, value, row, index) {
            $.operator.delete("${ctx}/menu/delete", row.id);

        },
        'click .RoleOfedit': function (e, value, row, index) {
            $.modal.edit("编辑机构", "${ctx}/menu/form", "50%", "90%", row.id);
        }
    };


</script>
</html>
