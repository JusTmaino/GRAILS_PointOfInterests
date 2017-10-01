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
                            <ul>
                                <g:each in="${customPoint.location}" var="location">
                                    <li><a href="/location/show/${location.id}">${location.name}</a></li>
                                </g:each>
                            </ul>
                            <g:select name="locationID" class="form-control" required="" id="point" optionKey="id" from="${customLocationList}"  ></g:select>
                            <a href="/location/create?point.id=${customPoint.id}">Add Location</a>

                        </div>

                        <div class='form-group'>
                            <label for='image'>Images</label>
                            <ul>
                                <g:each in="${customPoint.images}" var="img">
                                    <a href="/image/show/${img.id}"><asset:image src="${img.filename}" width="50px" height="50px"/></a>
                                </g:each>
                            </ul>
                            <g:select name="imageID" class="form-control" required="" id="image" optionKey="id" from="${customImageList}"  ></g:select>
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
