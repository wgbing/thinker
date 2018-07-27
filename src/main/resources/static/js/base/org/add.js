/**
 * 新增-机构管理js
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
// $(function () {
//     //表单校验
//     $("#addOrg_form").bootstrapValidator({
//         message:'机构通用信息不能为空',
//         fields:{
//             orgName:{
//                 validators:{
//                     notEmpty:{
//                         message:'机构名称不能为空'
//                     }
//                 }
//             }
//         }
//     });
// });

function formValidator(){
    var from = $("#addOrg_form");
    console.log(form);
}

//取消
$('#btn_cancel').click(function () {
    dialogClose();
});
//确定
$('#btn_confirm').click(function () {
    formValidator();
});