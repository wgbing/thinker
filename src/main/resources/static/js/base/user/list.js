/**
 * TODO: 用户管理JS
 * @author wgbing
 * @date 2018/8/3 23:29
 */
$(function () {
    addNavTitle("系统管理","用户管理");
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

var orgTree;
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
        url : "/sys/user/list",
        method : "get",
        height : $(window).height() - 108,
        sortName:"id",//默认排序字段
        pagination : true,
        columns : [ {
            checkbox : true
        },{
            field : "name",
            title : "用户姓名",
            width : "50px"
        },{
            field : "loginName",
            title : "登录名",
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

//新增
function addUser() {
    parent.layer.open({
        type: 2,
        title: '新增用户',
        shadeClose: false,//点击弹层外区域关闭
        shade: 0.1,
        maxmin: true, //开启最大化最小化按钮
        area: ['420px', '650px'],
        content: '/sys/user/add',
        btn: ['确定', '取消'],
        yes: function (index,layero) {
            var addUserWin = top[layero.find('iframe')[0]['name']];
            addUserWin.save();
        }
    });
}