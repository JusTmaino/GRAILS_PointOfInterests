<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Page Not Found</title>
    <g:if env="development">
        <asset:stylesheet src="errors.css"/>
    </g:if>
</head>
<body>
        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <ul class="errors">
                    <li>Error: Page Not Found (404)</li>
                    <li>Path: ${request.forwardURI}</li>
                </ul>
            </div>
        </div>
</body>
</html>
