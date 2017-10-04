<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">GROUPS</h3>
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
                <div class="panel-heading">Edit : ${customGroupe.name}</div>
                <div class="panel-body">
                    <form action="/groupe/update/${customGroupe.id}" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="_method" value="PUT" id="_method" />
                        <input type="hidden" name="version" value="1" id="version" />
                        <fieldset class="form">

                            <div class='form-group'>
                                <label for='name'>Name *</label>
                                <input type="text" class="form-control" name="name" value="${customGroupe.name}" required="" id="name" />
                            </div>

                            <div class='form-group'>
                                <label for='description'>Description *</label>
                                <input type="text" class="form-control" name="description" value="${customGroupe.description}" required="" id="description" />
                            </div>

                            <div class='form-group'>
                                <label for='point'>Points</label>
                                <ul>
                                    <g:each in="${customGroupe.points}" var="pt">
                                        <li><a href="/point/show/${pt.id}">${pt.name}</a></li>
                                    </g:each>
                                </ul>
                                <g:select name="pointID" class="form-control" required="" id="point" optionKey="id"  optionValue="name" from="${customPointList}"  ></g:select>
                                <a href="/point/create?groupe.id=${customGroupe.id}">Add Point</a>

                            </div>

                            <div class='form-group'>
                                <label for='image'>Images</label>
                                <ul>
                                    <g:each in="${customGroupe.images}" var="img">
                                        <a href="/image/show/${img.id}"><asset:image src="${img.filename}" width="50px" height="50px"/></a>
                                    </g:each>
                                </ul>
                                <g:select name="imageID" class="form-control" required="" id="image" optionKey="id" optionValue="filename" from="${customimageList}"  ></g:select>
                                <a href="/image/create?groupe.id=${customGroupe.id}">Add Image</a>
                            </div>
                        </fieldset>

                        <fieldset class="box-footer">
                            <input class="save btn btn-primary" type="submit" value="Update" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->


    </body>
</html>
