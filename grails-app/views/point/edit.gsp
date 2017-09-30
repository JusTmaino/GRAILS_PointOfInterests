<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<!-- /.CONTENT-->

<!--/.title-->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">POINTS OF INTERESTS</h1>
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
            <div class="panel-heading">Edit</div>
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
            <div class="panel-body">
                <div id="edit-point" class="content scaffold-edit" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.point}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.point}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form resource="${this.point}" method="PUT">
                        <g:hiddenField name="version" value="${this.point?.version}" />
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

                        <div class="col s12 m12 l12">
                            <label>Name</label>
                            <input value="${this.point.name}" type="text" name="name" value="" required="" id="nom" >
                        </div>
                            <div class="col s12 m12 l12">
                                <label>Description</label>
                                <input value="${this.point.description}" type="text" name="description" value="" required="" id="desc" >
                            </div>
                        </div>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /.form-->


</body>
</html>
