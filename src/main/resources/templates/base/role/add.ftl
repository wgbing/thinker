<!DOCTYPE html>
<html>
<head>
    <title>角色管理 | 新增角色</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <form method="post" id="addRoleForm">
        <#if _csrf?? && _csrf.parameterName??>
        <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
        </#if>
        <table class="form">
            <tr>
                <td class="formTitle"><span style="color:red">*&nbsp;</span>角色名称</td>
                <td class="formValue">
                    <input name="name" type="text" class="form-control" placeholder="角色名称">
                </td>
            </tr>
            <tr>
                <td class="formTitle"><span style="color:red;">*&nbsp;</span>角色描述</td>
                <td class="formValue">
                    <input name="description" type="text" class="form-control" placeholder="角色描述">
                </td>
            </tr>
            <tr>
                <td class="formTitle"><span style="color:red">*&nbsp;</span>所属机构</td>
                <td class="formValue">
                    <input id="orgId" name="orgId" type="hidden">
                    <input id="orgName" name="orgName" type="text" class="form-control pointer" placeholder="所属机构" readonly="readonly">
                </td>
            </tr>
            <tr>
                <td class="formTitle formTitle-top">备注</td>
                <td class="formValue">
                    <textarea name="remark" class="form-control" rows="3" placeholder="备注"></textarea>
                </td>
            </tr>
        </table>
    </form>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/role/add.js"></script>
</body>
</html>
