/**
 * 编辑-机构管理js
 */
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

//取消
$('#btn_cancel').click(function () {
    dialogClose();
});

