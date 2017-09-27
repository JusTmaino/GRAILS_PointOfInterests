<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title>
        <g:message code="default.list.label" args="[entityName]" />
    </title>
</head>

<body>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">
                        <g:message code="default.list.label" args="[entityName]" />
                    </h3>
                </div>
                <i class="fa fa-user-plus" aria-hidden="true"></i>
                <g:link class="create" action="create">
                    <g:message code="default.new.label" args="[entityName]" />
                </g:link>

                <div class="box-body">
                    <table id="userRole" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Filename</th>
                            <th>Date Created</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customImagesList}" var="image">
                            <tr>
                                <td><a href="/image/show/${image.id}">${image.filename}</a></td>
                                <td>${image.date_created}</td>
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