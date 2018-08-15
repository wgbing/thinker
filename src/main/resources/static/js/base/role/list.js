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
    $("#orgTreePanel").css('height',$(window).height()-80);
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
            createOrgTree(treeNode.parentId);
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
        height : $(window).height() - 80,
        // queryParams : function(params) {
        //     params.name = vm.keyword;
        //     params.parentCode = vm.parentCode;
        //     return params;
        // },
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

//查询
function showSearch() {
    if($("#searchForm").is(':visible')){
        $("#searchForm").hide();
        $("#btn_search").html($("#btn_search").html().replace("隐藏","查询"));
    }else {
        $("#searchForm").show();
        $("#btn_search").html($("#btn_search").html().replace("查询","隐藏"));
    }
}