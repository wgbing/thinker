<!DOCTYPE html>
<html>
<head>
    <title>组织管理 | 编辑机构</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <form method="post" id="addOrgForm">
        <#if _csrf?? && _csrf.parameterName??>
        <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
        </#if>
        <input type="hidden" id="parentId" name="parentId" value="${parentId?default('')}"/>
        <table class="form">
            <tr>
                <td class="formTitle"><span style="color:red">*&nbsp;</span>机构名称</td>
                <td class="formValue">
                    <input name="orgName" type="text" class="form-control" placeholder="机构名称" value="${(org.orgName)!''}">
                </td>
            </tr>
            <tr>
                <td class="formTitle"><span style="color:red;">*&nbsp;</span>机构简称</td>
                <td class="formValue">
                    <input name="shortName" type="text" class="form-control" placeholder="机构简称" value="${(org.shortName)!''}">
                </td>
            </tr>
            <tr>
                <td class="formTitle"><span style="color:red;">*&nbsp;</span>机构类型</td>
                <td class="formValue">
                    <select id="type" name="type" class="form-control">
                        <option value="1" selected>一级组织</option>
                        <option value="2">二级组织</option>
                        <option value="3">三级组织</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="formTitle">备注信息</td>
                <td class="formValue">
                    <input name="remark" type="text" class="form-control" placeholder="备注信息" value="${(org.remark)!''}">
                </td>
            </tr>
            <tr>
                <td class="formTitle">排序号</td>
                <td class="formValue">
                    <div class="input-group spinner" data-trigger="spinner">
                        <input name="sortNo" type="text" class="form-control text-center" value="1" data-rule="quantity">
                        <span class="input-group-addon">
                            <a href="javascript:void(0);" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
                            <a href="javascript:void(0);" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="formTitle">状态</td>
                <td class="formValue">
                    <input name="enable" type="checkbox" value="true" checked/>
                </td>
            </tr>
        </table>
    </form>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/org/edit.js"></script>
</body>
</html>
