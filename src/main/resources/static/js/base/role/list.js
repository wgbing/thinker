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
    $("#dataGrid").bootstrapTable('refresh');
}

//新增角色
function addRole() {
    parent.layer.open({
        type: 2,
        title: '新增角色',
        shadeClose: false,//点击弹层外区域关闭
        shade: 0.1,
        maxmin: true, //开启最大化最小化按钮
        area: ['420px', '350px'],
        content: '/sys/role/add',
        btn: ['确定', '取消'],
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
