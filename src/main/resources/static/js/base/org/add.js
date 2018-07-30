/**
 * 新增-机构管理js
 */

$(function () {
    //开关组件初始化
    $('[name="enable"]').bootstrapSwitch({
        onText:"正常",
        offText:"禁止",
        onColor:"success",
        offColor:"danger",
        size:"mini",
        onSwitchChange:function(event,state){
            if(state==true){
                $(this).val("true");
            }else{
                $(this).val("false");
                $(this).prop("checked",true);
            }
        }
    });
    //表单校验
    var _form = $("#addOrgForm");
    _form.validate({
        rules: {
            orgName: {
                required: true,
                maxlength: 200
            },
            shortName: {
                required: true,
                maxlength: 200
            }
        },
        messages: {
            orgName: {
                required: "请输入机构名称",
                maxlength: "机构名称不能超过200个字符"
            },
            shortName: {
                required: "请输入机构简称",
                maxlength: "机构简称不能超过200个字符"
            }
        }
    });
    //确定
    $('#btn_confirm').click(function () {
        if(!_form.valid()){
            return;
        }
        bootboxConfirm("确认要提交吗？", function(result) {
            if (result) {
                $.ajax({
                    url: "/sys/org/save",
                    data: _form.serialize(),
                    type: "POST",
                    dataType: "json",
                    beforeSend : function() {
                        dialogLoading(true);
                    },
                    complete: function (xhr) {
                        dialogLoading(false);
                    },
                    success: function (data) {
                        if (data.success) {
                            // 调用父窗口方法完成操作
                            parent.operationCompleted(data);
                        } else {
                            toastr.error(data.message, "提示信息");
                        }
                    },
                    error: ajaxErrorHandler
                });
            }
        });
    });
    //取消
    $('#btn_cancel').click(function () {
        dialogClose();
    });
});

