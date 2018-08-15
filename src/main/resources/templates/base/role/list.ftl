<!DOCTYPE html>
<html>
<head>
    <title>系统管理 | 角色管理</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 no-padding">
            <div class="box no-border">
                <div class="box-header">
                    <div class="title"><i class="fa fa-sitemap" style="font-size: 17px">&nbsp;组织机构</i></div>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool"><i class="fa fa-edit"></i></button>
                        <button class="btn btn-box-tool"><i class="fa fa-chevron-down"></i></button>
                        <button class="btn btn-box-tool"><i class="fa fa-refresh"></i></button>
                    </div>
                </div>
                <div class="box-body" id="orgTreePanel">
                    <ul id="orgTree" class="ztree"></ul>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <div class="box no-border">
                <div class="box-header">
                    <div class="title"><i class="fa fa-street-view" style="font-size: 17px">&nbsp;角色管理</i></div>
                    <div class="box-tools pull-right">
                        <div class="btn-group">
                            <a href="#" class="btn btn-default" id="btn_refreshTable" title="刷新" onclick="refreshTable()"><i class="fa fa-refresh"></i> 刷新</a>
                            <a href="#" class="btn btn-default" id="btn_addRole" title="新增" onclick="addRole()"><i class="fa fa-plus"></i> 新增</a>
                            <a href="#" class="btn btn-default" id="btn_editRole" title="编辑" onclick="editRole()"><i class="fa fa-pencil-square-o"></i> 编辑</a>
                            <a href="#" class="btn btn-default" id="btn_deleteRole" title="删除" onclick="deleteRole()"><i class="fa fa-trash-o"></i> 删除</a>
                        </div>
                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <table id="dataGrid"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/role/list.js"></script>
</body>
</html>
