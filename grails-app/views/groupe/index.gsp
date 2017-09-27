<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                    <table id="groupes" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Images</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${customGroupesList}" var="groupe">
                            <tr>
                                <td><a href="/groupe/show/${groupe.id}">${groupe.name}</a></td>
                                <td>${groupe.description}</td>
                                <td>${groupe.images}</td>
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