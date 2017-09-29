<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">GROUPS</h1>
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
                        <i class="fa fa-map-marker" aria-hidden="true"></i><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                    <!-- /.box-header -->
                        <div class="box-body">
                            <table id="points" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Points</th>
                                    <th>Images</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${groupeList}" var="groupe">
                                    <tr>
                                        <td><a href="/groupe/show/${groupe.id}">${groupe.name}</a></td>
                                        <td>${groupe.description}</td>
                                        <td>
                                            <g:each in="${groupe.points}" var="point">
                                               - ${point.name} -
                                            </g:each>
                                        </td>
                                        <td>
                                            <g:each in="${groupe.images}" var="img">
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
                    <div class="pagination">
                        <g:paginate total="${groupeCount ?: 0}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>