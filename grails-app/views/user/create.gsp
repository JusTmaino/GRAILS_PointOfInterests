<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- /.CONTENT-->

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">USER MANAGER</h3>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div>
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 5px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Create an user</div>
                    <div class="panel-body">
                            <form action="/user/save" method="post" >
                                <fieldset class="form">

                                    <div class='form-group'>
                                        <label for='username'>Username * </label>
                                        <input type="text" class="form-control" name="username" placeholder="Username" required="" id="username" />
                                    </div>


                                    <div class='form-group'>
                                        <label for='password'>Password * </label>
                                        <input type="text" class="form-control" name="password" placeholder="Enter your Password" required="" id="password" />
                                    </div>

                                    <div class='form-group'>
                                        <label for='role'>Role * </label>
                                        <g:select name="roleID" class="form-control" required="" id="role" optionKey="id" optionValue="authority" from="${customRoleList}"  ></g:select>
                                    </div>


                                    <div class='form-group'>
                                        <input type="hidden" class="form-control" name="_passwordExpired" /><input type="checkbox" name="passwordExpired" id="passwordExpired"  />
                                        <label for='passwordExpired'>Password Expired</label>
                                    </div>

                                    <div class='form-group'>
                                        <input type="hidden" class="form-control" name="_accountLocked" /><input type="checkbox" name="accountLocked" id="accountLocked"  />
                                        <label for='accountLocked'>Account Locked</label>
                                    </div>

                                    <div class='form-group'>
                                        <input type="hidden" class="form-control" name="_accountExpired" /><input type="checkbox" name="accountExpired" id="accountExpired"  />
                                        <label for='accountExpired'>Account Expired</label>
                                    </div>

                                    <div class='form-group'>
                                        <input type="hidden" class="form-control" name="_enabled" /><input type="checkbox" name="enabled" checked="checked" id="enabled"  />
                                        <label for='enabled'>Enabled</label>
                                    </div>
                                </fieldset>

                                <fieldset class="box-footer">
                                    <input  id="create" name="create" class="btn btn-primary" type="submit" value="Create" />
                                </fieldset>
                            </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->

    </body>
</html>
