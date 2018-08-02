<!DOCTYPE html>
<html>
<head>
    <title>系统管理 | 组织管理</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div>

  <#--<section class="content-header">-->
    <#--<h1>-->
      <#--系统管理-->
      <#--<small>组织管理</small>-->
    <#--</h1>-->
    <#--<ol class="breadcrumb">-->
      <#--<li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>-->
      <#--<li>系统管理</li>-->
      <#--<li class="active">组织管理</li>-->
    <#--</ol>-->
  <#--</section>-->

  <!-- Main content -->
  <#--<section class="content">-->
    <!-- Main row -->
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-main">
                <div class="box-header">
                    <div class="box-title hidden-xs">
                        <i class="fa icon-grid"></i> 组织管理
                    </div>
                    <div class="box-tools pull-right">
                        <a href="#" class="btn btn-default" id="btn_search" title="查询" onclick="showSearch()"><i class="fa fa-filter"></i> 查询</a>
                        <a href="#" class="btn btn-default" id="btn_refreshTree" title="刷新" onclick="refreshTree()"><i class="fa fa-refresh"></i> 刷新</a>
                        <a href="#" class="btn btn-default" id="btn_expandTreeNode" title="展开" onclick="expandTreeNode()"><i class="fa fa-angle-double-down"></i> 展开</a>
                        <a href="#" class="btn btn-default" id="btn_collapseTreeNode" title="折叠全部" onclick="collapseTreeNode()"><i class="fa fa-angle-double-up"></i> 折叠</a>
                        <a href="#" class="btn btn-default" id="btn_addOrg" title="新增机构" onclick="addRootOrg()"><i class="fa fa-plus"></i> 新增</a>
                    </div>
                </div>
                <!-- /.box-header -->

                <div class="box-body">
                    <!-- searchForm -->
                    <form id="searchForm" name="searchForm" class="form-horizontal" hidden>
                        <div class="row">
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
                        </div>
                    </form>
                    <!-- /.searchForm -->

                    <table id="dataGrid"></table>
                    <#--<div id="pager"></div>-->
                </div>
                <!-- /.box-body -->

            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row (main row) -->

  <#--</section>-->
  <!-- /.content -->

</div>
<!-- ./wrapper -->

<#include "../../include/footer_js.ftl">
<script src="/js/base/org/list.js"></script>
</body>
</html>
