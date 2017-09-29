<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupePoi.label', default: 'GroupePoi')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">POIs-GROUPS</h1>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Edit</div>
                    <div class="panel-body">
                        <a href="#edit-groupePoi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                        <div class="nav" role="navigation">
                            <ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                            </ul>
                        </div>
                        <div id="edit-groupePoi" class="content scaffold-edit" role="main">
                            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.groupePoi}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.groupePoi}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form resource="${this.groupePoi}" method="PUT">
                                <g:hiddenField name="version" value="${this.groupePoi?.version}" />
                                <fieldset class="form">
                                    <f:all bean="groupePoi"/>
                                </fieldset>
                                <fieldset class="buttons">
                                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->
    </div>

    </body>
</html>
