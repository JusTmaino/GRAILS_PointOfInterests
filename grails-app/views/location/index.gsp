<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
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
                    <table id="userRole" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Latitude</th>
                            <th>Longitude</th>
                            <th>Altitude</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customLocationsList}" var="location">
                            <tr>
                                <td><a href="/location/show/${location.id}">${location.name}</a></td>
                                <td>${location.latitude}</td>
                                <td>${location.longitude}</td>
                                <td>${location.altitude}</td>
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