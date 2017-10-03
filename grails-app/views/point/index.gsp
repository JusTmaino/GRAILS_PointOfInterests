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
        <div>
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">PointsList</div>
                <div class="panel-body">
                    <div class="box">
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
                                        <td>
                                            <g:each in="${point.location}" var="loc">
                                                <li><a href="/location/show/${loc.id}">${loc.name}</a></li>
                                            </g:each>
                                        </td>
                                        <td>
                                            <g:each in="${point.images}" var="img">
                                                <a href="/image/show/${img.id}"><img src="${grailsApplication.config.server.pathServer}/${img.filename}" height="70px" width="70px"/></a>
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