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
        <div class="row">
            <div>
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Create an image</div>
                    <div class="panel-body">
                        <form action="/image/save" method="post" enctype="multipart/form-data" >
                            <input type="file" id="dragandrophandler"  name="fileupload">
                                <input type="file" class="form-control" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>
                                <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/>
                                or drag & drop file here</input>
                            <br><br>
                            <div id="status1"></div>

                            <fieldset class="form">
                                <div class='fieldcontain required'>
                                    <label for='filename' style="margin-right: 10px">Filename
                                        <span class='required-indicator'>* </span>
                                    </label><input type="text" name="filename" value="" required="" id="filename" style="margin-bottom: 30px"/>
                                </div>
                            </fieldset>

                            <fieldset class="box-footer">
                                <input type="submit" name="create" class="save btn btn-primary" value="Create" id="create" />
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