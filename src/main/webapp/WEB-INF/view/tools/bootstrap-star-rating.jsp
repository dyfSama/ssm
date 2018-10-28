<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>

    <%@include file="/WEB-INF/view/include/head.jsp" %>
</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <%-- 引入refresh html --%>
    <jsp:include page="/WEB-INF/view/include/refresh.jsp"/>
    <div class="row">
        <div class="col-sm-12">
            <div class=" ibox float-e-margins">
                <div class="ibox-content">
                    <form>
                        <input id="input-21b" value="4" type="text" class="rating" data-min=0 data-max=5 data-step=0.2
                               data-size="lg"
                               required title="">
                        <div class="clearfix"></div>
                        <hr>
                        <input required id="input-21c" value="" type="text" title="">
                        <div class="clearfix"></div>
                        <hr>
                        <input id="input-21d" value="2" type="text" class="rating" data-min=0 data-max=5 data-step=0.5
                               data-size="sm"
                               title="">
                        <hr>
                        <input id="input-21e" value="0" type="text" class="rating" data-min=0 data-max=5 data-step=0.5
                               data-size="xs"
                               title="">
                        <hr>
                        <input id="input-21f" value="0" type="text" data-min=0 data-max=5 data-step=0.1 data-size="md"
                               title="">
                        <hr>
                        <input id="input-2ba" type="text" class="rating" data-min="0" data-max="5" data-step="0.5"
                               data-stars=5
                               data-symbol="&#xe005;" data-default-caption="{rating} hearts" data-star-captions="{}"
                               title="">
                        <hr>
                        <input id="input-22" value="0" type="text" class="rating" data-min=0 data-max=5 data-step=0.5
                               data-rtl=1
                               data-container-class='text-right' data-glyphicon=0 title="">
                        <div class="clearfix"></div>
                        <hr>
                        <input required class="rb-rating" type="text" value="" title="">
                        <hr>
                        <input id="rating-input" type="text" title=""/>
                        <button id="btn-rating-input" type="button" class="btn btn-primary">Toggle Disable</button>
                        <hr>
                        <input id="kartik" class="rating" data-stars="5" data-step="0.1" title=""/>
                        <div class="form-group" style="margin-top:10px">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                            <button type="button" class="btn btn-danger">Destroy</button>
                            <button type="button" class="btn btn-success">Create</button>
                        </div>
                        <input type="checkbox" checked/>

                    </form>
                    <div>
                        <div class="modal fade" id="myModalNext">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title">选项配置</h4>
                                        <ul class="nav nav-pills nav-justified step step-progress">
                                            <li class="active">
                                                <a>步骤一<span class="caret"></span></a>
                                            </li>
                                            <li>
                                                <a>步骤二<span class="caret"></span></a>
                                            </li>
                                            <li>
                                                <a>步骤三<span class="caret"></span></a>
                                            </li>
                                            <li>
                                                <a>步骤四<span class="caret"></span></a>
                                            </li>
                                            <li>
                                                <a>步骤五<span class="caret"></span></a>
                                            </li>
                                            <li>
                                                <a>步骤六<span class="caret"></span></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="carousel slide" data-ride="carousel" data-interval="false"
                                                 data-wrap="false">
                                                <div class="carousel-inner" role="listbox">
                                                    <div class="item active">
                                                        <p>步骤一</p>
                                                        <div class="col-xs-2">
                                                            配置角色
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <input type="text" class="form-control"/>
                                                        </div>
                                                        <div class=" col-xs-4">
                                                            <button type="button" class=" btn btn-primary">保存</button>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <p>步骤二</p>
                                                        <div class="col-xs-2">
                                                            配置用户
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <input type="text" class="form-control"/>
                                                        </div>
                                                        <div class=" col-xs-4">
                                                            <button type="button" class=" btn btn-primary">保存</button>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <p>步骤三</p>
                                                    </div>
                                                    <div class="item">
                                                        <p>步骤四</p>
                                                    </div>
                                                    <div class="item">
                                                        <p>步骤五</p>
                                                    </div>
                                                    <div class="item">
                                                        <p>步骤六</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default MN-pre">上一步</button>
                                        <button type="button" class="btn btn-primary MN-next">下一步</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(function () {
        /**
         *size：开关大小。可选值有'mini', 'small', 'normal', 'large'
         onColor：开关中开按钮的颜色。可选值有'primary', 'info', 'success', 'warning', 'danger', 'default'
         offColor：开关中关按钮的颜色。可选值'primary', 'info', 'success', 'warning', 'danger', 'default'
         onText：开关中开按钮的文本，默认是“ON”。
         offText：开关中关按钮的文本，默认是“OFF”。
         onInit：初始化组件的事件。
         onSwitchChange：开关变化时的事件。
         */
        $('input[type=checkbox]').bootstrapSwitch({size: "mini", onColor: 'success', onText: "启用", offText: "停用"});

        $("#input-21f").rating({
            starCaptions: function (val) {
                if (val < 3) {
                    return val;
                } else {
                    return 'high';
                }
            },
            starCaptionClasses: function (val) {
                if (val < 3) {
                    return 'label label-danger';
                } else {
                    return 'label label-success';
                }
            },
            hoverOnClear: false
        });
        var $inp = $('#rating-input');

        $inp.rating({
            min: 0,
            max: 5,
            step: 1,
            size: 'lg',
            showClear: false
        });

        $('#btn-rating-input').on('click', function () {
            $inp.rating('refresh', {
                showClear: true,
                disabled: !$inp.attr('disabled')
            });
        });


        $('.btn-danger').on('click', function () {
            $("#kartik").rating('destroy');
        });

        $('.btn-success').on('click', function () {
            $("#kartik").rating('create');
        });

        $inp.on('rating.change', function () {
            alert($('#rating-input').val());
        });


        $('.rb-rating').rating({
            'showCaption': true,
            'stars': '3',
            'min': '0',
            'max': '3',
            'step': '1',
            'size': 'xs',
            'starCaptions': {0: 'status:nix', 1: 'status:wackelt', 2: 'status:geht', 3: 'status:laeuft'}
        });
        $("#input-21c").rating({
            min: 0, max: 8, step: 0.5, size: "xl", stars: "8"
        });

    });
</script>
</body>

</html>
