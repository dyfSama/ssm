<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>机构树</title>
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class=" ibox float-e-margins">
            <div class="ibox-content" >
                <%-- 引入ztreehtml --%>
                <jsp:include page="/WEB-INF/view/include/ztree.jsp"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $.modal.NProgres();

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
                        rootPId: ''
                    }
                },
                callback: {
                    onClick: zTreeOnClick
                }
            },
            url: "${ctx}/modules/dept/getDeptTree"
        };
        $.ztree.init(ztreeOption);

        function zTreeOnClick(event, treeId, treeNode) {
            if (treeNode !== undefined) {
                var index = parent.layer.getFrameIndex(window.name);
                console.info(treeNode);
                //用户查询
                parent.$('#deptId').val(treeNode.id);
                parent.$('#deptName').val(treeNode.deptName);
                //新增机构
                parent.$('#parentId').val(treeNode.id);
                parent.$('#parentName').val(treeNode.deptName);
                parent.layer.close(index);
            }
        }


    });
</script>
</body>

</html>

