<!DOCTYPE html>
<html>
<head>
    <title>角色管理 | 树形机构</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <ul id="orgTree" class="ztree"></ul>
</div>

<#include "../../include/footer_js.ftl">
<script type="text/javascript">
    $(function () {
       createOrgTree();
    });
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
</script>
</body>
</html>
