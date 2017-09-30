<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
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
                <div class="panel panel-primary">
                    <div class="panel-heading">Create a group</div>
                    <div class="panel-body">
                        <div id="create-groupe" class="content scaffold-create" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.groupe}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.groupe}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.groupe}" method="POST">
                                <fieldset class="form">
                                    <f:all bean="groupe"/>
                                </fieldset>
                                <fieldset class="buttons">
                                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
                <div class="nav" role="navigation">
                    <ul>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /.form-->

</body>
</html>
