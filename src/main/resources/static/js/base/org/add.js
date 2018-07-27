/**
 * 新增-机构管理js
 */
$(function () {
    //开关组件初始化
    $('[name="status"]').bootstrapSwitch({
        onText:"正常",
        offText:"禁止",
        onColor:"success",
        offColor:"danger",
        size:"mini",
        onSwitchChange:function(event,state){
            if(state==true){
                $(this).val("1");
            }else{
                $(this).val("2");
            }
        }
    });

    //表单校验
    $("#addOrgForm").bootstrapValidator({
        message:'机构通用信息不能为空',
        fields:{
            name:{
                validators:{
                    notEmpty:{
                        message:'机构名称不能为空'
                    }
                }
            }
        }
    });
});

//取消
$('#btn_cancel').click(function () {
    dialogClose();
});
//确定
$('#btn_confirm').click(function () {
    if (!$('#form').Validform()) {
        return false;
    }
});