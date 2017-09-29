<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupePoi.label', default: 'GroupePoi')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- /.CONTENT-->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My profile</h1>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Details</div>
                    <div class="panel-body">
                        <a href="#list-groupePoi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                        <div class="nav" role="navigation">
                            <ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                            </ul>
                        </div>
                        <div id="list-groupePoi" class="content scaffold-list" role="main">
                            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <f:table collection="${groupePoiList}" />

                            <div class="pagination">
                                <g:paginate total="${groupePoiCount ?: 0}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->
    </div>

    </body>
</html>