<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:if env="development">
        <asset:stylesheet src="ajax_manager/dragndrop_upload.css"/>
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
                <form action="/image/save" method="post" >
                    <div class="form">
                        <div class='form-group'>
                            <label for='filename'>Filename * </label>
                            <input type="text" disabled class="form-control" name="filename" value="" required="" id="filename" />
                        </div>
                    </div>

                    <div id="dragandrophandler">
                        <input type="file" class="form-control" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>
                        <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/> or drag & drop file here</div>
                    <br><br>
                    <div id="status1"></div>

                    <fieldset class="box-footer">
                        <input class="save btn btn-primary" type="submit" value="Create" />
                    </fieldset>
                </form>

            </div>
        </div>
    </div>
</div>
<g:if env="development">
    <asset:javascript src="ajax_manager/dragndrop_upload.js"/>
    <asset:javascript src="ajax_manager/upload_file.js"/>
</g:if>
</body>
</html>
