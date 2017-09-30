<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="style.css" rel="stylesheet" type="text/css">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Edit : ${this.image.filename}</div>
                <div class="panel-body">
                    <div id="edit-image" class="content scaffold-edit" role="main">
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.image}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.image}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                        <g:form resource="${this.image}" method="PUT">
                            <g:hiddenField name="version" value="${this.image?.version}" />
                            <fieldset class="form">
                                <f:all bean="image"/>
                            </fieldset>

                            <script language="JavaScript" type="text/javascript">
                                function HandleBrowseClick()
                                {
                                    var fileinput = document.getElementById("browse");
                                    fileinput.click();
                                }
                                function Handlechange()
                                {
                                    var fileinput = document.getElementById("browse");
                                    var textinput = document.getElementById("filename");
                                    textinput.value = fileinput.value;
                                }
                                $(function() {

                                    // preventing page from redirecting
                                    $("html").on("dragover", function(e) {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        $("h1").text("Drag here");
                                    });

                                    $("html").on("drop", function(e) { e.preventDefault(); e.stopPropagation(); });

                                    // Drag enter
                                    $('.upload-area').on('dragenter', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        $("h1").text("Drop");
                                    });

                                    // Drag over
                                    $('.upload-area').on('dragover', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        $("h1").text("Drop");
                                    });

                                    // Drop
                                    $('.upload-area').on('drop', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();

                                        $("h1").text("Upload");

                                        var file = e.originalEvent.dataTransfer.files;
                                        var fd = new FormData();

                                        fd.append('file', file[0]);

                                        uploadData(fd);
                                    });

                                    // Open file selector on div click
                                    $("#uploadfile").click(function(){
                                        $("#file").click();
                                    });

                                    // file selected
                                    $("#file").change(function(){
                                        var fd = new FormData();

                                        var files = $('#file')[0].files[0];

                                        fd.append('file',files);

                                        uploadData(fd);
                                    });
                                });

                                // Sending AJAX request and upload file
                                function uploadData(formdata){

                                    $.ajax({
                                        url: 'upload.php',
                                        type: 'post',
                                        data: formdata,
                                        contentType: false,
                                        processData: false,
                                        dataType: 'json',
                                        success: function(response){
                                            addThumbnail(response);
                                        }
                                    });
                                }

                                // Added thumbnail
                                function addThumbnail(data){
                                    $("#uploadfile h1").remove();
                                    var len = $("#uploadfile div.thumbnail").length;

                                    var num = Number(len);
                                    num = num + 1;

                                    var name = data.name;
                                    var size = convertSize(data.size);
                                    var src = data.src;

                                    // Creating an thumbnail
                                    $("#uploadfile").append('<div id="thumbnail_'+num+'" class="thumbnail"></div>');
                                    $("#thumbnail_"+num).append('<img src="'+src+'" width="100%" height="78%">');
                                    $("#thumbnail_"+num).append('<span class="size">'+size+'<span>');

                                }

                                // Bytes conversion
                                function convertSize(size) {
                                    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
                                    if (size == 0) return '0 Byte';
                                    var i = parseInt(Math.floor(Math.log(size) / Math.log(1024)));
                                    return Math.round(size / Math.pow(1024, i), 2) + ' ' + sizes[i];
                                }
                            </script>

                            <input type="file" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>
                            <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/>
                            <fieldset class="buttons">
                                <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
            <div class="nav" role="navigation">
                <ul>
                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
