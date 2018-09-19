<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>会员列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/jsp/common/common.jsp" flush="true"/>

</head>

<body>
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">会员管理</a>
        <a>
          <cite>会员列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div id="testText">

</div>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            会员搜索：
            <div class="layui-inline">
                <input class="layui-input" placeholder="开始日" name="start" id="start">
            </div>
            <div class="layui-inline">
                <input class="layui-input" placeholder="截止日" name="end" id="end">
            </div>
            <div class="layui-inline">
                <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','./add.html',600,400)"><i class="layui-icon"></i>添加
        </button>
        <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>
    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>用户编号</th>
            <th>用户姓名</th>
            <th>用户年龄</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="bean" items="${page.list}" varStatus="status">
            <tr data-id="1">
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1"><i
                            class="layui-icon">&#xe605;</i>
                    </div>
                </td>
                <td>${bean.id}</td>
                <td>${bean.name}</td>
                <td>${bean.age}</td>
                <td class="td-status">
                    <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>
                <td class="td-manage">
                    <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
                        <i class="layui-icon">&#xe601;</i>
                    </a>
                    <a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 1, 600, 400)" href="javascript:;">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a onclick="WeAdminShow('修改密码','./password.html',600,400)" title="修改密码" href="javascript:;">
                        <i class="layui-icon">&#xe631;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="page">
        <div>
            <a class="prev" href="">&lt;&lt;</a>
            <a class="num" href="">1</a>
            <span class="current">2</span>
            <a class="num" href="">3</a>
            <a class="num" href="">489</a>
            <a class="next" href="">&gt;&gt;</a>
        </div>
    </div>
</div>
</body>

</html>