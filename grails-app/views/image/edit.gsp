<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
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
                            </script>

                            <input type="file" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"
                                   onchange="document.my_im.src=this.value;"/>
                            <input type="button" value="Click to select file" id="fakeBrowse" onclick="HandleBrowseClick();"/>
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
