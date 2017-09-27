<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
                </div>
                <i class="fa fa-user-plus" aria-hidden="true"></i><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            <!-- /.box-header -->
                <div class="box-body">
                    <table id="roles" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Authority</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customRolesList}" var="role">
                            <tr>
                                <td><a href="/role/show/${role.id}">${role.authority}</a></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</body>
</html>