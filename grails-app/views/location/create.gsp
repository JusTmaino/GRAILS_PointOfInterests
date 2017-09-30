<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<!--/.title-->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">LOCATIONS</h1>
    </div>
</div>
<!--/.title-->

<!-- /.form -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading"><g:message code="default.create.label" args="[entityName]" /></div>
            <div class="panel-body">
                <div id="create-location" class="content scaffold-create" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.location}">
                    </g:hasErrors>
                    <g:form resource="${this.location}" method="PUT">
                        <fieldset class="form">
                            <div class="col s12 m12 l12">
                                <label>Name</label>
                                <input value="${this.location.name}" type="text" name="name" value="" required="" id="nom" >
                            </div>
                            <div class="col s12 m12 l12">
                                <label>Latitude</label>
                                <input value="${this.location.latitude}" type="text" name="latitude" value="" required="" id="lat" >
                            </div>
                            <div class="col s12 m12 l12">
                                <label>Longitude</label>
                                <input value="${this.location.longitude}" type="text" name="longitude" value="" required="" id="long" >
                            </div>
                            <div class="col s12 m12 l12">
                                <label>Altitude</label>
                                <input value="${this.location.altitude}" type="text" name="altitude" value="" required="" id="alt" >
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.create.label', default: 'create')}" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
        <ul>
            <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>
<!-- /.form-->

</body>
</html>
