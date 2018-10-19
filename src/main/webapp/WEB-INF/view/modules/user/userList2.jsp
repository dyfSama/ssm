<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 网站用户</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>

    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/nprogress/nprogress.css" rel="stylesheet">
    <link href="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/css/layui.css" media="all" rel="stylesheet" >

    <script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
    <script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="${ctxStatic}/hplus/js/plugins/nprogress/nprogress.js"></script>
    <script src="${ctxStatic}/layuiadmin/dist/layuiadmin/layui/layui.js"></script>

    <link rel="stylesheet" href="${ctxStatic}/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.core.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${ctxStatic}/ztree/js/jquery.ztree.exedit.js"></script>

</head>
<%--<body>--%>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="layui-card">
                    <div class="zTreeDemoBackground left">
                        <ul id="treeDemo" class="ztree" ></ul>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-sm-10">
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
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="userName" placeholder="请输入用户名" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <select name="gender">
                                        <option value="">不限</option>
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                            </div>
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
                                <i class="layui-icon  layui-icon-add-circle"></i>添加用户
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


        $.ajax({
            url: "${ctx}/menu/getList",
            type: "post",
            dataType: "json",
            data: {
                id: "",
            },
            success: function (data) {
                /*TREE */
                var setting = {
                    view: {
                        addHoverDom: addHoverDom,
                        removeHoverDom: removeHoverDom,
                        selectedMulti: false
                    },
                    check: {
                        enable: true
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    edit: {
                        enable: true
                    }
                };


                // var zNodes =
                $.fn.zTree.init($("#treeDemo"), setting, data);

            }
        });

        // $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
            /* var sObj = $("#" + treeNode.tId + "_span");
             if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
             var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                 + "' title='add node' onfocus='this.blur();'></span>";
             sObj.after(addStr);
             var btn = $("#addBtn_"+treeNode.tId);
             if (btn) btn.bind("click", function(){
                 var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                 zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                 return false;
             });*/
        };
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };


        var zNodes =[
            { id:1, pId:0, name:"父节点1 - 展开", open:true},
            { id:11, pId:1, name:"父节点11 - 折叠"},
            { id:111, pId:11, name:"叶子节点111"},
            { id:112, pId:11, name:"叶子节点112"},
            { id:113, pId:11, name:"叶子节点113"},
            { id:114, pId:11, name:"叶子节点114"},
            { id:12, pId:1, name:"父节点12 - 折叠"},
            { id:121, pId:12, name:"叶子节点121"},
            { id:122, pId:12, name:"叶子节点122"},
            { id:123, pId:12, name:"叶子节点123"},
            { id:124, pId:12, name:"叶子节点124"},
            { id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true},
            { id:2, pId:0, name:"父节点2 - 折叠"},
            { id:21, pId:2, name:"父节点21 - 展开", open:true},
            { id:211, pId:21, name:"叶子节点211"},
            { id:212, pId:21, name:"叶子节点212"},
            { id:213, pId:21, name:"叶子节点213"},
            { id:214, pId:21, name:"叶子节点214"},
            { id:22, pId:2, name:"父节点22 - 折叠"},
            { id:221, pId:22, name:"叶子节点221"},
            { id:222, pId:22, name:"叶子节点222"},
            { id:223, pId:22, name:"叶子节点223"},
            { id:224, pId:22, name:"叶子节点224"},
            { id:23, pId:2, name:"父节点23 - 折叠"},
            { id:231, pId:23, name:"叶子节点231"},
            { id:232, pId:23, name:"叶子节点232"},
            { id:233, pId:23, name:"叶子节点233"},
            { id:234, pId:23, name:"叶子节点234"},
            { id:3, pId:0, name:"父节点3 - 没有子节点", isParent:true}
        ];




        // $(document).ready(function(){
        //
        // });


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
            url: '/user/getList',
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
                {field: 'userName', title: '用户名'},
                {field: 'realName', title: '真实姓名'},
                {field: "avatar", title: "头像", width: 60, templet: "#imgTpl"},
                // {field: 'password', title: '密码'},
                {field: 'gender', title: '性别', templet: '#genderTpl', width: 60},
                {field: 'mobile', title: '手机[点击修改]', edit: 'text'},
                {field: 'email', title: '邮箱'},
                {field: 'birthday', title: '生日'},
                {field: 'createDate', title: '创建时间', sort: true},
                {field: 'updateDate', title: '更新时间', sort: true},
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
                    title: '添加用户',
                    maxmin: true,
                    area: ['40%', '90%'],
                    content: '/user/form',
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
                                    url: "/user/batchDelete",
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
                    title: '编辑用户',
                    maxmin: true,
                    area: ['40%', '90%'],
                    content: '/user/form',
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
                        url: "/user/delete",
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
                url: "/user/save",
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
