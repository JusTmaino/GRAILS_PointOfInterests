<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">USER MANAGER</h3>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">

                <div>
                    <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                    <g:link class="create" action="create"><i class="fa fa-user-plus fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">${this.user.username} details</div>
                    <div class="panel-body">

                            <ol class="property-list user">

                                <div class='form-group'>
                                    <label>Username </label> : <span> ${this.user.username}</span>
                                </div>

                                <div class='form-group'>
                                    <label>Password </label> : <span> ${this.user.password}</span>
                                </div>

                                <div class='form-group'>
                                    <label >Password Expired </label> : <span> ${this.user.passwordExpired}</span>
                                </div>

                                <div class='form-group'>
                                    <label >Account Locked </label> : <span> ${this.user.accountLocked}</span>
                                </div>

                                <div class='form-group'>
                                    <label >Account Expired </label> : <span> ${this.user.accountExpired}</span>
                                </div>

                                <div class='form-group'>
                                    <label >Enabled </label> : <span> ${this.user.enabled}</span>
                                </div>

                            </ol>
                    </div>
                    <div class="panel-footer">
                        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                            <form action="/user/delete/${this.user.id}" method="post" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                                <fieldset class="box-footer">
                                    <input class="btn btn-danger" type="submit" value="Delete" onclick="return confirm('Are you sure to delete this user?');" />
                                    <input class="btn btn-primary" type="button" onclick="window.location='/user/edit/${this.user.id}';" value="Edit">
                                </fieldset>
                            </form>
                        </sec:ifAnyGranted>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->
</body>
</html>
