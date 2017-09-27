<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
                <table id="users" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Password Expired</th>
                        <th>Account Locked</th>
                        <th>Account Expired</th>
                        <th>Enabled</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customUserList}" var="user">
                        <tr>
                            <td><a href="/user/show/${user.id}">${user.username}</a></td>
                            <td>${user.password}</td>
                            <td>${user.passwordExpired}</td>
                            <td>${user.accountLocked}</td>
                            <td>${user.accountExpired}</td>
                            <td>${user.enabled}</td>
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

    <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${userList}" />

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>

</body>
</html>