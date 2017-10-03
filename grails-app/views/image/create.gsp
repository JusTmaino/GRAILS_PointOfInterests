<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:if env="development">
        <asset:stylesheet src="ajax_manager/dragndrop_upload.css"/>
        <asset:javascript src="ajax_manager/dragndrop_upload.js"/>
        <asset:javascript src="ajax_manager/upload_file.js"/>
    </g:if>
</head>
<body>
 <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">IMAGES</h1>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div>
            <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Create an image</div>
                <div class="panel-body">
                    <form action="/image/save" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="date_created" id="date_created" var="today" value="${new Date()}" />
                        <input type="hidden" name="filename" id="filename"/>

                        <input type="file" class="form-control" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>

                        <div id="dragandrophandler">
                            <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/> drag & drop files here
                        </div>

                        <br><br>

                        <div id="status1"></div>

                        <fieldset class="buttons">
                            <input type="submit" name="create" class="save btn btn-primary" value="Create" id="create" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
