<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">IMAGES</h1>
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
                <div class="panel-heading">List</div>
                <div class="panel-body">
                    <table id="users" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Filename</th>
                            <th>Date Created</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customImageList}" var="image">
                            <tr>
                                <td><a href="/image/show/${image.id}"><asset:image src="${image.filename}" class="img-rounded" width="70px" height="70px"/></a></td>
                                <td>${image.date_created}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="nav" role="navigation">
                <ul>

                </ul>
            </div>
        </div>
    </div>
        <!-- /.form-->
</body>
</html>