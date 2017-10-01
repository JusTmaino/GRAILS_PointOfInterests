<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
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
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Create an image</div>
                <div class="panel-body">
                    <div id="create-image" class="content scaffold-create" role="main">
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
                        <g:uploadForm resource="${this.image}" method="POST">
                            <fieldset class="form">
                                <f:all bean="image"/>
                            </fieldset>
                            <div id="dragandrophandler">drag & drop files here</div>
                            <br><br>
                            <div id="status1"></div>
                            <fieldset class="buttons">
                                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </fieldset>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function sendFileToServer(formData,status) {
            var uploadURL ="/Applications/MAMP/htdocs/images/"; //Upload URL
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
