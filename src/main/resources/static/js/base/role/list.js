/**
 * TODO: 角色管理JS
 * @author wgbing
 * @date 2018/8/3 23:29
 */
$(function () {
    addNavTitle("系统管理","角色管理");
    initialPage();
    createOrgTree();
});
function initialPage() {
    $("#orgTreePanel").css('height',$(window).height()-84);
}
var setting = {
    // async: {
    //     enable: true,
    //     type: "get",
    //     url: "/sys/org/tree",
    //     autoParam: ["orgId"]
    // },
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
