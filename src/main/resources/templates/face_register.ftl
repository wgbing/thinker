<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Thinker | 注册页面</title>
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
  <!-- bootstrap-validator -->
  <link rel="stylesheet" href="/plugins/bootstrap-validator/bootstrapValidator.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="/plugins/adminlte/plugins/html5shiv/html5shiv.min.js"></script>
  <script src="/plugins/adminlte/plugins/respond/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="../../index2.html"><b>Thinker</b>-思想者</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">人脸注册</p>

    <form action="/face/register/save" method="post" id="face_register_form" onsubmit="return saving()">
        <#if _csrf?? && _csrf.parameterName??>
            <input type="hidden" name="${_csrf.parameterName?default('_csrf')}" value="${_csrf.token?default('')}"/>
        </#if>
        <input type="hidden" id="userPhoto" name="userPhoto">
        <canvas id="canvas" hidden></canvas>
        <div class="form-group has-feedback text-center">
            <video id="video" style="width: 320px;height: 180px;" autoplay></video>
        </div>
        <div class="form-group has-feedback">
            <input id="username" name="username" type="text" class="form-control" placeholder="请输入用户名">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input id="email" name="email" type="text" class="form-control" placeholder="请输入登录邮箱">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input id="password" name="password" type="password" class="form-control" placeholder="请输入密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input id="repassword" name="repassword" type="password" class="form-control" placeholder="再次确认密码">
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        </div>
        <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox" id="agreement" class="icheck" required> 我同意 <a href="#">《服务协议》</a>
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
            </div>
            <!-- /.col -->
        </div>
    </form>

    <a href="/login" class="text-center">已有账号？点击登录</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="/plugins/adminlte/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/plugins/adminlte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/plugins/adminlte/plugins/iCheck/icheck.min.js"></script>
<!-- bootstrap-validator -->
<script src="/plugins/bootstrap-validator/bootstrapValidator.min.js"></script>

<script>
    var mediaStreamTrack;
    $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' /* optional */
        });

        //表单校验
        $("#face_register_form").bootstrapValidator({
            submitHandler: function (valiadtor, loginForm, submitButton) {
                if(!$("#agreement").is(":checked")){
                    toastr.warning("请先勾选同意遵循AdminEAP协议","提示信息");
                    return;
                }
                valiadtor.defaultSubmit();
            },
            fields:{
                username:{
                    validators:{
                        notEmpty:{
                            message:'用户名不能为空'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty:{
                            message:'邮箱不能为空'
                        },
                        emailAddress: {
                            message: '请输入正确的邮箱地址'
                        }
                    }
                },
                password:{
                    validators:{
                        notEmpty:{
                            message:'密码不能为空'
                        },
                        identical:{
                            field: 'repassword',
                            message: '密码输入不一致'
                        }
                    }
                },
                repassword:{
                    validators:{
                        notEmpty:{
                            message: '不能为空'
                        },
                        identical:{
                            field: 'password',
                            message: '密码输入不一致'
                        }
                    }
                }
            }
        });

      openCamera();
    });

  //开启摄像头
  function openCamera(){
      // 老的浏览器可能根本没有实现 mediaDevices，所以我们可以先设置一个空的对象
      if (navigator.mediaDevices === undefined) {
          navigator.mediaDevices = {};
      }

      // 一些浏览器部分支持 mediaDevices。我们不能直接给对象设置 getUserMedia
      // 因为这样可能会覆盖已有的属性。这里我们只会在没有getUserMedia属性的时候添加它。
      if (navigator.mediaDevices.getUserMedia === undefined) {
          navigator.mediaDevices.getUserMedia = function(constraints) {

              // 首先，如果有getUserMedia的话，就获得它
              var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

              // 一些浏览器根本没实现它 - 那么就返回一个error到promise的reject来保持一个统一的接口
              if (!getUserMedia) {
                  return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
              }

              // 否则，为老的navigator.getUserMedia方法包裹一个Promise
              return new Promise(function(resolve, reject) {
                  getUserMedia.call(navigator, constraints, resolve, reject);
              });
          }
      }

      // 想要获取一个最接近 1280x720 的相机分辨率
      var constraints = {video: { width: 1280, height: 720 } };

      navigator.mediaDevices.getUserMedia(constraints)
              .then(function(stream) {
                  mediaStreamTrack = stream;
                  var video = document.querySelector('video');
                  // 旧的浏览器可能没有srcObject
                  if ("srcObject" in video) {
                      video.srcObject = stream;
                  } else {
                      // 防止再新的浏览器里使用它，应为它已经不再支持了
                      video.src = window.URL.createObjectURL(stream);
                  }
                  video.onloadedmetadata = function(e) {
                      video.play();
                  };
              })
              .catch(function(err) {
                  console.log(err.name + ": " + err.message);
              });
  }

    //关闭摄像头
    function closeCamera(){
        mediaStreamTrack.getTracks().forEach(function (track) {
            track.stop();
        });
    }

    //提交保存之前处理数据
    function saving() {
        //获得Canvas对象
        var video = document.getElementById("video");
        var canvas = document.getElementById("canvas");
        var ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0, 150, 150);
        var userPhoto=document.getElementById("canvas").toDataURL("image/png");
        $("#userPhoto").val(userPhoto);
    }

</script>
</body>
</html>
