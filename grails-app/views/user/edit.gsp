<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- /.CONTENT-->

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">USERS</h1>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Edit : ${this.user.username}</div>
                    <div class="panel-body">
                        <div id="edit-user" class="content scaffold-edit" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.user}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.user}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.user}" method="PUT">
                                <g:hiddenField name="version" value="${this.user?.version}" />
                                <fieldset class="form">
                                    <f:all bean="user"/>
                                </fieldset>
                                <fieldset class="buttons">
                                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
                <ul>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <!-- /.form-->

    </body>
</html>
