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
                query:{
                    "searchMap[orgId]" : treeNode.id
                }
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
        sortName:"id",//默认排序字段
        pagination : true,
        columns : [ {
            checkbox : true
        },{
            field : "name",
            title : "角色名称",
            width : "50px"
        },{
            field : "description",
            title : "角色描述",
            width : "100px"
        },{
            field : "orgName",
            title : "所属机构",
            width : "150px"
        },{
            field : "updateTime",
            title : "更新时间",
            width : "100px",
            sortable: true
        },{
            field : "remark",
            title : "备注"
        } ]
    })
}

//刷新
function refreshTable() {
    var nodes = orgTree.getSelectedNodes();
    if(nodes == null || nodes.length <= 0){
        $('#dataGrid').bootstrapTable('refresh');
    }else if(nodes.length >= 1){
        var params = {
            query:{
                "searchMap[orgId]" : nodes[0].id
            }
        };
        $('#dataGrid').bootstrapTable('refresh',params);
    }
}

//新增角色
function addRole() {
    var nodes = orgTree.getSelectedNodes();
    if(nodes == null || nodes.length <= 0){
        toastr.warning("请先选择组织机构","提示信息");
        return;
    }else if(nodes.length > 1){
        toastr.warning("组织机构只能选择一个","提示信息");
        return;
    }

    parent.layer.open({
        type: 2,
        title: '新增角色',
        shadeClose: false,//点击弹层外区域关闭
        shade: 0.1,
        maxmin: true, //开启最大化最小化按钮
        area: ['420px', '350px'],
        content: '/sys/role/add',
        btn: ['确定', '取消'],
        success: function(layero, index){
            var addRoleWin = top[layero.find('iframe')[0]['name']];
            addRoleWin.$("#orgId").val(nodes[0].id);
            addRoleWin.$("#orgName").val(nodes[0].orgName);
        },
        yes: function (index,layero) {
            var addRoleWin = top[layero.find('iframe')[0]['name']];
            addRoleWin.save();
        }
    });
}

//编辑角色
function editRole() {
    var ck = $('#dataGrid').bootstrapTable('getSelections');
    if(checkedRow(ck)){
        parent.layer.open({
            type: 2,
            title: '编辑角色',
            shadeClose: false,//点击弹层外区域关闭
            shade: 0.1,
            maxmin: true, //开启最大化最小化按钮
            area: ['420px', '350px'],
            content: '/sys/role/edit?roleId='+ck[0].id,
            btn: ['确定', '取消'],
            yes: function (index,layero) {
                var editRoleWin = top[layero.find('iframe')[0]['name']];
                editRoleWin.save();
            }
        });
    }
}

function deleteRole() {
    var ck = $('#dataGrid').bootstrapTable('getSelections');
    var roleIds = [];
    if(checkedArray(ck)){
        $.each(ck, function(idx, item) {
            roleIds[idx] = item.id;
        });
        console.log("roleIds:",roleIds);
        bootboxConfirm("确定要删除所选角色吗？", function(result) {
            if (result) {
                $.ajax({
                    url: "/sys/role/delete",
                    data:{
                        roleId:roleIds
                    },
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            refreshTable();
                        } else {
                            toastr.error(data.message, "提示信息");
                        }
                    },
                    error: ajaxErrorHandler
                });
            }
        });
    }
}