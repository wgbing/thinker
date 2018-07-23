<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>系统管理 | 组织管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/plugins/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/plugins/adminlte/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/plugins/adminlte/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/plugins/adminlte/dist/css/skins/_all-skins.min.css">
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" href="/libs/jqGrid-4.8.2/css/jquery-ui.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" href="/libs/jqGrid-4.8.2/css/ui.jqgrid.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="/plugins/adminlte/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="/plugins/adminlte/plugins/respond/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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
                    <div id="pager"></div>
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

<!-- jQuery 3 -->
<script src="/plugins/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/plugins/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="/plugins/adminlte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/plugins/adminlte/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/plugins/adminlte/dist/js/adminlte.min.js"></script>
<!-- This is the Javascript file of jqGrid -->
<script src="/libs/jqGrid-4.8.2/js/jquery.jqGrid.js"></script>
<script src="/libs/jqGrid-4.8.2/js/i18n/grid.locale-cn.js"></script>
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

$(document).ready(function($) {
    $('#dataGrid').jqGrid({
        "url":"/org/list",
        "colModel":[
            {
                "name":"category_id",
                "index":"accounts.account_id",
                "sorttype":"int",
                "key":true,
                "hidden":true,
                "width":50
            },{
                "name":"name",
                "index":"name",
                "sorttype":"string",
                "label":"机构名称",
                "width":170
            },{
                "name":"name",
                "index":"name",
                "sorttype":"string",
                "label":"机构全称",
                "width":170
            },{
                "name":"price",
                "index":"price",
                "sorttype":"numeric",
                "label":"Price",
                "width":90,
                "align":"right"
            },{
                "name":"qty_onhand",
                "index":"qty_onhand",
                "sorttype":"int",
                "label":"Qty",
                "width":90,
                "align":"right"
            },{
                "name":"color",
                "index":"color",
                "sorttype":"string",
                "label":"Color",
                "width":100
            },{
                "name":"uiicon",
                "hidden":true
            }
        ],
        "width":"780",
        "hoverrows":false,
        "viewrecords":false,
        "gridview":true,
        "height":"auto",
        "sortname":"lft",
        "loadonce":true,
        "rowNum":100,
        "scrollrows":true,
        "treeGrid":true,// 启用树结构表格
        // which column is expandable
        "ExpandColumn":"name",
        // datatype
        "treedatatype":"json",
        // the model used
        "treeGridModel":"nested",
        // configuration of the data comming from server
        "treeReader":{
            "left_field":"lft",
            "right_field":"rgt",
            "level_field":"level",
            "leaf_field":"isLeaf",
            "expanded_field":"expanded",
            "loaded":"loaded",
            "icon_field":"icon"
        },
        "sortorder":"asc",
        "datatype":"json",
        "pager":"#pager"
    });

    $(function(){
        $("#dataGrid").jqGrid({
            treeGrid: true,
            treeGridModel: 'adjacency',   // treeGrid模式，跟json元数据有关
            ExpandColumn : 'menuName',    // 一般设置第一行
            ExpandColClick : true,        // 是否可以点击
            url: '/org/list',             // 获取数据url
            datatype: 'json',
            colNames:['主键','机构名称','机构简称','排序号','机构类型','更新时间','备注信息','状态','操作'],
            colModel:[
                {name:'id',index:'id', hidden:true},
                {name:'name',index:'name', width:250,align:"left"},
                {name:'shortName',index:'shortName', width:250,align:"left"},
                {name:'sortNo',index:'sortNo', width:80, align:"center"},
                {name:'type',index:'type', width:100, align:"center"},
                {name:'updateTime',index:'updateTime', width:150, align:"center"},
                {name:'remark',index:'remark', width:200, align:"left"},
                {name:'status',index:'status', width:80, align:"center"},
                // 自定义按钮，显示在table的最后一栏
                {name:'actions',sortable:false, title:false, width:150 , align:'center',
                    formatter: function (cellvalue, options, rowObject) {
                        var buttons = "";
                        buttons += "<button href=\"#\" class=\"ui-button ui-corner-all ui-widget\" onclick=\"bianji('"+options.rowId+"')\">编辑</button>";
                        // 判断是有还有子菜单，如果有子菜单多生成一个添加子菜单按钮
                        if(!rowObject.isLeaf){
                            buttons += "&nbsp;<button href=\"#\" class=\"ui-button ui-corner-all ui-widget\" onclick=\"tianjia('"+options.rowId+"')\">添加子菜单</button>";
                        }
                        return  buttons;
                    }
                }
            ],
            pager:"#pager",         // 显示分页div的id
            viewrecords: true,      // 是否显示信息条数
            jsonReader: {           // 设置读取数据时的字段
                root: "rows",       // json中代表实际模型数据的入口
                page: "page",       // json中代表当前页码的数据
                total: "total",     // json中代表页码总数的数据
                records: "records", // json中代表数据行总数的数据
                repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素
                id: "id"          // 设置rowid
            },
            treeReader : {           //设置树形显示时4个关键字段对应的返回数据字段
                level_field: "level",      // 属性层级
                parent_id_field: "parent", //父级rowid
                leaf_field: "isLeaf",      //是否还有子级菜单
                expanded_field: "expanded" //是否加载完毕
            },
            caption: "菜单管理",
            mtype: "POST",
            height: "auto",    // 设为具体数值则会根据实际记录数出现垂直滚动条
            rowNum : "-1",     // 显示全部记录
            shrinkToFit:false  // 控制水平滚动条
        });
        // 自定义jq按钮
        $("#dataGrid").jqGrid("navGrid", "#pager", {
            addfunc : AddOrModifyBtn,          // (1) 点击添加按钮
            editfunc : AddOrModifyBtn,         // (2) 点击编辑按钮
            delfunc : Deleting,                // (3) 点击删除按钮
            alerttext : "请选择需要操作的数据行!"  // (4) 当未选中任何行而点击编辑、删除、查看按钮时，弹出的提示信息
        });
    });

});

</script>
</body>
</html>
