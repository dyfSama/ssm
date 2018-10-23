<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/WEB-INF/view/include/head.jsp" %>

    <title>H+ 后台主题UI框架 - 富头像上传编辑器</title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/hplus/images/favicon.ico">
    <link href="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/cdn/font-awesome.css" rel="stylesheet">

    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/plugins/cropper/cropper.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content">
                    <p>
                        一款简单的jQuery图片裁剪插件 </p>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="image-crop">
                                <img src="http://ozwpnu2pa.bkt.clouddn.com/a3.jpg">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4>图片预览：</h4>
                            <div class="img-preview img-preview-sm"></div>
                            <h4>说明：</h4>
                            <p>
                                你可以选择新图片上传，然后下载裁剪后的图片 </p>
                            <div class="btn-group">
                                <label title="上传图片" for="inputImage" class="btn btn-primary">
                                    <input type="file" accept="image/*" name="file" id="inputImage" class="hide">
                                    上传新图片
                                </label>
                                <label title="下载图片" id="download" class="btn btn-primary">下载</label>
                            </div>
                            <h4>其他说明：</h4>
                            <p>
                                你可以使用<code>$({image}).cropper(options)</code>来配置插件 </p>
                            <div class="btn-group">
                                <button class="btn btn-white" id="zoomIn" type="button">放大</button>
                                <button class="btn btn-white" id="zoomOut" type="button">缩小</button>
                                <button class="btn btn-white" id="rotateLeft" type="button">左旋转</button>
                                <button class="btn btn-white" id="rotateRight" type="button">右旋转</button>
                                <button class="btn btn-warning" id="setDrag" type="button">裁剪</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/cropper/cropper.min.js"></script>
<script src="${ctxStatic}/hplus/js/demo/form-advanced-demo.min.js"></script>



</body>

</html>
