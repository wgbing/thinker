<!DOCTYPE html>
<html>
<head>
    <title>组织管理 | 新增机构</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="content-wrapper">
    <section class="container-fluid">
        <form action="" method="post" id="addOrgForm">
            <table class="form">
                <tr>
                    <td class="formTitle"><span style="color:red">*&nbsp;</span>机构名称</td>
                    <td class="formValue">
                        <input name="name" type="text" class="form-control" placeholder="机构名称" isvalid="yes" checkexpession="NotNull">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle"><span style="color:red;">*&nbsp;</span>机构简称</td>
                    <td class="formValue">
                        <input type="text" class="form-control" placeholder="机构简称">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">备注信息</td>
                    <td class="formValue">
                        <input type="text" class="form-control" placeholder="备注信息">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">排序号</td>
                    <td class="formValue">
                        <input type="text" class="form-control" placeholder="排序号">
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">状态</td>
                    <td class="formValue">
                        <input name="status" type="checkbox" checked />
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
