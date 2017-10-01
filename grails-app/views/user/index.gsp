<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
<body>
<!-- /.CONTENT-->

    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">USERS</h3>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">List Details</div>
                <div class="panel-body">
                    <div class="box">
                        <g:link class="create" action="create"><i class="fa fa-user-plus fa-2x" style="padding: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
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