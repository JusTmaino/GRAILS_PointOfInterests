<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Edit : ${customUser.username}</div>
                    <div class="panel-body">
                        <form action="/user/update/${customUser.id}" method="post" ><input type="hidden" name="_method" value="PUT" id="_method" />

                            <input type="hidden" name="version" value="0" id="version" />

                            <fieldset class="box-body">
                                <div class='form-group'>
                                    <label for="username">Username * </label>
                                    <input type="text" class="form-control" name="username" placeholder="Username" value="${customUser.username}" required="" id="username" />
                                </div>

                                <div class='form-group'>
                                    <label for="username">Password * </label>
                                    <input type="text" class="form-control" name="password" placeholder="Retape your Password" value="${customUser.password}" required="" id="password" />
                                </div>

                                <g:if test="${customUser.id != currentUser.id}">
                                <div class='form-group'>
                                    <label for='role'>Role * </label>
                                    <g:select name="roleID" class="form-control" required="" id="role" optionKey="id" optionValue="authority" from="${customRoleList}"  ></g:select>
                                </div>
                                </g:if>

                                <div class='form-group'>
                                    <input type="hidden" class="form-control" name="_passwordExpired" /><input type="checkbox" name="passwordExpired" id="passwordExpired"  />
                                    <label for='passwordExpired'>Password Expired</label>
                                </div>

                                <div class='form-group'>
                                    <input type="hidden" name="_accountLocked" /><input type="checkbox" name="accountLocked" id="accountLocked"  />
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
                                <div class="form-group">
                                    <label for="exampleInputFile">Image</label>
                                    <input type="file" id="exampleInputFile">

                                    <p class="help-block">Upload your image here.</p>
                                </div>
                            </fieldset>

                            <fieldset class="box-footer">
                                <input class="btn btn-primary" type="submit" value="Update" />
                            </fieldset>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->

    </body>
</html>
