<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
        <div>
            <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
            <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Edit : ${this.groupe.name}</div>
                <div class="panel-body">
                    <div id="edit-groupe" class="content scaffold-edit" role="main">
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
                        <g:uploadForm resource="${this.POIGroupImage}" method="PUT">
                            <g:hiddenField name="version" value="${this.groupe?.version}" />
                            <fieldset class="form">
                                <f:all bean="groupe"/>
                            </fieldset>
                            <fieldset class="buttons">
                                <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                            </fieldset>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->


    </body>
</html>
