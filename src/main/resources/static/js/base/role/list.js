/**
 * TODO: 角色管理JS
 * @author wgbing
 * @date 2018/8/3 23:29
 */
$(function () {
    addNavTitle("系统管理","角色管理");
    initialPage();
    createOrgTree();
    getGrid();
});
function initialPage() {
    $("#orgTreePanel").css('height', $(window).height()-54);
    $(window).resize(function() {
        $("#orgTreePanel").css('height', $(window).height()-54);
        $('#dataGrid').bootstrapTable('resetView', {
            height : $(window).height() - 108
        });
    });
}
var setting = {
    view: {
        showLine: false
    },
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: null
        },
        key: {
            name:"orgName",
            url: "xUrl"
        }
    },
    callback: {
        onClick: function (event,treeId,treeNode) {
            var params = {
                orgId : treeNode.id
            };
            $('#dataGrid').bootstrapTable('refresh',params);
        }
    }
};
var orgTree;
function createOrgTree(parentId) {
    $.ajax({
        url: "/sys/org/tree",
        data:{
            orgId:parentId
        },
        type: "GET",
        dataType: "json",
        success: function (data) {
            orgTree = $.fn.zTree.init($("#orgTree"), setting, data);
        },
        error: ajaxErrorHandler
    });
}

function getGrid() {
    $('#dataGrid').bootstrapTableEx({
        url : "/sys/role/list",
        method : "get",
        height : $(window).height() - 108,
        queryParams : function(params) {
            var temp ={
                "paramMap[orgId]" : params?null:params.orgId
            };
            return temp;
        },
        pagination : true,
        columns : [ {
            checkbox : true
        }, {
            field : "name",
            title : "角色名称",
            width : "50px"
        }, {
            field : "description",
            title : "角色描述",
            width : "100px"
        }, {
            field : "updateTime",
            title : "更新时间",
            width : "100px",
            sortable: true
        },{
            field : "createTime",
            title : "创建时间"
        } ]
    })
}
