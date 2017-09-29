<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
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
            </div>
        </div>
    </div>
    <!-- /.form-->
</div>

</body>
</html>