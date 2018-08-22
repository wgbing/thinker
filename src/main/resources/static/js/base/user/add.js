$(function () {
    initPage();
});

function initPage() {
    $('#roleSelect2').select2({
        ajax: {
            url: "/sys/role/select",        //请求地址
            type: "get",      //请求方式
            dataType: "json",
            data:{
                orgId:2
            },
            formatSelection: function(item){
                console.log("item",item.data);
                return item.data.name;   //显示选择对象属性name
            },
            formatResult: function(item){
                return item.data.name;   //下拉时显示name属性
            }
        }
    });
}