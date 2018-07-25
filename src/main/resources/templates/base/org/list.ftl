<!DOCTYPE html>
<html>
<head>
    <title>系统管理 | 组织管理</title>
    <#include "../../include/header_css.ftl">
</head>
<body>
<div>

  <section class="content-header">
    <h1>
      系统管理
      <small>组织管理</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li>系统管理</li>
      <li class="active">组织管理</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Main row -->
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-main">
                <div class="box-header">
                    <div class="box-title hidden-xs">
                        <i class="fa icon-grid"></i> 组织管理
                    </div>
                    <div class="box-tools pull-right">
                        <a href="#" class="btn btn-default" id="btnSearch" title="查询" onclick="showSearch()"><i class="fa fa-filter"></i> 查询</a>
                        <a href="#" class="btn btn-default" id="btnRefreshTree" title="刷新"><i class="fa fa-refresh"></i> 刷新</a>
                        <a href="#" class="btn btn-default" id="btnExpandTreeNode" title="展开一级"><i class="fa fa-angle-double-down"></i> 展开</a>
                        <a href="#" class="btn btn-default" id="btnCollapseTreeNode" title="折叠全部"><i class="fa fa-angle-double-up"></i> 折叠</a>
                        <a href="#" class="btn btn-default btnTool"><i class="fa fa-plus" title="新增机构"></i> 新增</a>
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

  </section>
  <!-- /.content -->

</div>
<!-- ./wrapper -->

<#include "../../include/footer_js.ftl">
<script src="/js/base/org/list.js"></script>
<script>
    function showSearch() {
        if($("#searchForm").is(':visible')){
            $("#searchForm").hide();
            $("#btnSearch").html($("#btnSearch").html().replace("隐藏","查询"));
        }else {
            $("#searchForm").show();
            $("#btnSearch").html($("#btnSearch").html().replace("查询","隐藏"));
        }
    }

    // $(function(){
    //     $("#dataGrid").jqGrid({
    //         treeGrid: true,
    //         treeGridModel: 'adjacency',   // treeGrid模式，跟json元数据有关
    //         ExpandColumn : 'menuName',    // 一般设置第一行
    //         ExpandColClick : true,        // 是否可以点击
    //         url: '/org/list',             // 获取数据url
    //         datatype: 'json',
    //         colNames:['主键','机构名称','机构简称','排序号','机构类型','更新时间','备注信息','状态','操作'],
    //         colModel:[
    //             {name:'id',index:'id', hidden:true},
    //             {name:'name',index:'name', width:250,align:"left",frozen:true},
    //             {name:'shortName',index:'shortName', align:"left"},
    //             {name:'sortNo',index:'sortNo',  align:"center"},
    //             {name:'type',index:'type',  align:"center"},
    //             {name:'updateTime',index:'updateTime', align:"center"},
    //             {name:'remark',index:'remark', align:"left"},
    //             {name:'status',index:'status', align:"center"},
    //             // 自定义按钮，显示在table的最后一栏
    //             {name:'actions',sortable:false, title:false, align:'center',
    //                 formatter: function (cellvalue, options, rowObject) {
    //                     var buttons = "";
    //                     // buttons += "<button href="#" class="ui-button ui-corner-all ui-widget" onclick="">编辑</button>";
    //                     // 判断是有还有子菜单，如果有子菜单多生成一个添加子菜单按钮
    //                     // if(!rowObject.isLeaf){
    //                     //     buttons += "&nbsp;<button href="#" class="ui-button ui-corner-all ui-widget" onclick="">添加子菜单</button>";
    //                     // }
    //                     return  buttons;
    //                 }
    //             }
    //         ],
    //         pager:"#pager",         // 显示分页div的id
    //         viewrecords: true,      // 是否显示信息条数
    //         jsonReader: {           // 设置读取数据时的字段
    //             root: "rows",       // json中代表实际模型数据的入口
    //             page: "page",       // json中代表当前页码的数据
    //             total: "total",     // json中代表页码总数的数据
    //             records: "records", // json中代表数据行总数的数据
    //             repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素
    //             id: "id"          // 设置rowid
    //         },
    //         treeReader : {           //设置树形显示时4个关键字段对应的返回数据字段
    //             level_field: "level",      // 属性层级
    //             parent_id_field: "parent", //父级rowid
    //             leaf_field: "isLeaf",      //是否还有子级菜单
    //             expanded_field: "expanded" //是否加载完毕
    //         },
    //         // caption: "菜单管理",
    //         mtype: "GET",
    //         width:"100%",
    //         autowidth:true,
    //         height: "auto",    // 设为具体数值则会根据实际记录数出现垂直滚动条
    //         rowNum : "-1",     // 显示全部记录
    //         shrinkToFit:false  // 控制水平滚动条
    //     });
    //     // 自定义jq按钮
    //     // $("#dataGrid").jqGrid("navGrid", "#pager", {
    //     //     addfunc : AddOrModifyBtn,          // (1) 点击添加按钮
    //     //     editfunc : AddOrModifyBtn,         // (2) 点击编辑按钮
    //     //     delfunc : Deleting,                // (3) 点击删除按钮
    //     //     alerttext : "请选择需要操作的数据行!"  // (4) 当未选中任何行而点击编辑、删除、查看按钮时，弹出的提示信息
    //     // });
    // });
    // $(function(){
    //     $(window).resize(function(){
    //         $(window).unbind("onresize");
    //         $("#dataGrid").setGridWidth($(window).width());
    //         $(window).bind("onresize", this);
    //     });
    // });
</script>
</body>
</html>
