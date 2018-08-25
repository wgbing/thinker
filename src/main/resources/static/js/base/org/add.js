/**
 * 新增-机构管理js
 */

$(function () {
    //禁用下拉组件
    var parentId = $("#parentId").val();
    if(parentId == null || parentId == ""){
        $("#type").attr("disabled","disabled");
    }

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
function save() {
    if(!_form.valid()){
        return;
    }
    $("#type").removeAttr("disabled");
    $.ConfirmForm({
        url: "/sys/org/save",
        data: _form.serialize(),
        success: function (data) {
            if (data.success) {
                //关闭当前窗口
                dialogClose();
                //刷新当前树形表格
                $.currentIframe().refreshTree();
            } else {
                toastr.error(data.message, "提示信息");
            }
        }
    });
}