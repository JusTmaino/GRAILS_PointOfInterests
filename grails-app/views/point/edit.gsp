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
        <h3 class="page-header">POINTS OF INTERESTS</h3>
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
        <div class="panel panel-primary">
            <div class="panel-heading">Edit ${customPoint.name}</div>
            <div class="panel-body">

                <form action="/point/update/${customPoint.id}" method="post" enctype="multipart/form-data" >
                    <input type="hidden" name="_method" value="PUT" id="_method" />
                    <input type="hidden" name="version" value="${customPoint.id}" id="version" />

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

                        <div class="form-group">
                            <label>Name</label>
                            <input class="form-control" value="${customPoint.name}" type="text" name="name" required="" id="nom" >
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <input class="form-control" value="${customPoint.description}" type="text" name="description" required="" id="desc" >
                        </div>

                        <div class='form-group'>
                            <label for='point'>Location</label>
                            <ul style="list-style-type:none;">
                                <g:each in="${customPoint.location}" var="location">
                                    <li>
                                        <g:link action="removeLocation" controller="point" params='[locationID : "${location.id}",pointID : "${customPoint.id}"]' ><i class="fa fa-times" style="color: red;" aria-hidden="true"></i></g:link>
                                        <a href="/location/show/${location.id}" style="padding-left: 10px;">${location.name}</a>
                                    </li>
                                </g:each>
                            </ul>
                            <g:if test="${customPoint.location}">
                                <g:select multiple="multiple" name="locationID" class="form-control" id="point" optionKey="id" optionValue="name" from="${customLocationList}"  ></g:select>
                            </g:if>
                            <g:else>
                                <g:select multiple="multiple" name="locationID" class="form-control" required="" id="point" optionKey="id" optionValue="name" from="${customLocationList}"  ></g:select>
                            </g:else>

                            <a href="/location/create?point.id=${customPoint.id}">Add Location</a>

                        </div>

                        <div class='form-group'>
                            <label for='image'>Images</label>
                            <ul style="list-style-type:none;">
                                <g:each in="${customPoint.images}" var="img">
                                    <a href="/image/show/${img.id}">
                                        <img src="${grailsApplication.config.server.pathServer}/${img.filename}" width="50px" height="50px"/></a>
                                </g:each>
                            </ul>
                            <g:select multiple="multiple" name="imageID" class="form-control" id="image" optionKey="id" optionValue="filename" from="${customImageList}"  ></g:select>
                            <a href="/image/create?point.id=${customPoint.id}">Add Image</a>
                        </div>

                </div>
                    <fieldset class="box-footer">
                        <input class="save btn btn-primary" type="submit" value="Update" />
                    </fieldset>
                </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /.form-->


</body>
</html>
