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
            <div class="ibox-content">
                <jsp:include page="/WEB-INF/view/include/ztree.jsp"/>
                <%-- 引入ztreehtml --%>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };
    $(function () {
        //ztree自定义参数
        var ztreeOption = {
            setting: {
                data: {
                    key: {
                        name: 'menuName',
                        title: 'permission'
                    },
                    simpleData: {
                        enable: true,
                        idKey: 'id',
                        pIdKey: 'parentId',
                        rootPId: 0
                    },
                    check: {
                        enable: true,
                        chkboxType: {"Y": "ps", "N": "ps"} //关联子操作
                    }
                },
                callback: {
                    onClick: zTreeOnClick
                }
            },
            url: "${ctx}/modules/menu/getMenuTree?roleId=${entityId}"
        };
        $.ztree.init(ztreeOption);

        function zTreeOnClick(event, treeId, treeNode) {
            if (treeNode !== undefined) {
                var index = parent.layer.getFrameIndex(window.name);
                console.info(treeNode);
                parent.$('#parentId').val(treeNode.id);
                parent.$('#parentName').val(treeNode.menuName);
                parent.layer.close(index);
            }
        }

    });
</script>
</body>

</html>

