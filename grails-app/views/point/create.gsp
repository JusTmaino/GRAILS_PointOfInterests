<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
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
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Create a point</div>
                <div class="panel-body">
                        <g:if test="${flash.message}">  ${this.point.location} = "${grails_pointofinterests.Location.all.getAt(0)}";
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.point}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.point}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                    <form action="/point/save" method="post" enctype="multipart/form-data" >
                            <fieldset class="form">

                                <div class="form-group">
                                    <label>Nom</label>
                                    <input class="form-control" type="text" name="name" value="" required="" id="name">
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="form-control" type="text" name="description" value="" id="description">
                                </div>
                                <div class="form-group">
                                    <label>Location </label>
                                    <g:select multiple="multiple" name="LocationID" class="form-control" required="" id="location" optionKey="id" optionValue="name" from="${grails_pointofinterests.Location.all}"  ></g:select>
                                    <a href="/location/create?point.id=${this.point.id}">Add Location</a>
                                </div>

                                <div class="form-group">
                                    <label>Images</label>
                                    <g:select multiple="multiple" type="file" name="imageID" class="form-control" id="image" optionKey="id" optionValue="filename" from="${grails_pointofinterests.Image.all}"  ></g:select>
                                    <a href="/image/create?point.id=${this.point.id}">Add Image</a>
                                </div>

                                <div class="form-group">
                                    <label>Groupe</label>
                                    <g:select name="groupeID" class="form-control" required="" id="groupe" optionKey="id" optionValue="name" from="${grails_pointofinterests.Groupe.all}"  ></g:select>
                                    <a href="/groupe/create?point.id=${this.point.id}">Add Groupe</a>
                                </div>
                            </fieldset>

                        <fieldset class="box-footer">
                            <input class="save btn btn-primary" name="create" type="submit" value="Create" id="create" />
                        </fieldset>
                         </form>
                    <!--g:uploadForm name="upload" action="upload" method="POST">
                        <input type="file" name="file" /-->
                    <!--/g:uploadForm-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->

    </body>
</html>
