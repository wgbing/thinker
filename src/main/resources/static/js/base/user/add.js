$(function () {
    $('#roleSelect2').select2();
    createPermissionTree();
});

function listRole(orgId) {
    $.ajax({
        url:"/sys/role/select",
        type:"get",
        dataType:"json",
        contentType:"application/json",
        data:{
            orgId:orgId
        },
        success:function(data){
            $('#roleSelect2').select2({
                data: data,
                placeholder:'请选择',//默认文字提示
                language: "zh-CN",//汉化
                allowClear: true//允许清空
            });
        },
        error:function(data){

        }
    });
}

var permissionTree;
var setting = {
    view: {
        showLine: false
    },
    check: {
        enable: true
    },
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url: "xUrl"
        }
    },
    callback: {
        onClick: function (event,treeId,treeNode) {

        }
    }
};
function createPermissionTree() {
    $.ajax({
        url: "/sys/permission/tree",
        type: "GET",
        dataType: "json",
        success: function (data) {
            permissionTree = $.fn.zTree.init($("#permissionTree"), setting, data);
        },
        error: ajaxErrorHandler
    });
}