<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<!--/.title-->
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">LOCATIONS</h3>
    </div>
</div>
<!--/.title-->

<!-- /.form -->
<div class="row">
    <div>
        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
            <a href="/location/create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></a>
        </sec:ifAnyGranted>
    </div>
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">List</div>
            <div class="panel-body">
                <table id="userRole" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Latitude</th>
                        <th>Longitude</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customLocationsList}" var="location">
                        <tr>
                            <td><a href="/location/show/${location.id}">${location.name}</a></td>
                            <td>${location.latitude}</td>
                            <td>${location.longitude}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.form-->

</body>
</html>