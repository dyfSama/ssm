<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 树形视图</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctxStatic}/hplus/js/plugins/jquery-treegrid/jquery.treegrid.css">
    <%-- nprogress --%>
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="row wrapper wrapper-content animated fadeInRight">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <h1>菜单管理</h1>
                <table id="table"></table>
                <br/>
                <button class="btn btn-success" onclick="test()">选择</button>
            </div>
        </div>
        <div class="ibox-content">
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
        </div>
    </div>
    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-table-treegrid/bootstrap-table-treegrid.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/jquery-treegrid/jquery.treegrid.js"></script>
<%-- layer --%>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<%-- nprogress --%>
<script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>

</body>
<script type="text/javascript">
    layer.load(1, {shade: [0.5, '#393D49']});
    NProgress.start();
    window.onload = function () {

        NProgress.done();
    };
    var $table = $('#table');
    $(function () {
        treeTableInit();
    });

    function treeTableInit() {
        $table.bootstrapTable({
            url: "${ctx}/menu/getList",
            idField: 'id',
            dataType: 'json',
            toolbar: "#talbeToolbar",
            // search: true,  //搜索框
            // showRefresh: true, //右上角按钮
            // showToggle: true, //右上角按钮
            // showColumns: true, //右上角按钮
            // iconSize: "outline", //右上角按钮风格
            columns: [
                {
                    field: 'check', checkbox: true, formatter: function (value, row, index) {
                        if (row.check === true) {
                            // console.log(row.serverName);
                            //设置选中
                            return {checked: true};
                        }
                    }
                },
                {field: 'menuName', title: '名称', width:200, formatter: 'nameFormatter' },
                {field: 'id', title: '编号', sortable: true, align: 'center'},
                {field: 'menuSort', title: '排序'},
                {field: 'permission', title: '权限标识'},
                {field: 'url', title: '请求地址'},
                {field: 'isShow', title: '是否显示',align: 'center',width:70, formatter: 'isShowFormatter'},
                // {field: 'icon', title: '图标'},
                {field: 'status', title: '状态', sortable: true, align: 'center',width:70, formatter: 'statusFormatter'},
                {field: 'operate', title: '操作', align: 'center', width:270, events: operateEvents, formatter: 'operateFormatter'},
            ],

            // bootstrap-table-treegrid.js 插件配置 -- start

            //在哪一列展开树形
            treeShowField: 'menuName',
            //指定父id列
            parentIdField: 'parentId',

            onResetView: function (data) {
                layer.closeAll('loading');
                //console.log('load');
                $table.treegrid({
                    initialState: 'collapsed',// 所有节点都折叠
                    // initialState: 'expanded',// 所有节点都展开，默认展开
                    treeColumn: 1,
                    expanderExpandedClass: 'glyphicon glyphicon-chevron-right',  //图标样式
                    expanderCollapsedClass: 'glyphicon glyphicon-chevron-down',
                    onChange: function () {
                        $table.bootstrapTable('resetWidth');
                    }
                });

                //只展开树形的第一级节点
                $table.treegrid('getRootNodes').treegrid('expand');

            },
            onCheck: function (row) {
                var datas = $table.bootstrapTable('getData');
                // 勾选子类
                selectChilds(datas, row, "id", "pid", true);

                // 勾选父类
                selectParentChecked(datas, row, "id", "pid")

                // 刷新数据
                $table.bootstrapTable('load', datas);
            },

            onUncheck: function (row) {
                var datas = $table.bootstrapTable('getData');
                selectChilds(datas, row, "id", "pid", false);
                $table.bootstrapTable('load', datas);
            },
            // bootstrap-table-treetreegrid.js 插件配置 -- end
        });
    }

    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfadd btn btn-sm btn-outline  btn-primary" style="margin-right:15px;"><i class="fa fa-plus" ></i>&nbsp;新增</button>',
            '<button type="button" class="RoleOfedit btn btn-sm btn-outline   btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;修改</button>',
            '<button type="button" class="RoleOfdelete btn btn-sm btn-outline   btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
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
    function isShowFormatter(value, row, index) {
        if (value === '0') {
            return '<span class="label label-success">显示</span>';
        } else {
            return '<span class="label label-info">隐藏</span>';
        }
    }
    function nameFormatter(value, row, index) {
        return '<i class=" '+ row.icon +' " aria-hidden="true"></i> ' + value;
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfadd': function (e, value, row, index) {
            layer.open({
                type: 2,
                title: '添加菜单',
                maxmin: true,
                area: ['70%', '95%'],
                content: '${ctx}/menu/form',
                end: function () {
                    $table.bootstrapTable('refresh', {url: "${ctx}/menu/getList"});

                }
            });
        },
        'click .RoleOfdelete': function (e, value, row, index) {
            del(row.id);
        },
        'click .RoleOfedit': function (e, value, row, index) {
            update(row.id);
        }
    };
</script>
<script>
    /**
     * 选中父项时，同时选中子项
     * @param datas 所有的数据
     * @param row 当前数据
     * @param id id 字段名
     * @param pid 父id字段名
     */
    function selectChilds(datas, row, id, pid, checked) {
        for (var i in datas) {
            if (datas[i][pid] == row[id]) {
                datas[i].check = checked;
                selectChilds(datas, datas[i], id, pid, checked);
            }
            ;
        }
    }

    function selectParentChecked(datas, row, id, pid) {
        for (var i in datas) {
            if (datas[i][id] == row[pid]) {
                datas[i].check = true;
                selectParentChecked(datas, datas[i], id, pid);
            }
            ;
        }
    }

    function test() {
        var selRows = $table.bootstrapTable("getSelections");
        if (selRows.length == 0) {
            alert("请至少选择一行");
            return;
        }

        var postData = "";
        $.each(selRows, function (i) {
            postData += this.id;
            if (i < selRows.length - 1) {
                postData += "， ";
            }
        });
        alert("你选中行的 id 为：" + postData);

    }

    function add(id) {
        alert("add 方法 , id = " + id);
    }

    function del(id) {
        alert("del 方法 , id = " + id);
    }

    function update(id) {
        alert("update 方法 , id = " + id);
    }


</script>
</html>
