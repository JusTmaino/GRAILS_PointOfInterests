<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <div class="panel panel-primary">
                <div class="panel-heading">${this.image.filename} details</div>
                <div class="panel-body">
                    <ol class="property-list image">

                        <div class="form-group">
                            <asset:image src="${this.image.filename}" class="img-circle" width="100" height="100" alt="Image"/>
                        </div>

                        <div style="padding-left: 120px ">
                        <div class="form-group">
                            <label>Filename : </label> <span>${this.image.filename}</span>
                        </div>

                        <div class="form-group">
                            <label>Date Created : </label> <span>${this.image.date_created}</span>
                        </div>
                        </div>

                    </ol>

                </div>
                <div class="panel-footer">
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <form action="/image/delete/${this.image.id}" method="post" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                            <fieldset class="box-footer">
                                <input class="btn btn-danger" type="submit" value="Delete" onclick="return confirm('Are you sure to delete this image?');" />
                                <input class="btn btn-primary" type="button" onclick="window.location='/image/edit/${this.image.id}';" value="Edit">
                            </fieldset>
                        </form>
                    </sec:ifAnyGranted>
                </div>
            </div>
        </div>
    </div>
        <!-- /.form-->
</body>
</html>
