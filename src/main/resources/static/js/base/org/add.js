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
            // if(state==true){
            //     $(this).val("1");
            // }else{
            //     $(this).val("2");
            // }
        }
    });
    //表单校验
    $.validator.setDefaults({
        debug: true
    });
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
            },
            remark: {
                required: true,
                maxlength: 200
            },
            sortNo: "required"
        },
        messages: {
            orgName: {
                required: "请输入机构名称",
                maxlength: "机构名称不能超过200个字符"
            },
            shortName: {
                required: "请输入机构简称",
                maxlength: "机构简称不能超过200个字符"
            },
            remark: {
                required: "请输入机构备注",
                maxlength: "机构备注不能超过200个字符"
            },
            sortNo: "请输入排序号"
        }
    });
    //确定
    $('#btn_confirm').click(function () {
        if(!_form.valid()){
            return;
        }
        bootboxConfirm("确认要提交吗？", function(result) {
            if (result) {
                console.log("新增机构！");
                var formData = _form.serialize();
                console.log(formData);
                var loading = dialogLoading(true);
                $.ajax({
                    url: "/sys/org/save",
                    data: formData,
                    type: "POST",
                    dataType: "json",
                    complete: function (xhr) {
                        dialogLoading(false);
                    },
                    success: function (data) {
                        if (data.code === 0) {
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

