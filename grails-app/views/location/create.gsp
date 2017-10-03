<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
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
            <div class="panel-heading"><g:message code="default.create.label" args="[entityName]"/></div>

            <div class="panel-body">
                <form action="/location/save" method="post">
                    <fieldset class="form">
                        <div class="col s12 m12 l12">
                            <label>Géolocalisation</label>

                            <div id="map"></div>
                            <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                            <script type="text/javascript">
                                function initMap() {

                                    var location = {
                                        info: '<strong></strong><br>\
					                 ',
                                        lat: 37.0,
                                        long: -4.0
                                    };

                                    var locations = [
                                        [location.info, location.lat, location.long, 0],
                                    ];

                                    var map = new google.maps.Map(document.getElementById('map'), {
                                        zoom: 4,
                                        center: new google.maps.LatLng(37.0, -4.0),
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
                                    }
                                    google.maps.event.addListener(marker, 'dragend', function (event) {
                                        document.getElementById("lat").value = event.latLng.lat();
                                        document.getElementById("long").value = event.latLng.lng();
                                    });
                                }

                                google.maps.event.addDomListener(window, "load", initialize());

                                function bugfix() {
                                    document.getElementById("lat").value = document.getElementById("lat").value.replace(".", ",");
                                    document.getElementById("long").value = document.getElementById("long").value.replace(".", ",");
                                }
                            </script>
                        </div>

                        <div class="form-group">
                            <label>Name</label>
                            <input value="" class="form-control" type="text" name="name" value="" required="" id="nom">
                        </div>

                        <div class="form-group">
                            <label>Latitude</label>
                            <input class="form-control" type="text" name="latitude" value="" required="" id="lat">
                        </div>

                        <div class="form-group">
                            <label>Longitude</label>
                            <input class="form-control" type="text" name="longitude" value="" required="" id="long">
                        </div>
                    </fieldset>
                    <fieldset class="box-footer">
                        <input onClick="bugfix()" class="save btn btn-primary" type="submit" value="Create"/>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>


</form>
</div>
</div>
</div>
<g:hasErrors bean="${this.location}">
</g:hasErrors>

<g:form resource="${this.location}" method="PUT">

</g:form>
</div>
</div>
</div>
<ul>
    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
</ul>
</div>
</div>
<!-- /.form-->

</body>
</html>