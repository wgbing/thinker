<!DOCTYPE html>
<html>
<head>
    <title>系统管理 | 用户管理</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 no-padding">
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-sitemap" style="font-size: 17px">&nbsp;组织机构</i></div>
                <div class="panel-body" id="orgTreePanel" style="overflow: hidden">
                    <ul id="orgTree" class="ztree"></ul>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-street-view" style="font-size: 17px">&nbsp;用户管理</i></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-5 form-inline pull-left">
                            <div class="form-group">
                                <input class="form-control" placeholder="请输入查询关键字" style="width: 220px;" />
                            </div>
                            <div class="form-group">
                                <a class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;查询</a>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="btn-toolbar pull-right">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-default" id="btn_refreshTable" title="刷新" onclick="refreshTable()"><i class="fa fa-refresh"></i> 刷新</a>
                                    <a href="#" class="btn btn-default" id="btn_addUser" title="新增" onclick="addUser()"><i class="fa fa-plus"></i> 新增</a>
                                    <a href="#" class="btn btn-default" id="btn_editUser" title="编辑" onclick="editUser()"><i class="fa fa-pencil-square-o"></i> 编辑</a>
                                    <a href="#" class="btn btn-default" id="btn_deleteUser" title="删除" onclick="deleteUser()"><i class="fa fa-trash-o"></i> 删除</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <table id="dataGrid"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/user/list.js"></script>
</body>
</html>
