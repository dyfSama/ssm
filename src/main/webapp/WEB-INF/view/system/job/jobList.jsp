<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<style>
    body{
        text-align: center;
    }
</style>
<body>
<!-- 主页面 -->
<div class="content">
    <input id="sdfdsf" type="text" name="sdfds"class="form-control" maxlength="20" value="<%=basePath%>" /><br><br>
    <input id="sdfdsf" type="text" name="sdfds"class="form-control" maxlength="20" value="<%=path%>" /><br><br>
    <form action="/job/setDynamicCronTask" method="post">
        <label>动态设置cron:</label>
        <input id="shopName" type="text" name="setCron"class="form-control" maxlength="20" /><br><br>
        <input type="submit" value="submit"/>
    </form>
</div>
</body>
<script type="text/javascript">
    // alert(path);
    // alert(basepath)
</script>
</html>
