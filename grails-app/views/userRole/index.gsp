<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'userRole.label', default: 'userRole')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body >
<div >
    <!-- /.CONTENT-->

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">USER ROLE</h1>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">List</div>
                    <div class="panel-body">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
                            </div>
                            <i class="fa fa-user-plus" aria-hidden="true"></i><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                        <!-- /.box-header -->
                            <div class="box-body">
                                <table id="userRole" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Role</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${customUserRolesList}" var="userRole">
                                        <tr>
                                            <td><a href="/user/show/${userRole.user.id}">${userRole.user.username}</a></td>
                                            <td><a href="/role/show/${userRole.role.id}">${userRole.role.authority}</a></td>
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
            $('#userRole').DataTable({
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