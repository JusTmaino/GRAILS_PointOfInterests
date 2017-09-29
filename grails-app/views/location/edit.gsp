<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">LOCATIONS</h1>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Edit : ${this.location.name}</div>
                    <div class="panel-body">
                        <div id="edit-location" class="content scaffold-edit" role="main">
                            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.location}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.location}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.location}" method="PUT">
                                <g:hiddenField name="version" value="${this.location?.version}" />
                                <fieldset class="form">
                                    <f:all bean="location"/>
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
