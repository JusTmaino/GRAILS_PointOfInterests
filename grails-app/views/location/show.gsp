<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                <div class="panel panel-primary">
                    <div class="panel-heading">${this.location.name} details</div>
                    <div class="panel-body">
                        <div id="show-location" class="content scaffold-show" role="main">
                            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <f:display bean="location" />
                            <g:form resource="${this.location}" method="DELETE">
                                <fieldset class="buttons">
                                    <g:link class="edit" action="edit" resource="${this.location}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
