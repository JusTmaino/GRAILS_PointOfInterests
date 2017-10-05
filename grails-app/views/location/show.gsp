<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<!--/.title-->
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">LOCATIONS</h3>
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
            <div class="panel-heading">${this.location.name} details</div>
            <div class="panel-body">

                <ol class="property-list location">

                    <div class="form-group">
                        <label>Name </label> : <span> ${this.location.name}</span>
                    </div>

                    <div class="form-group">
                        <label>Latitude </label> : <span> ${this.location.latitude}</span>
                    </div>

                    <div class="form-group">
                        <label>Longitude </label> : <span> ${this.location.longitude}</span>
                    </div>

                </ol>
            </div>
            <div class="panel-footer">
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <form action="/location/delete/${this.location.id}" method="post" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                        <fieldset class="buttons">
                            <input class="btn btn-danger" type="submit" value="Delete" onclick="return confirm('Are you sure to delete this location?');" />
                            <input class="btn btn-primary" type="button" onclick="window.location='/location/edit/${this.location.id}';" value="Edit">
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
