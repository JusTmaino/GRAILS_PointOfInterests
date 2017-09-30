<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
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
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">Create a point</div>
                <div class="panel-body">
                    <div id="create-point" class="content scaffold-create" role="main">
                        <g:if test="${flash.message}">  ${this.point.location} = "${grails_pointofinterests.Location.all.getAt(0)}";
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.point}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.point}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                        <g:uploadForm resource="${this.point}" method="POST">
                            ${this.point.location} = "${grails_pointofinterests.Location.all.getAt(0)}";
                            <div class="col s12 m12 l12">
    <label>Géolocalisation</label>
    <div id="map"></div>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
    <script type="text/javascript">
        function initMap() {

            var broadway = {
                info: '<strong>${this.point.name}</strong><br>\
					                 ',
                                            lat: 39.0,
                                            long: 30.0
                            };

                            var locations = [
                                [broadway.info, broadway.lat, broadway.long, 0],
                            ];

                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 4,
                                center: new google.maps.LatLng(39.0, 30.0),
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
                            <fieldset class="form">
                                <div class="col s12 m12 l12">
                                    <label>Nom</label>
                                    <input type="text" name="name" value="" required="" id="name">
                                </div>
                                <div class="col s12 m12 l12">
                                    <label>Description</label>
                                    <input type="text" name="description" value="" id="description">
                                </div>
                                <div class="col s12 m12 l12">
                                    <label>Location </label>
                                    <div class="col s12 m12 l12" >
                                        <span style = "margin-left: 60px">Name</span>
                                        <input value="" type="text" name="name" value="" required="" id="nom" >
                                    </div>
                                    <div class="col s12 m12 l12">
                                        <span style = "margin-left: 60px">Latitude</span>
                                        <input value=15.0 type="text" name="latitude" value="" required="" id="lat" >
                                    </div>
                                    <div class="col s12 m12 l12">
                                        <span style = "margin-left: 60px">Longitude</span>
                                        <input value=12.0 type="text" name="longitude" value="" required="" id="long" >
                                    </div>
                                </div>

                                <div class="col s12 m12 l12">
                                    <label>Groupe</label>
                                    <g:select name="groups"
                                              from="${grails_pointofinterests.Groupe.all}"
                                              value="${grails_pointofinterests.Groupe.all.getIndices()}"
                                              optionKey="id"
                                              multiple="true"/>
                                </div>
                            </fieldset>
                            <a class="waves-effect waves-light btn right"><input type="submit" name="create" class="save" value="Create" id="create"></a>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->

    </body>
</html>
