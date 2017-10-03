<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <g:if env="development">
        <asset:stylesheet src="admin_login/bootstrap.min.css"/>
        <asset:stylesheet src="admin_login/font-awesome.min.css"/>
        <asset:stylesheet src="admin_login/ionicons.min.css"/>
        <asset:stylesheet src="admin_login/AdminLTE.min.css"/>
        <asset:stylesheet src="admin_login/blue.css"/>
        <asset:javascript src="jquery.min.js"/>
        <asset:javascript src="bootstrap.min.js"/>
    </g:if>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../"><b>Points </b>Of Interests</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

    <g:if test='${flash.message}'>
        <div class="login_message">${flash.message}</div>
    </g:if>
        <form action="${postUrl ?: '/login/authenticate'}" id="loginForm" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="${usernameParameter ?: 'username'}" id="username" class="form-control" placeholder="Username">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="${passwordParameter ?: 'password'}" id="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8" style=" padding-left: 15%;">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if> /> Remember Me
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <g:submitButton name="login" class="btn btn-primary btn-block btn-flat" value="Sign In"></g:submitButton>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <!-- /.login-box-body -->
    </div>
</body>
</html>