<!DOCTYPE html>
<html>
<head>
    <title>角色管理 | 新增用户</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#userTab" data-toggle="tab">基本信息</a></li>
            <li><a href="#permissionTab" data-toggle="tab">权限</a></li>
        </ul>
        <div class="tab-content">
            <div class="active tab-pane" id="userTab">
                <form method="post" id="addUserForm">
                    <#if _csrf?? && _csrf.parameterName??>
                    <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
                    </#if>
                    <table class="form">
                        <tr>
                            <td class="formTitle"><span style="color:red">*&nbsp;</span>登录名</td>
                            <td class="formValue">
                                <input name="loginName" type="text" class="form-control" placeholder="登录名">
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"><span style="color:red;">*&nbsp;</span>姓名</td>
                            <td class="formValue">
                                <input name="realName" type="text" class="form-control" placeholder="姓名">
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"><span style="color:red;">*&nbsp;</span>密码</td>
                            <td class="formValue">
                                <input name="password" type="text" class="form-control" placeholder="密码" value="123456">
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
                            <td class="formTitle"><span style="color:red">*&nbsp;</span>拥有角色</td>
                            <td class="formValue">
                                <select id="roleSelect2" class="form-control" multiple="multiple" data-placeholder="选择角色" style="width: 100%">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"><span style="color:red;">*&nbsp;</span>手机号</td>
                            <td class="formValue">
                                <input name="mobile" type="text" class="form-control" placeholder="手机号">
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"><span style="color:red;">*&nbsp;</span>邮箱</td>
                            <td class="formValue">
                                <input name="email" type="text" class="form-control" placeholder="邮箱">
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
                            <td class="formTitle formTitle-top">备注</td>
                            <td class="formValue">
                                <textarea name="remark" class="form-control" rows="3" placeholder="备注"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="tab-pane" id="permissionTab">

            </div>
        </div>
    </div>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/user/add.js"></script>
</body>
</html>
