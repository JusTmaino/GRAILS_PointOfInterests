<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">GROUPS</h3>
        </div>
    </div>
    <!--/.title-->

    <div class="row">
        <div>
            <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">${this.groupe.name} details</div>
                <div class="panel-body">

                    <ol class="property-list point">

                        <div class='form-group'>
                            <label>Name </label> : <span> ${this.groupe.name}</span>
                        </div>

                        <div class='form-group'>
                            <label>Description </label> : <span> ${this.groupe.description}</span>
                        </div>

                        <div class='form-group'>
                            <label>Points d'intérêts</label>
                            <ul>
                                <g:each in="${this.groupe.points}" var="point">
                                    <li><a href="/point/show/${point.id}">${point.name}</a></li>
                                </g:each>
                            </ul>
                        </div>

                        <div class='form-group'>
                            <label>Images</label>
                            <ul>
                                <g:each in="${this.groupe.images}" var="img">
                                    <a href="/image/show/${img.id}"><asset:image src="${img.filename}" width="50px" height="50px"/></a>
                                </g:each>
                            </ul>
                        </div>

                    </ol>
                </div>
                <div class="panel-footer">
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <g:form resource="${this.groupe}" method="DELETE">
                            <fieldset class="buttons">
                                <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:link class="edit btn btn-primary"  action="edit" resource="${this.groupe}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            </fieldset>
                        </g:form>
                    </sec:ifAnyGranted>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Map location
                </div>
                <div class="panel-body">
                    <div id="map"></div>
                    <script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                    <script async defer
                            src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                    <script type="text/javascript">
                        function initMap() {

                            var localisation = {
                                info: '<strong>${this.groupe.points.name}</strong><br>\
                        <g:each in="${this.groupe.points.images}" var="image">\n' +
                                '                </g:each>',
                            };

                            var locations = [
                                [localisation.info, ${this.groupe.points.location[0].latitude[0]} , ${this.groupe.points.location[0].longitude[0]}],
                            ];
                            <g:each in="${this.groupe.points}" var="point">
                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 2,
                                center: new google.maps.LatLng(${point.location.latitude[0]},
                                    ${point.location.longitude[0]}),
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            });
                            </g:each>
                            var infowindow = new google.maps.InfoWindow({});

                            var marker, i;
                            <g:each in="${this.groupe.points}" var="point">
                            for (i = 0; i < locations.length; i++) {
                                marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(${point.location.latitude[0]},
                                        ${point.location.longitude[0]}),
                                    map: map,
                                });

                                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                    return function () {
                                        infowindow.setContent(locations[i][0]);
                                        infowindow.open(map, marker);
                                    }
                                })(marker, i));
                            }

                            </g:each>
                            google.maps.event.addDomListener(window, "load", initialize());

                        }
                    </script>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</body>
</html>
