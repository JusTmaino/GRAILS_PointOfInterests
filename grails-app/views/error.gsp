<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>

    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
    <!-- /.CONTENT-->

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <g:if env="development">
                    <g:if test="${Throwable.isInstance(exception)}">
                        <g:renderException exception="${exception}" />
                    </g:if>
                    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
                        <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}" />
                    </g:elseif>
                    <g:else>
                        <ul class="errors">
                            <li>An error has occurred</li>
                            <li>Exception: ${exception}</li>
                            <li>Message: ${message}</li>
                            <li>Path: ${path}</li>
                        </ul>
                    </g:else>
                </g:if>
                <g:else>
                    <ul class="errors">
                        <li>An error has occurred</li>
                    </ul>
                </g:else>
            </div>
        </div>
</body>
</html>
