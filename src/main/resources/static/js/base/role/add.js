/**
 * TODO: 新增-角色管理JS
 * @author wgbing
 * @date 2018/8/17 23:29
 */
//选择所属机构
function selectOrg() {
    parent.layer.open({
        type: 2,
        title: '所属机构',
        shadeClose: false,//点击弹层外区域关闭
        shade: 0.1,
        maxmin: true, //开启最大化最小化按钮
        area: ['200px', '400px'],
        content: '/sys/role/orgTree',
        btn: ['确定', '取消'],
        yes: function(index, layero){
            var orgTreeWin = top[layero.find('iframe')[0]['name']];
            var node = orgTreeWin["orgTree"].getSelectedNodes();
            if(node.length <= 0){
                return;
            }
            $("#orgId").attr("value",node[0].id);
            $("#orgName").attr("value",node[0].orgName);
            parent.layer.close(index)
        }

    });
}
//表单校验
var _form = $("#addRoleForm");
_form.validate({
    rules: {
        name: {
            required: true,
            maxlength: 200
        },
        description: {
            required: true,
            maxlength: 200
        },
        orgName: {
            required: true
        }
    },
    messages: {
        name: {
            required: "请输入角色名称",
            maxlength: "角色名称不能超过200个字符"
        },
        description: {
            required: "请输入角色描述",
            maxlength: "角色描述不能超过200个字符"
        },
        orgName: {
            required: "请选择所属机构"
        }
    }
});
//确定
function save() {
    if(!_form.valid()){
        return;
    }

    $.ConfirmForm({
        url: "/sys/role/save",
        data: _form.serialize(),
        success: function(data) {
            if (data.success) {
                //关闭当前窗口
                dialogClose();
                //刷新当前表格
                $.currentIframe().refreshTable();
            } else {
                toastr.error(data.message, "提示信息");
            }
        }
    });
}