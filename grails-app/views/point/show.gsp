    <!DOCTYPE html>
    <html>
        <head>
            <meta name="layout" content="main" />
            <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
            <title><g:message code="default.show.label" args="[entityName]" /></title>
        </head>
        <body>
        <!-- /.CONTENT-->
        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">

            <!--/.title-->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">My profile</h1>
                </div>
            </div>
            <!--/.title-->

            <!-- /.form -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Details</div>
                        <div class="panel-body">
                            <a href="#show-point" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                            <div id="map"></div>
                            <script async defer
                                    src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>


                            <script type="text/javascript">
                                function initMap() {

                                    var localisation = {
                                        info: '<strong>${this.point.name}</strong><br>\
                        <g:each in="${this.point.images}" var="image">\n' +
                                        '                    <g:img dir="images" file="${image.filename}" width="10" height="10"/></li>\n' +
                                        '                </g:each>',
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
                                            draggable:true
                                        });

                                        google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                            return function () {
                                                infowindow.setContent(locations[i][0]);
                                                infowindow.open(map, marker);
                                            }
                                        })(marker, i));
                                        google.maps.event.addListener(marker, 'dragend', function (event) {
                                            this.point.location[0].latitude = 22;
                                            this.point.location[0].longitude = event.latLng.lng();
                                            document.getElementById("lat").value = this.point.location[0].latitude;
                                            document.getElementById("long").value = ${this.point.location[0].longitude};
                                        });
                                    }console.log("test ===>",${this.point.location[0].longitude});

                                    google.maps.event.addDomListener(window, "load", initialize());

                                }
                            </script>

                            <div class="nav" role="navigation">
                                <ul>
                                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                    <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                </ul>
                            </div>
                            <div><input id="lat" value="${this.point.location[0].latitude}" type="text" name="latitude"></div>
                            <div><input id="long" value="${this.point.location[0].longitude}" type="text" name="longitude"></div>
                            <div id="show-point" class="content scaffold-show" role="main">
                                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <f:display bean="point" />
                                <g:form resource="${this.point}" method="DELETE">
                                    <fieldset class="buttons">
                                        <g:link class="edit" action="edit" resource="${this.point}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                    </fieldset>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.form-->
        </div>

        </body>
    </html>
