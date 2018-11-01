<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - </title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

<link rel="shortcut icon" href="images/favicon.ico">

    <%-- hplus--%>
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="${ctxStatic}/hplus/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Fancybox
                        <small>http://fancybox.net/</small>
                    </h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="basic_gallery.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href="basic_gallery.html#">选项1</a>
                            </li>
                            <li>
                                <a href="basic_gallery.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <a class="fancybox" href="images/001.jpg" title="图片1">
                        <img alt="image" src="images/001.jpg"/>
                    </a>

                </div>
            </div>
        </div>

    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/fancybox/jquery.fancybox.js"></script>
<script>
    $(document).ready(function () {
        $(".fancybox").fancybox({openEffect: "none", closeEffect: "none"})
    });
</script>


</body>

</html>
