<!DOCTYPE html>
<html>
<head>
    <title>系统管理 | 组织管理</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div>
    <#--<div class="row">-->
        <#--<div class="col-xs-12">-->
            <#--<div class="box box-main">-->
                <#--<div class="box-header">-->
                    <#--<div class="box-title hidden-xs">-->
                        <#--<i class="fa icon-grid"></i> 组织管理-->
                    <#--</div>-->
                    <#--<div class="box-tools pull-right">-->
                        <#--<a href="#" class="btn btn-default" id="btn_search" title="查询" onclick="showSearch()"><i class="fa fa-filter"></i> 查询</a>-->
                        <#--<a href="#" class="btn btn-default" id="btn_refreshTree" title="刷新" onclick="refreshTree()"><i class="fa fa-refresh"></i> 刷新</a>-->
                        <#--<a href="#" class="btn btn-default" id="btn_expandTreeNode" title="展开" onclick="expandTreeNode()"><i class="fa fa-angle-double-down"></i> 展开</a>-->
                        <#--<a href="#" class="btn btn-default" id="btn_collapseTreeNode" title="折叠全部" onclick="collapseTreeNode()"><i class="fa fa-angle-double-up"></i> 折叠</a>-->
                        <#--<a href="#" class="btn btn-default" id="btn_addOrg" title="新增机构" onclick="addRootOrg()"><i class="fa fa-plus"></i> 新增</a>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<!-- /.box-header &ndash;&gt;-->

                <#--<div class="box-body">-->
                    <#--<!-- searchForm &ndash;&gt;-->
                    <#--<form id="searchForm" name="searchForm" class="form-horizontal" hidden>-->
                        <#--<div class="row">-->
                            <#--<div class="col-xs-3">-->
                                <#--<div class="form-group">-->
                                    <#--<label class="control-label col-sm-4" title="">-->
                                        <#--<span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>-->
                                    <#--<div class="col-sm-8">-->
                                        <#--<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                            <#--<div class="col-xs-3">-->
                                <#--<div class="form-group">-->
                                    <#--<label class="control-label col-sm-4" title="">-->
                                        <#--<span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>-->
                                    <#--<div class="col-sm-8">-->
                                        <#--<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                            <#--<div class="col-xs-3">-->
                                <#--<div class="form-group">-->
                                    <#--<label class="control-label col-sm-4" title="">-->
                                        <#--<span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>-->
                                    <#--<div class="col-sm-8">-->
                                        <#--<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                            <#--<div class="col-xs-3">-->
                                <#--<div class="form-group">-->
                                    <#--<label class="control-label col-sm-4" title="">-->
                                        <#--<span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>-->
                                    <#--<div class="col-sm-8">-->
                                        <#--<input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</form>-->
                    <#--<!-- /.searchForm &ndash;&gt;-->
                <#--</div>-->
                <#--<!-- /.box-body &ndash;&gt;-->

            <#--</div>-->
            <#--<!-- /.box &ndash;&gt;-->
        <#--</div>-->
        <#--<!-- /.col &ndash;&gt;-->
    <#--</div>-->
    <div class="row">
        <div class="col-md-6">

        </div>
        <div class="col-md-6">
            <div class="btn-toolbar pull-right">
                <div class="btn-group">
                    <a href="#" class="btn btn-default" id="btn_search" title="查询" onclick="showSearch()"><i class="fa fa-filter"></i> 查询</a>
                    <a href="#" class="btn btn-default" id="btn_refreshTree" title="刷新" onclick="refreshTree()"><i class="fa fa-refresh"></i> 刷新</a>
                    <a href="#" class="btn btn-default" id="btn_expandTreeNode" title="展开" onclick="expandTreeNode()"><i class="fa fa-angle-double-down"></i> 展开</a>
                    <a href="#" class="btn btn-default" id="btn_collapseTreeNode" title="折叠全部" onclick="collapseTreeNode()"><i class="fa fa-angle-double-up"></i> 折叠</a>
                    <a href="#" class="btn btn-default" id="btn_addOrg" title="新增机构" onclick="addRootOrg()"><i class="fa fa-plus"></i> 新增</a>
                </div>
            </div>
        </div>
    </div>
    <h5 class="page-header"></h5>
    <div class="row">
        <!-- searchForm -->
        <form id="searchForm" name="searchForm" class="form-horizontal" hidden>
            <div class="col-xs-3">
                <div class="form-group">
                    <label class="control-label col-sm-4" title="">
                        <span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-group">
                    <label class="control-label col-sm-4" title="">
                        <span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-group">
                    <label class="control-label col-sm-4" title="">
                        <span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                    </div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="form-group">
                    <label class="control-label col-sm-4" title="">
                        <span class="required hide">*</span> 文本：<i class="fa icon-question hide"></i></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- /.searchForm -->
    <div class="row">
        <table id="dataGrid"></table>
    </div>
</div>

<#include "../../include/footer_js.ftl">
<script src="/js/base/org/list.js"></script>
</body>
</html>
