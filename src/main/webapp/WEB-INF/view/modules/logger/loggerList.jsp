<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>日志记录</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class=" ibox float-e-margins">
                <div class="ibox-content queryForm">
                    <div id="formSearch" class="form-horizontal">
                        <div class="form-group" style="margin-top:5px;margin-bottom: -10px">
                            <label class="control-label col-sm-1" for="moduleName">功能模块</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="moduleName" placeholder="请输入模块名   ">
                            </div>
                            <label class="control-label col-sm-1" for="businessType">业务类型</label>
                            <div class="col-sm-1">
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
                            <label class="control-label col-sm-1" for="businessType">是否异常</label>
                            <div class="col-sm-1">
                                <select class="form-control m-b" name="isException" id="isException">
                                    <option value=""></option>
                                    <option value=0>正常</option>
                                    <option value=1>异常</option>
                                </select>
                            </div>
                            <div class="col-sm-4" style="text-align:left;">
                                <button type="button" class="btn btn-primary btn-query">
                                    <i class="fa fa-search" aria-hidden="true"></i> 查询
                                </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-reset">
                                    <i class="fa fa-reply" aria-hidden="true"></i> 重置
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="btn-group hidden-xs" id="talbeToolbar" role="group">
                        <button type="button" class="btn btn-outline btn-info queryFormToggle">
                            <i class="fa fa-search-plus" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-outline btn-danger" id="batchDel">
                            <i class="fa fa-trash-o" aria-hidden="true"></i> 批量物理删除
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
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    $(function () {
        //table自定义参数
        var option = {
            url: "${ctx}/modules/logger/list",
            tableToolbar: "talbeToolbar",
            queryParams: function (params) {
                return {// 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
                    //key是后台分页参数, value是bootstrap提供的参数
                    page: Math.ceil(params.offset / params.limit) + 1,  //offset当前记录起始索引,转换为页码page
                    limit: params.limit,  //每页多少条
                    order: params.order,
                    ordername: params.sort,
                    moduleName: $("#moduleName").val(), // 额外添加的参数
                    businessType: $("#businessType").val(),
                    isException: $("#isException").val()
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
                    visible: false
                },
                {
                    field: 'moduleName',
                    title: '用户名',
                    align: 'center',
                    width: 80
                },
                {
                    field: 'businessType',
                    title: '业务类型',
                    align: 'center',
                    formatter: 'businessTypeFormatter'
                },
                {
                    field: "execMethod",
                    title: "执行方法",
                    align: 'center',
                    formatter: 'lengthFormatter'
                },
                {
                    field: 'remoteUrl',
                    title: '请求地址',
                    align: 'center'
                },
                {
                    field: 'requestMethod',
                    title: '请求类型',
                    align: 'center'
                },
                {
                    field: 'remoteAddr',
                    title: 'IP地址',
                    align: 'center'
                },
                {
                    field: 'execTime',
                    title: '耗费时间(ms)',
                    align: 'center'
                },
                {
                    field: 'isException',
                    title: '是否异常',
                    align: 'center',
                    formatter: 'statusFormatter'
                },
                {
                    field: 'createDate',
                    title: '操作时间',
                    align: 'center'
                },
                {
                    title: '操作',
                    width: 200,
                    align: 'center',
                    clickToSelect: false,
                    events: operateEvents,
                    formatter: 'operateFormatter'
                }
            ]
        };

        //初始化表格
        $.table.init(option);

        $('.btn-query').click(function () {
            var opt = {
                url: option.url,
                // silent: true,
                moduleName: $("#moduleName").val(), // 额外添加的参数
                businessType: $("#businessType").val(),
                isException: $("#isException").val()
            };
            $('#bootstrap-table').bootstrapTable('refresh', opt);
        });

        //批量删除方法
        $('#batchDel').click(function () {
            $.operator.batchDelete("${ctx}/modules/logger/batchDelete");
        })

    });


    //长度格式化
    function lengthFormatter(value, row, index) {
        if (value.length > 20) {
            return "<span title='" + value + "'>" + value.substring(0, 20) + "..." + "</span>";
        } else {
            return "<span title='" + value + "'>" + value.substring(0, value.length) + "</span>";
        }
    }


    // 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfdetail btn btn-xs  btn-success" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;详情</button>',
            '<button type="button" class="RoleOfdelete btn btn-xs  btn-danger" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;物理删除</button>'
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

    // 格式化状态
    function businessTypeFormatter(value, row, index) {
        switch (value) {
            case 0:
                return '新增';
            case 1:
                return '更新';
            case 2:
                return '删除';
            case 3:
                return '查询';
            case 4:
                return '登录';
            case 5:
                return '注销';
            case 6:
                return '其他';
            default:
                return "";


        }
    }

    //初始化操作按钮的方法
    window.operateEvents = {
        'click .RoleOfdetail': function (e, value, row, index) {
            $.modal.edit("日志信息", "${ctx}/modules/logger/toForm", "50%", "90%", row.id)
        },
        'click .RoleOfdelete': function (e, value, row, index) {
            $.operator.delete("${ctx}/modules/logger/delete", row.id);
        }
    }
</script>
</body>

</html>
