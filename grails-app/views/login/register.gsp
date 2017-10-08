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
        <a href="../../"><b>AQUA </b>Of Interests</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Register a new membership</p>
        <g:if test='${params.error}'>
            <div class="login_message" style="color: red;">${params.error}</div>
        </g:if>
        <form id="registerForm" action="/user/register" method="post" >
            <fieldset class="form">

                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="username" placeholder="Username" required="" id="username" />
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>


                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="password" placeholder="Password" required="" id="password" />
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="confirmpassword" placeholder="Retype password" required="" id="confirmPassword" />
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>

                <div class='form-group'>
                    <input type="hidden" class="form-control" name="_passwordExpired" /><input type="hidden" value="false" name="passwordExpired" id="passwordExpired"  />
                </div>

                <div class='form-group'>
                    <input type="hidden" class="form-control" name="_accountLocked" /><input type="hidden" value="false" name="accountLocked" id="accountLocked"  />
                </div>

                <div class='form-group'>
                    <input type="hidden" class="form-control" name="_accountExpired" /><input type="hidden" value="false" name="accountExpired" id="accountExpired"  />
                </div>

                <div class='form-group'>
                    <input type="hidden" class="form-control" name="_enabled" /><input type="hidden" value="true" name="enabled" checked="checked" id="enabled"  />
                </div>
            </fieldset>

            <div class="row">
                <div class="col-xs-8"  style=" padding-left: 15%;">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" required> I agree to the <a href="#">terms</a>
                        </label>
                    </div>
                </div>
                <fieldset class="col-xs-4">
                        <g:submitButton id="create" name="create" class="btn btn-primary btn-block btn-flat" value="Register"></g:submitButton>
                </fieldset>
            </div>
        </form>
        <!-- /.login-box-body -->
        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
            Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
            Google+</a>
        </div>

        <g:link action="index" controller="login" class="text-center">I already have a membership</g:link>
    </div>

</div>
<script type="text/javascript">
    $(this).find('#registerForm').validate({
        rules: {
            password: {
                minlength: 5
            },
            confirmPassword: {
                minlength: 5,
                equalTo: "#password"
            }
        }
    });
</script>
</body>
</html>