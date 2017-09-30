<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <div>
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                </sec:ifAnyGranted>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Edit : ${this.location.name}</div>
                    <div class="panel-body">
                        <div id="edit-location" class="content scaffold-edit" role="main">
                            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <div class="col s12 m12 l12">
                                <label>Géolocalisation</label>
                                <div id="map"></div>
                                <script async defer
                                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                                <script type="text/javascript">
                                    function initMap() {

                                        var broadway = {
                                            info: '<strong>${this.location.name}</strong><br>\
					                 ',
                                            lat: ${this.location.latitude},
                                            long: ${this.location.longitude}
                                        };

                                        var locations = [
                                            [broadway.info, broadway.lat, broadway.long, 0],
                                        ];

                                        var map = new google.maps.Map(document.getElementById('map'), {
                                            zoom: 4,
                                            center: new google.maps.LatLng(${this.location.latitude}, ${this.location.longitude}),
                                            mapTypeId: google.maps.MapTypeId.ROADMAP
                                        });

                                        var infowindow = new google.maps.InfoWindow({});

                                        var marker, i;

                                        for (i = 0; i < locations.length; i++) {
                                            marker = new google.maps.Marker({
                                                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                                map: map,
                                                draggable:true
                                            });

                                            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                                return function () {
                                                    infowindow.setContent(locations[i][0]);
                                                    infowindow.open(map, marker);
                                                }
                                            })(marker, i));
                                        }
                                        google.maps.event.addListener(marker, 'dragend', function (event) {
                                            document.getElementById("lat").value = event.latLng.lat();
                                            document.getElementById("long").value = event.latLng.lng();
                                        });
                                    }
                                    google.maps.event.addDomListener(window, "load", initialize());

                                    function bugfix() {
                                        document.getElementById("lat").value = document.getElementById("lat").value.replace(".", ",");
                                        document.getElementById("long").value = document.getElementById("lat").value.replace(".", ",");
                                    }
                                </script>
                            </div>
                            <g:hasErrors bean="${this.location}">
                            </g:hasErrors>


                            <g:form resource="${this.location}" method="PUT">
                                <g:hiddenField name="version" value="${this.location?.version}" />
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
                                <fieldset class="buttons">
                                    <input onClick="bugfix()" class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
                <ul>
                </ul>
            </div>
        </div>
        <!-- /.form-->

    </body>
</html>
