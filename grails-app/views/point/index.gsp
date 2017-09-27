<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
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
                    <table id="points" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Location</th>
                            <th>Images</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customPointsList}" var="point">
                            <tr>
                                <td><a href="/point/show/${point.id}">${point.name}</a></td>
                                <td>${point.description}</td>
                                <td>${point.location}</td>
                                <td>${point.images}</td>
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