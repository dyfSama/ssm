<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>日志详情</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>

<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
    <div class="row">
        <div class="col-sm-12">
            <form method="get" class="form-horizontal" id="formId">
                <input type="hidden" name="id">
                <div class="form-group">
                    <label class="col-sm-2 control-label">模块名称</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="moduleName" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">业务类型</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="businessType" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">执行方法</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="execMethod" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">请求方式</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="requestMethod" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">请求地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="remoteUrl" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">IP地址</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="remoteAddr" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">执行耗时</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="execTime" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">是否异常</label>
                    <div class="col-sm-8">
                        <div class="radio i-checks">
                            <input type="radio" value="0" name="isException"> <i></i>正常&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="1" name="isException"> <i></i> 异常
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">异常信息</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" name="exceptionInfo" rows="4" readonly>sdfdsfds</textarea>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
            </form>
        </div>
    </div>
</div>

<script>
    $.modal.NProgres();
    $(function () {
        $.ajax({
            url: "${ctx}/modules/logger/getById?id=${entityId}",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("input[name='id']").val(data.id);
                $("input[name='moduleName']").val(data.moduleName);
                $("input[name='businessType']").val(data.businessType);
                $("input[name='execMethod']").val(data.execMethod);
                $("input[name='remoteUrl']").val(data.remoteUrl);
                $("input[name='requestMethod']").val(data.requestMethod);
                $("input[name='remoteAddr']").val(data.remoteAddr);
                $("input[name='execTime']").val(data.execTime);
                // $("input[name='isException']").iCheck('disable');
                $("input[name='exceptionInfo']").val(data.exceptionInfo);
                if (data.status === "1") {
                    $("input[name='isException'][value='1']").iCheck('check');
                } else {
                    $("input[name='isException'][value='0']").iCheck('check');
                }
            }
        });
    });
</script>

</body>

</html>
