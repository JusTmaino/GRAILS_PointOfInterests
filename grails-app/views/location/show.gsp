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
            <div>
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">${this.location.name} details</div>
                    <div class="panel-body">
                        <div id="show-location" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <f:display bean="location" />
                        </div>
                    </div>
                    <div class="panel-footer">
                        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                            <g:form resource="${this.location}" method="DELETE">
                                <fieldset class="buttons">
                                    <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    <g:link class="edit btn btn-primary"  action="edit" resource="${this.location}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                </fieldset>
                            </g:form>
                        </sec:ifAnyGranted>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->

    </body>
</html>
