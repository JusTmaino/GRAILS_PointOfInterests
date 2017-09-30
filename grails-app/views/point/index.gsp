<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<!-- /.CONTENT-->


    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">POINTS OF INTERESTS</h1>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">PointsList</div>
                <div class="panel-body">
                    <div class="box">
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
                                        <td>${point.location.name}</td>
                                        <td>
                                            <g:each in="${point.images}" var="img">
                                                <asset:image src="${img.filename}" height="70px" width="70px"/>
                                            </g:each>
                                        </td>
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

</body>
</html>