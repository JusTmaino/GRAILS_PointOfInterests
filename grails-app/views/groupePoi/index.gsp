<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupePoi.label', default: 'GroupePoi')}" />
    <title>
        <g:message code="default.list.label" args="[entityName]" />
    </title>
</head>

<body>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
                </div>
                <i class="fa fa-user-plus" aria-hidden="true"></i>
                <g:link class="create" action="create">
                    <g:message code="default.new.label" args="[entityName]" />
                </g:link>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="userRole" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Groupe</th>
                            <th>Point</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customGroupePoisList}" var="groupePoi">
                            <tr>
                                <td><a href="/groupe/show/${groupePoi.groupe.id}">${groupePoi.groupe}</a></td>
                                <td><a href="/point/show/${groupePoi.point.id}">${groupePoi.point}</a></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>