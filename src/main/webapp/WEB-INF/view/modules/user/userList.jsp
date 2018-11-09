<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>

<body class="gray-bg">
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2 leftTree">
            <div class=" ibox float-e-margins">
                <div class="ibox-content" style="height: 668px;">
                    <%-- 引入ztreehtml --%>
                    <jsp:include page="/WEB-INF/view/include/ztree.jsp"/>
                </div>
            </div>
        </div>
        <div class="col-sm-10 rightList">
            <div class=" ibox float-e-margins">
                <div class="ibox-content queryForm">
                    <div id="toolbar">
                        <form id="formSearch" class="form-horizontal">
                            <input type="hidden" class="form-control" id="deptId">
                            <div class="form-group" style="margin-top:5px;margin-bottom: -10px">
                                <label class="control-label col-sm-1" for="userName">用户名</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" id="userName" placeholder="请输入用户名">
                                </div>
                                <label class="control-label col-sm-1" for="realName">用户姓名</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" id="realName" placeholder="请输入用户姓名">
                                </div>
                                <label class="control-label col-sm-1" for="status">状态</label>
                                <div class="col-sm-1">
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
                </div>
                <div class="ibox-content">
                    <div class="btn-group hidden-xs" id="talbeToolbar" role="group">
                        <button type="button" class="btn btn-white toggleTree">
                            <i class="glyphicon glyphicon-chevron-left toggleI"></i>
                        </button>
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
<script type="text/javascript">
    $.modal.pageBlockUI();
    $(function () {
        //ztree自定义参数
        var ztreeOption = {
            setting: {
                data: {
                    key: {
                        name: 'deptName',
                        title: 'remarks'
                    },
                    simpleData: {
                        enable: true,
                        idKey: 'id',
                        pIdKey: 'parentId',
                        rootPId: 0
                    }
                },
                callback: {
                    onClick: zTreeOnClick
                }
            },
            url: "${ctx}/modules/dept/getDeptTree"
        };
        $.ztree.init(ztreeOption);

        //table自定义参数
        var option = {
            url: "${ctx}/modules/user/list",
            tableToolbar: "talbeToolbar",
            queryParams: function (params) {
                return {// 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    //key是后台分页参数, value是bootstrap提供的参数
                    page: params.offset / params.limit + 1,  //offset当前记录起始索引,转换为页码page
                    limit: params.limit,  //每页多少条
                    // order: params.order,
                    // ordername: params.sort,
                    userName: $("#userName").val(), // 额外添加的参数
                    realName: $("#realName").val(),
                    status: $("#status").val(),
                    deptId: $("#deptId").val()
                }
            },
            columns: [
                {checkbox: true},
                {
                    title: '序号',
                    align: 'center',
                    width: '3%',
                    formatter: indexFormatter
                },
                {
                    field: 'id',
                    title: 'ID',
                    visible: false
                },
                {
                    field: 'userName',
                    title: '用户名',
                    align: 'center',
                    width: '10%',
                    formatter: lengthFormatter

                },
                {
                    field: 'realName',
                    title: '真实姓名',
                    align: 'center',
                    width: '8%',
                    formatter: lengthFormatter
                },
                /* {
                     field: "avatar",
                     title: "头像",
                     align: 'center',
                     width: '5%',
                     clickToSelect: false,
                     formatter: avatarFormatter
                 },*/
                {
                    field: 'gender',
                    title: '性别',
                    align: 'center',
                    width: '2%',
                    formatter: genderFormatter
                },
                {
                    field: 'mobile',
                    title: '手机号码',
                    align: 'center',
                    width: '10%'

                },
                {
                    field: 'email',
                    title: '邮箱',
                    align: 'center',
                    width: '10%',
                    formatter: lengthFormatter
                },
                {
                    field: 'birthday',
                    title: '生日',
                    align: 'center',
                    width: '10%'

                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    width: '5%',
                    formatter: statusFormatter
                },
                {
                    field: 'remarks',
                    title: '备注',
                    align: 'center',
                    width: '10%'
                },
                {
                    title: '操作',
                    width: '100px',
                    align: 'center',
                    clickToSelect: false,
                    events: operateEvents,
                    formatter: operateFormatter
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
                userName: $("#userName").val(), // 额外添加的参数
                realName: $("#realName").val(),
                status: $("#status").val(),
                deptId: $("#deptId").val()
            };
            $.modal.ajaxBlockUI("正在处理中...");
            $('#bootstrap-table').bootstrapTable('refresh', opt);
        });

        //添加方法
        $('#add').click(function () {
            $.modal.add("添加用户", "${ctx}/modules/user/toForm", "50%", "90%");
        });
        //批量删除方法
        $('#batchDel').click(function () {
            $.operator.batchDelete("${ctx}/modules/user/batchDelete");
        });

    });

    //点击方法
    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode !== undefined) {
            $('#deptId').val(treeNode.id);
            $.table.refresh();
        }
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfdelete': function (e, value, row, index) {
            $.operator.delete("${ctx}/modules/user/delete", row.id);
        },
        'click .RoleOfedit': function (e, value, row, index) {
            $.modal.edit("编辑用户", "${ctx}/modules/user/toForm", "50%", "90%", row.id);
        }
    };

    //长度格式化
    function lengthFormatter(value, row, index) {
        if (value != null) {
            if (value.length > 10) {
                return "<span title='" + value + "'>" + value.substring(0, 10) + "..." + "</span>";
            } else {
                return "<span title='" + value + "'>" + value.substring(0, value.length) + "</span>";
            }

        }
    }

    //头像格式化
    function avatarFormatter(value, row, index) {
        var url = "${ctx}/modules/userInfo/getAvatarById?id=" + row.id + "&t=" + Math.random();
        return '<img style="width:20px;" src="' + url + '">';
    }

    //性别格式化
    function genderFormatter(value, row, index) {
        return value === "1" ? '<i class="fa fa-mars" ></i>' : '<i class="fa fa-venus" ></i>';
    }

    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            // '<button type="button" class="RoleOfreset btn btn-xs  btn-info" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;重置</button>',
            '<button type="button" class="RoleOfedit btn btn-xs  btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;编辑</button>',
            '<button type="button" class="RoleOfdelete btn btn-xs  btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
        ].join('');
    }

    // 格式化状态
    function statusFormatter(value, row, index) {
        if (value === '0') {
            return '<span class="badge badge-success">启用</span>';
        } else {
            return '<span class="badge badge-info">停用</span>';
        }
    }

</script>
</body>

</html>
