<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title></title>
    <meta name="keywords" content="keyworkdstext">
    <meta name="description" content="dericsdfsddemo">

    <link rel="shortcut icon" href="${ctxStatic}/images/login/favicon.ico">
    <link href="${ctxStatic}/hplus/css/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/hplus/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="${ctxStatic}/hplus/js/plugins/cropbox/cropbox.css" rel="stylesheet">

</head>

<body>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="container">
                        <div class="imageBox">
                            <div class="thumbBox"></div>
                            <div class="spinner" style="display: none">Loading...</div>
                        </div>
                        <div class="action">
                            <div class="new-contentarea tc"><a href="javascript:void(0)" class="upload-img">
                                <label for="avatar">上传图像</label>
                            </a>
                                <input type="hidden" name="id" value="${entityId}" id="id">
                                <input type="file" class="" name="avatar" id="avatar"/>
                            </div>
                            <input type="button" id="blobSubmit" class="Btnsty_success" value="保存">
                            <%--<input type="button" id="btnCrop" class="Btnsty_peyton" value="裁切">--%>
                            <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="放大">
                            <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="缩小">
                        </div>
                        <%--<div class="cropped"></div>--%>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctxStatic}/hplus/js/plugins/jquery/2.1.4/jquery.min.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/hplus/js/content.min.js?v=1.0.0"></script>
<script src="${ctxStatic}/hplus/js/plugins/cropbox/cropbox.js"></script>
<script src="${ctxStatic}/hplus/js/plugins/iCheck/icheck.min.js"></script>
<script src="${ctxStatic}/hplus/plugins/layer-v3.1.1/layer.js"></script>
<script src="${ctxStatic}/custom/dyfSama.js"></script>
<script type="text/javascript">
    $(function () {
        //网上摘的了,只学习了后台的代码
        console.info('${entityId}');
        var options =
            {
                thumbBox: '.thumbBox',
                spinner: '.spinner',
                imgSrc: ${empty entityId} ? '/img/profile.jpg' : "${ctx}/modules/userInfo/getAvatarById?id=${entityId}&t=" + Math.random()
            };
        var cropper = $('.imageBox').cropbox(options);
        $('#avatar').on('change', function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                options.imgSrc = e.target.result;
                cropper = $('.imageBox').cropbox(options);
            };
            reader.readAsDataURL(this.files[0]);
            this.files = [];
        });
        $('#blobSubmit').on('click', function () {
            var img = cropper.getBlob();
            var formdata = new FormData();
            formdata.append("imagefile", img);
            var id = $('#id').val();
            var parentIndex = parent.layer.getFrameIndex(window.name);
            $.ajax({
                url: "${ctx}/modules/userInfo/updateAvatar?id=" + id,
                data: formdata,
                type: "post",
                //默认值: true。默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
                // 都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.status === '0') {
                        parent.layer.close(parentIndex);//关闭弹出层
                        parent.$.modal.msg_success("头像更新成功!");//父页面提示信息
                        parent.$('.img-circle').attr("src", "${ctx}/modules/userInfo/getAvatarById?id=" + id + "&t=" + Math.random());
                    } else {
                        $.modal.msg_fail(data.message);
                    }
                },
                error: function () {
                    $.modal.msg_fail("系统错误!");
                }
            })
        });

        //裁剪生成三个不同大小头像
        $('#btnCrop').on('click', function () {
            var img = cropper.getDataURL();
            $('.cropped').html('');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
        });

        //放大
        $('#btnZoomIn').on('click', function () {
            cropper.zoomIn();
        });
        //缩小
        $('#btnZoomOut').on('click', function () {
            cropper.zoomOut();
        })
    });
</script>

</body>

</html>
