<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 网站用户 iframe 框</title>
    <meta name="renderer" content="webkit">
    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>
<body>
<form class="layui-form" lay-filter="formFilter" id="formId"
      style="padding: 20px 0 0 0;">
    <input type="hidden" name="id">
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-inline">
            <input type="text" name="roleName" placeholder="请输入角色名称" autocomplete="off" class="layui-input"
                   lay-verify="require" lay-verType="tips">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">权限标识</label>
        <div class="layui-input-inline">
            <input type="text" name="roleKey" placeholder="请输入权限标识" autocomplete="off" class="layui-input"
                   lay-verify="required">
        </div>
    </div>

    <%--<div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-inline">
            <input type="text" name="mobile" placeholder="请输入手机号码" autocomplete="off" class="layui-input"
                   lay-verify="phone" lay-verType="tips">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input"
                   lay-verify="email">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生日</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday" id="birthday" placeholder="生日" autocomplete="off" class="layui-input"
                   lay-verify="require">
        </div>
    </div>
&lt;%&ndash;    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input"
                   lay-verify="required">
        </div>
    </div>&ndash;%&gt;

    &lt;%&ndash;<div class="layui-form-item">&ndash;%&gt;
        &lt;%&ndash;<label class="layui-form-label">状态</label>&ndash;%&gt;
        &lt;%&ndash;<div class="layui-input-inline">&ndash;%&gt;
            &lt;%&ndash;<input type="checkbox" name="status" lay-skin="switch" lay-text="启用|停用" checked value="0"&ndash;%&gt;
                   &lt;%&ndash;lay-filter="status">&ndash;%&gt;
        &lt;%&ndash;</div>&ndash;%&gt;
    &lt;%&ndash;</div>&ndash;%&gt;
     <div class="layui-form-item">
         <label class="layui-form-label">头像</label>
         <input type="hidden" name="avatar" id="avatar">
         <div class="layui-upload">
             <button type="button" class="layui-btn"  id="avatarUpload" >
                 <i class="layui-icon">&#xe67c;</i> 上传头像
             </button>
             <img class="layui-upload-img" id="demo1"  style="width: 40px">
             <div class="layui-upload-list">
                 <p id="demoText"></p>
             </div>
         </div>
     </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="radio" name="gender" value="1" title="男" lay-filter="sex">
            <input type="radio" name="gender" value="0" title="女" checked lay-filter="sex">
        </div>
    </div>--%>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remarks" placeholder="请输入内容" class="layui-textarea" style="width: 400px"></textarea>
        </div>
    </div>

    <%--<div class="layui-form-item">
         <label class="layui-form-label">头像</label>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">上传图片</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
     </div>--%>
    <div class="layui-form-item">
        <div class="layui-input-block ">
            <button class="layui-btn" lay-submit id="submitId" lay-filter="add">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    };


    var editData;

    function child(data) {
        editData = data;
    }






    layui.config({
        base: '${ctxStatic}/layuiadmin/dist/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'upload','laydate'], function () {
        var $ = layui.$;
        var form = layui.form;
        var upload = layui.upload;
        var laydate = layui.laydate;
        //
        // //日期框渲染
        // laydate.render({
        //     elem: '#birthday',
        //     type: "date"
        // });



        //编辑时赋值
        if (editData != undefined && editData != null) {
            form.val('formFilter', {
                id: editData.id,
                roleName: editData.roleName,
                roleKey : editData.roleKey,
                remarks: editData.remarks
                // avatar: editData.avatar,
                // email: editData.email,
                // gender: editData.gender,
                // mobile: editData.mobile,
                // birthday: editData.birthday,
                // realName: editData.realName
            });

        }
        //监听提交事件
        form.on('submit(add)', function (data) {
            var field = data.field; //获取提交的字段
            $.ajax({
                url: "${ctx}/role/save",
                type: "post",
                dataType: "json",
                data: field,
                beforeSend: function () {
                    layer.load();
                },
                success: function (data) {
                    if (data.status === "0") {
                        layer.msg(data.message, {icon: 6, time: 500}, function () {
                            parent.layer.close(parent.layer.getFrameIndex(window.name));
                        });
                    } else {
                        layer.msg(data.message, {icon: 2, time: 2000, anim: 6});
                    }
                }
            });
            return false;
        });


       /* upload.render({
            elem: '#layuiadmin-upload-useradmin'
            , url: layui.setter.base + 'json/upload/demo.js'
            , accept: 'images'
            , method: 'get'
            , acceptMime: 'image/!*'
            , done: function (res) {
                $(this.item).prev("div").children("input").val(res.data.src)
            }
        });*/
        var uploadInst = upload.render({
            elem: '#avatarUpload',
            url: '/user/uploadAvatar',
            before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            },
            done: function(res){
                console.info(res);
                if(res.status === '0'){
                    $("#avatar").val(res.message);
                    return layer.msg('上传成功!');
                }else{
                    return layer.msg('上传失败!');

                }

            }/*,
            error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }*/
        });
    })
</script>
</body>
</html>