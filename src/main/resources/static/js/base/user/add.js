$(function () {
    initPage();
});

var roleList = [];
$.ajax({
    url:"/sys/role/select",
    type:"get",
    dataType:"json",
    contentType:"application/json",
    data:{
      orgId:2
    },
    success:function(data){
        console.log("data:",data);
        roleList = data;
    },
    error:function(data){

    }
});

function initPage() {
    $('#roleSelect2').select2({
        data: roleList,
        placeholder:'请选择',//默认文字提示
        language: "zh-CN",//汉化
        allowClear: true//允许清空
    });
}