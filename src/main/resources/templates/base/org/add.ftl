<!DOCTYPE html>
<html>
<head>
    <title>组织管理 | 新增机构</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="content-wrapper">
    <section class="container-fluid">
        <form action="/sys/org/save" method="post" id="addOrgForm" name="addOrgForm">
            <#if _csrf?? && _csrf.parameterName??>
            <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
            </#if>
            <table class="form">
                <tr>
                    <td class="formTitle"><span style="color:red">*&nbsp;</span>机构名称</td>
                    <td class="formValue">
                        <input id="orgName" name="orgName" type="text" class="form-control" placeholder="机构名称" value="">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle"><span style="color:red;">*&nbsp;</span>机构简称</td>
                    <td class="formValue">
                        <input id="shortName" name="shortName" type="text" class="form-control" placeholder="机构简称" value="">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">备注信息</td>
                    <td class="formValue">
                        <input id="remark" name="remark" type="text" class="form-control" placeholder="备注信息" value="">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">排序号</td>
                    <td class="formValue">
                        <input id="sortNo" name="sortNo" type="text" class="form-control" placeholder="排序号" value="">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">状态</td>
                    <td class="formValue">
                        <input id="enable" name="enable" type="checkbox" checked />
                    </td>
                </tr>
            </table>
        </form>
    </section>

    <section class="content-footer">
        <button type="button" id="btn_cancel" class="btn btn-default pull-right">取消</button>
        <button type="button" id="btn_confirm" class="btn btn-info pull-right">确定</button>
        <script>document.getElementsByTagName("body")[0].setAttribute("style", "padding-bottom: 54px !important")</script>
    </section>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/org/add.js"></script>
</body>
</html>
