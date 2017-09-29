<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
<body>
<!-- /.CONTENT-->
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">My profile</h1>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Details</div>
                <div class="panel-body">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
                        </div>
                        <i class="fa fa-user-plus" aria-hidden="true"></i><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                    <!-- /.box-header -->
                        <div class="box-body">
                            <table id="users" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Password Expired</th>
                                    <th>Account Locked</th>
                                    <th>Account Expired</th>
                                    <th>Enabled</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${customUserList}" var="user">
                                    <tr>
                                        <td><a href="/user/show/${user.id}">${user.username}</a></td>
                                        <td>${user.passwordExpired}</td>
                                        <td>${user.accountLocked}</td>
                                        <td>${user.accountExpired}</td>
                                        <td>${user.enabled}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->
</div>

<script>
    $(function () {
        $('#users').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })
</script>

</body>
</html>