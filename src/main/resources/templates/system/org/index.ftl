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
                        <a href="#" class="btn btn-default" id="btn_search" title="查询" onclick="showSearch()"><i class="fa fa-filter"></i> 查询</a>
                        <a href="#" class="btn btn-default" id="btnRefreshTree" title="刷新"><i class="fa fa-refresh"></i> 刷新</a>
                        <a href="#" class="btn btn-default" id="btnExpandTreeNode" title="展开一级"><i class="fa fa-angle-double-down"></i> 展开</a>
                        <a href="#" class="btn btn-default" id="btnCollapseTreeNode" title="折叠全部"><i class="fa fa-angle-double-up"></i> 折叠</a>
                        <a href="#" class="btn btn-default btnTool"><i class="fa fa-plus" title="新增机构"></i> 新增</a>
                    </div>
                </div>
                <!-- /.box-header -->

                <div class="box-body with-border">
                    <!-- SearchTable -->
                    <table id="tbl_search" class="table table-bordered table-striped table-search hidden">
                        <tr>
                            <td style="width:10%">员工姓名：</td>
                            <td style="width:15%"><input type="text" class="form-control" autocomplete="off" id="empName" placeholder="员工姓名"/></td>
                            <td style="width:10%">店铺名称：</td>

                        </tr>
                    </table>


                    <table id="dataGrid"></table>
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

<script>
    function showSearch() {
        console.log(11);
        $("#tbl_search").show();
    }



</script>

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
</body>
</html>
