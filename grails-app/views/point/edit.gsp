    <!DOCTYPE html>
    <html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <a href="#edit-point" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
    <label>Localisation</label>
    <div id="map"></div>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>


    <script type="text/javascript">
        function initMap() {

            var localisation = {
                info: '<strong>${this.point.name}</strong><br>\
                        <g:each in="${this.point.images}" var="image">\n' +
                '                    <g:img dir="images" file="${image.path}" width="40" height="40"/></li>\n' +
                '                </g:each>',
                lat: 17,
                long: 47
            };

            var locations = [
                [localisation.info, "${this.point.location[0].latitude}", "${this.point.location[0].longitude}"],
            ];

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 4,
                center: new google.maps.LatLng("${this.point.location[0].latitude}", "${this.point.location[0].longitude}"),
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
        }
        google.maps.event.addDomListener(window, "load", initialize());

    </script>
    <div><input id="lat" value="${this.point.location[0].latitude}" type="text" name="latitude"></div>
    <div><input id="long" value="${this.point.location[0].longitude}" type="text" name="longitude"></div>
    <div id="edit-point" class="content scaffold-edit" role="main">
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.point}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.point}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form resource="${this.point}" method="PUT">
            <g:hiddenField name="version" value="${this.point?.version}" />
            <fieldset class="form">
                <f:all bean="point"/>
            </fieldset>
            <fieldset class="buttons">
                <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            </fieldset>
        </g:form>
    </div>
    </body>
    </html>
