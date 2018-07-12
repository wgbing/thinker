<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Thinker | 登录</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="/plugins/adminlte/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="/plugins/adminlte/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="/plugins/adminlte/plugins/respond/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Thinker</b>-思想者</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form action="/auth" method="post">
     <#if _csrf?? && _csrf.parameterName??>
           <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
     </#if>
      <div class="form-group has-feedback">
        <input id="username" name="username" type="text" class="form-control" placeholder="用户名" maxlength="20">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="password" name="password" type="password" class="form-control" placeholder="密码" maxlength="20">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback" style="position: relative">
          <input id="captcha" name="captcha" type="text" class="form-control" style="text-transform:uppercase;"
                 for="btn_login" placeholder="验证码" maxlength="4" autocomplete="off">
          <span class="glyphicon glyphicon-picture form-control-feedback"></span>
          <img id="captchaImage" class="captchaImage" src="/captcha/image" style="width:80px; height:32px; position: absolute; top:1px; right:34px; cursor:pointer;"
               onclick="this.src='/captcha/image?'+Math.random()" title="点击更换验证码"/>
      </div>
      <div class="row">
          <div class="col-xs-6">
              <div class="checkbox icheck">
                  <label>
                      <input type="checkbox" name="rememberMe"> 记住用户
                  </label>
              </div>
          </div>
          <!-- /.col -->
          <div class="col-xs-6">
              <div class="checkbox pull-right">
                  <a href="#">忘记密码</a>
                  <span>&nbsp;/&nbsp;</span>
                  <a href="/register" class="text-center">注册</a>
              </div>
          </div>
          <!-- /.col -->
      </div>
      <div class="row">
          <div class="col-xs-12">
              <button type="submit" class="btn btn-danger btn-block btn-flat">登 录</button>
          </div>
      </div>
    </form>
    <div class="social-auth-links" style="margin-bottom: 0px;">
        <div class="row">
            <div class="col-xs-5">
                <div class="text-left" style="margin-top: 5px;">快速登录</div>
            </div>
            <div class="col-xs-7">
                <div class="text-right">
                    <a class="btn btn-social-icon btn-primary"><i class="fa fa-qq"></i></a>
                    <a class="btn btn-social-icon btn-success"><i class="fa fa-wechat"></i></a>
                    <a class="btn btn-social-icon btn-warning"><i class="fa fa-weibo"></i></a>
                    <a class="btn btn-social-icon btn-info"><i class="fa fa-github"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/plugins/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/plugins/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/plugins/adminlte/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
