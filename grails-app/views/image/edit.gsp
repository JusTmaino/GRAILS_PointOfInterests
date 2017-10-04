<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="style.css" rel="stylesheet" type="text/css">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:if env="development">
        <asset:stylesheet src="ajax_manager/dragndrop_upload.css"/>
    </g:if>
</head>
<body>
<!--/.title-->
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">IMAGES</h3>
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
        <div class="panel panel-default">
            <div class="panel-heading">Edit : ${this.image.filename}</div>
            <div class="panel-body">
                <form action="/image/update/${this.image.id}" method="post" enctype="multipart/form-data" ><input type="hidden" name="_method" value="PUT" id="_method" />
                    <fieldset class="form">
                        <div class='form-group'>
                            <label for='filename'>Filename * </label>
                            <input type="text" disabled class="form-control" name="filename" value="" required="" id="filename" />
                        </div>
                    </fieldset>

                    <div id="dragandrophandler">
                        <input type="file" class="form-control" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>
                        <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/> or drag & drop file here</div>
                    <br><br>
                    <div id="status1"></div>

                    <fieldset class="box-footer">
                        <input class="save btn btn-primary" type="submit" value="Update" />
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