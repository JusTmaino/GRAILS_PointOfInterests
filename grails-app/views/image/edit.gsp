<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="style.css" rel="stylesheet" type="text/css">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:if env="development">
        <asset:stylesheet src="image.css"/>
    </g:if>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
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
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
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
                        <g:uploadForm resource="${this.image}" method="PUT">
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
                            <div id="dragandrophandler"> <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/> or drag & drop file here</div>
                            <br><br>
                            <div id="status1"></div>
                            <fieldset class="buttons">
                                <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                            </fieldset>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function sendFileToServer(formData,status) {
            var uploadURL ="http://localhost:8080/images"; //Upload URL
            var extraData ={}; //Extra Data.
            var jqXHR=$.ajax({
                xhr: function() {
                    var xhrobj = $.ajaxSettings.xhr();
                    if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function(event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                        }, false);
                    }
                    return xhrobj;
                },
                url: uploadURL,
                type: "POST",
                contentType:false,
                processData: false,
                cache: false,
                data: formData,
                success: function(data){
                    status.setProgress(100);

                    $("#status1").append("File upload Done<br>");
                }
            });

            status.setAbort(jqXHR);
        }

        var rowCount=0;
        function createStatusbar(obj) {
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            this.statusbar = $("<div class='statusbar "+row+"'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'>Abort</div>").appendTo(this.statusbar);
            obj.after(this.statusbar);

            this.setFileNameSize = function(name,size) {
                var sizeStr="";
                var sizeKB = size/1024;
                if(parseInt(sizeKB) > 1024) {
                    var sizeMB = sizeKB/1024;
                    sizeStr = sizeMB.toFixed(2)+" MB";
                } else {
                    sizeStr = sizeKB.toFixed(2)+" KB";
                }

                this.filename.html(name);
                this.size.html(sizeStr);
                $("#filename").val(name);
            }
            this.setProgress = function(progress) {
                var progressBarWidth =progress*this.progressBar.width()/ 100;
                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                if(parseInt(progress) >= 100) {
                    this.abort.hide();
                }
            }
            this.setAbort = function(jqxhr) {
                var sb = this.statusbar;
                this.abort.click(function() {
                    jqxhr.abort();
                    sb.hide();
                });
            }
        }
        function handleFileUpload(files,obj) {
            for (var i = 0; i < files.length; i++) {
                var fd = new FormData();
                fd.append('file', files[i]);

                var status = new createStatusbar(obj); //Using this we can set progress.
                status.setFileNameSize(files[i].name,files[i].size);
                sendFileToServer(fd,status);
            }
        }
        $(document).ready(function() {
            var obj = $("#dragandrophandler");
            obj.on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
                $(this).css('border', '2px solid #0B85A1');
            });
            obj.on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            obj.on('drop', function (e) {

                $(this).css('border', '2px dotted #0B85A1');
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;

                //We need to send dropped files to Server
                handleFileUpload(files,obj);
            });
            $(document).on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
                obj.css('border', '2px dotted #0B85A1');
            });
            $(document).on('drop', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
        });
    </script>

</body>
</html>
