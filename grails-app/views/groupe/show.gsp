<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <a href="#show-point" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div id="map"></div>
    <script async defer
            src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>


    <script type="text/javascript">
        function initMap() {

            var localisation = {
                info: '<strong>${this.groupe.points.name}</strong><br>\
                        <g:each in="${this.groupe.points.images}" var="image">\n' +
                '                    <g:img dir="images" file="${image.path}" width="10" height="10"/></li>\n' +
                '                </g:each>',
            };

            var locations = [
                [localisation.info, ${this.groupe.points.location[0].latitude[0]} , ${this.groupe.points.location[0].longitude[0]}],
            ];
            <g:each in="${this.groupe.points}" var="point">
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 4,
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
                });
            }

            </g:each>
            google.maps.event.addDomListener(window, "load", initialize());

        }
    </script>


    <a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-groupe" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="groupe" />
            <g:form resource="${this.groupe}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.groupe}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
