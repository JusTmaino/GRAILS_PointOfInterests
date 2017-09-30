<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">POINTS OF INTERESTS</h1>
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
            <div class="panel panel-default">
                <div class="panel-heading">${this.point.name} details</div>
                <div class="panel-body">
                    <div id="show-point" class="content scaffold-show" role="main">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <f:display bean="point" />
                    </div>
                </div>
                <div class="panel-footer">
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <g:form resource="${this.point}" method="DELETE">
                            <fieldset class="buttons">
                                <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:link class="edit btn btn-primary"  action="edit" resource="${this.point}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            </fieldset>
                        </g:form>
                    </sec:ifAnyGranted>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Map location
                </div>
                <div class="panel-body">
                    <div id="map"></div>
                    <script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

                    <script type="text/javascript">
                        if("${this.point.location[0]}" != [] ) {
                            function initMap() {
                                var localisation = {
                                    info: '<strong style="color:black">${this.point.name}</strong><br>\
                                            <g:each in="${this.point.images}" var="image">\n' +
                                    '  <img src="${grailsApplication.config.urlImage}/${image.filename}" width="20" height="20"/></li>\n' +
                                    '   </g:each>',
                                };
                                    var locations = [
                                        [localisation.info, "${this.point.location[0].latitude}" , "${this.point.location[0].longitude}"],
                                    ];

                                    var map = new google.maps.Map(document.getElementById('map'), {
                                        zoom: 4,
                                        center: new google.maps.LatLng(${this.point.location[0].latitude},${this.point.location[0].longitude}),
                                        mapTypeId: google.maps.MapTypeId.ROADMAP
                                    });
                                var infowindow = new google.maps.InfoWindow({});

                                var marker, i;

                                for (i = 0; i < locations.length; i++) {
                                    marker = new google.maps.Marker({
                                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                        map: map,
                                        draggable: true
                                    });

                                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                        return function () {
                                            infowindow.setContent(locations[i][0]);
                                            infowindow.open(map, marker);
                                        }
                                    })(marker, i));
                                    google.maps.event.addListener(marker, 'dragend', function (event) {
                                        document.getElementById("lat").value = event.latLng.lat();
                                        document.getElementById("long").value = event.latLng.lng();
                                    });
                                }
                                google.maps.event.addDomListener(window, "load", initialize());
                            }
                        }
                    </script>
                    <div><label>Latitude</label><input id="lat" value="${this.point.location[0].latitude}" type="text" name="latitude"></div>
                    <div><label>Longitude</label><input id="long" value="${this.point.location[0].longitude}" type="text" name="longitude"></div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</body>
</html>
