<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 网站用户</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
    <link href="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layuiadmin/dist/layuiadmin/layui/css/layui.css" media="all">

    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="${pageContext.request.contextPath}/static/hplus/js/plugins/nprogress/nprogress.js"></script>
    <script src="${pageContext.request.contextPath}/static/layuiadmin/dist/layuiadmin/layui/layui.js"></script>
</head>
<%--<body>--%>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <%--<div class="ibox-title">--%>
                <div class="layui-card">
                    <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                        <div class="layui-form-item">
                            <%--<div class="layui-inline">
                                <label class="layui-form-label"> 创建日期 </label>
                                <div class="layui-input-block">
                                    <input type="text" name="createDate" id="createDate" placeholder="请输入日期范围" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>--%>
                            <div class="layui-inline">
                                <label class="layui-form-label">角色名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="roleName" placeholder="请输入角色名" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <%--<div class="layui-inline">--%>
                                <%--<label class="layui-form-label">性别</label>--%>
                                <%--<div class="layui-input-block">--%>
                                    <%--<select name="gender">--%>
                                        <%--<option value="">不限</option>--%>
                                        <%--<option value="1">男</option>--%>
                                        <%--<option value="0">女</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                                <div class="layui-inline">
                                    <label class="layui-form-label">状态</label>
                                    <div class="layui-input-block">
                                        <select name="status">
                                            <option value="">不限</option>
                                            <option value="0">启用</option>
                                            <option value="2">停用</option>
                                            <%--<option value="1">删除</option>--%>
                                        </select>
                                    </div>
                                </div>
                            <div class="layui-inline">
                                <button class="layui-btn layuiadmin-btn-useradmin" lay-submit
                                        lay-filter="LAY-user-front-search">
                                    <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i> 查询
                                </button>
                                <%-- <button class="layui-btn layui-btn-primary" type="reset" id="formReset">
                                     <i class="layui-icon "></i> 重置
                                 </button>--%>
                            </div>
                        </div>
                    </div>

                    <div class="layui-card-body">
                        <!-- 动态表格 -->
                        <table id="tableId" lay-filter="tableFilter"></table>
                        <!--头工具栏-->
                        <script type="text/html" id="topToolBarId">
                            <button class="layui-btn layuiadmin-btn-useradmin" lay-event="add">
                                <i class="layui-icon  layui-icon-add-circle"></i>添加角色
                            </button>
                            <button class="layui-btn  layui-btn-danger" lay-event="batchdel">
                                <i class="layui-icon  layui-icon-delete"></i>批量删除
                            </button>
                        </script>
                        <!--行工具栏-->
                        <script type="text/html" id="rowToolBarId">
                            <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
                                <i class="layui-icon layui-icon-edit"></i>编辑
                            </a>
                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
                                <i class="layui-icon layui-icon-delete"></i>删除
                            </a>
                        </script>
                        <!--模板-->
                        <script type="text/html" id="status">
                            <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch"
                                   lay-text="启用|停用" lay-filter="switchFilter" {{ d.status==0 ? 'checked' : ''}}>
                        </script>
                        <script type="text/html" id="genderTpl">
                            {{ d.gender == '0' ? '<i class="layui-icon layui-icon-female"></i>' : '<i
                                    class="layui-icon layui-icon-male"></i>'}}
                        </script>
                        <script type="text/html" id="imgTpl">
                            <%--<img style="display: inline-block; width: 50%; height: 100%;" src="${pageContext.request.contextPath}/static/imgaes/head/"{{= d.avatar }}>--%>
                            <img style="display: inline-block; width: 100%; height: 100%;"
                                 src="${ctx}/static/images/head/002.jpg">
                        </script>

                    </div>
                </div>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<div class="layui-fluid">

</div>

<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    //js写在页面了 直接加载使用
    layui.use(['table', 'form', 'jquery', 'laydate'], function () {
        var $ = layui.jquery;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;

        //日期框渲染
        laydate.render({
            elem: '#createDate',
            type: "datetime"
        });

        //数据表格渲染
        //表格渲染
        table.render({
            elem: "#tableId",
            toolbar: '#topToolBarId',
            defaultToolbar: [],
            // url: layui.setter.base + "json/useradmin/webuser.js",
            url: '${ctx}/role/getList',
            text: {none: '暂无相关数据(*＾-＾*)'},
            height: 'full-200',
            page: {
                limit: 20,
                limits: [10, 20, 30, 40, 50],
                groups: 5,
                layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
            },
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {title: '序号', type: 'numbers', width: 60},
                {field: 'id', title: 'ID', hide: true},
                {field: 'roleName', title: '角色名称'},
                {field: 'roleKey', title: '角色权限标识'},
                {field: 'remarks', title: '备注'},
                {field: 'status', title: '状态', templet: '#status', width: 100},
                {title: '操作', align: 'center', width: 200, fixed: 'right', toolbar: "#rowToolBarId"}
            ]],
            done: function (res, curr, count) {

            }
        });
        //监听搜索
        form.on('submit(LAY-user-front-search)', function (data) {
            //封装了form的对象
            var filed = data.field;
            //执行重载
            table.reload('tableId', {where: filed});
        });

        //监听表格头工具栏
        table.on('toolbar(tableFilter)', function (obj) {
            var layEvent = obj.event;
            if (layEvent === 'add') {
                layer.open({
                    type: 2,
                    title: '添加角色',
                    maxmin: true,
                    area: ['40%', '90%'],
                    content: '${ctx}/role/form',
                    end: function () {
                        table.reload('tableId'); //数据刷新
                    }
                });
            } else if (layEvent === 'batchdel') {
                var checkStatus = table.checkStatus('tableId');  //获取选中行
                var checkData = checkStatus.data; //获取选中行数据
                if (checkData.length === 0) {
                    return layer.msg("请选择数据");
                }
                layer.prompt({formType: 1, title: "敏感操作，请验证口令[admin]"}, function (value, indexp) {
                    if (value === "admin") {
                        layer.close(indexp);
                        layer.confirm("确定删除吗?", {
                            skin: 'layui-layer-molv',
                            icon: 2,
                            title: '提示',
                            anim: 6
                        }, function (indexc) {
                            layer.close(indexc);
                            var ids = [];
                            checkData.forEach(function (row, index) {
                                ids.push(row.id);
                            });
                            if (ids !== '') {
                                $.ajax({
                                    url: "${ctx}/user/batchDelete",
                                    type: "post",
                                    dataType: "json",
                                    data: "id=" + ids,
                                    beforeSend: function () {
                                        layer.load();
                                    },
                                    success: function (data) {
                                        layer.closeAll('loading');
                                        if (data.status === "0") {
                                            table.reload('tableId'); //数据刷新
                                            layer.msg(data.message, {icon: 6, time: 1000});
                                        } else {
                                            layer.msg(data.message, {icon: 2, time: 2000, anim: 6});
                                        }
                                    }
                                });
                            }
                        })
                    } else {
                        layer.msg("口令不正确!", {icon: 6, time: 1000, anim: 6});
                    }

                });
            }

        });
        //监听表格表格行工具栏
        table.on('tool(tableFilter)', function (obj) {
            var field = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'edit') {
                layer.open({
                    type: 2,
                    title: '编辑角色',
                    maxmin: true,
                    area: ['40%', '90%'],
                    content: '${ctx}/role/form',
                    end: function () {
                        table.reload('tableId'); //数据刷新
                    },
                    success: function (layero, index) {
                        var iframeWindow = window["layui-layer-iframe" + index];
                        iframeWindow.child(field);
                    }
                });

            } else if (layEvent === 'del') {
                layer.confirm("确定要删除吗？", {skin: 'layui-layer-molv', icon: 2, title: '提示', anim: 6}, function (index) {
                    layer.close(index);
                    $.ajax({
                        url: "${ctx}/role/delete",
                        type: "post",
                        dataType: "json",
                        data: {id: field.id},
                        beforeSend: function () {
                            layer.load();
                        },
                        success: function (data) {
                            layer.closeAll('loading');
                            if (data.status === "0") {
                                table.reload('tableId'); //数据刷新
                                layer.msg(data.message, {icon: 6, time: 1000});
                            } else {
                                layer.msg(data.message, {icon: 2, time: 2000, anim: 6});
                            }

                        }
                    });
                });
            }
        });


        form.on('switch(switchFilter)', function (data) {
            console.log(this.checked); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            var id = data.value;
            var status = this.checked ? '0' : '2';
            var message = this.checked ? '启用' : '停用';
            $.ajax({
                url: "${ctx}/role/save",
                type: "post",
                dataType: "json",
                data: {
                    id: id,
                    status: status
                },
                beforeSend: function () {
                    layer.load("");
                },
                success: function (data) {
                    layer.closeAll('loading');
                    if (data.status === "0") {
                        //  table.reload('tableId'); //数据刷新
                        layer.msg(message + "成功!", {icon: 6, time: 1000});
                    } else {
                        layer.msg(message + "失败!", {icon: 2, time: 2000, anim: 6});
                    }

                }
            });
        })

    });


</script>
</body>
</html>
