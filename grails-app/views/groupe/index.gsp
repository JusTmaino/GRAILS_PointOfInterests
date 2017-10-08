<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

    <g:if env="development">
        <asset:javascript src="ajax_manager/dragndrop_sortable.js"/>
        <asset:stylesheet src="ajax_manager/dragndrop_sortable.css"/>
    </g:if>

</head>

<body>
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header">GROUPS</h3>
    </div>

    <div>
    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
        <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
    </sec:ifAnyGranted>
    </div>

    <div>
    <g:each in="${groupeList}" var="groupe">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading"><a href="/groupe/show/${groupe.id}" style="color: #ffffff">${groupe.name}</a></div>

                <div id="mainBoxes" class="panel-body">

                    <div style="height: 300px;width:100%;" id="map${groupe.id}"></div>
<hr/>
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <ul id="${groupe.id}" class="sortable_list connectedSortable">
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles='ROLE_USER'>
                        <ul id="${groupe.id}" class="not_sortable">
                    </sec:ifAnyGranted>
                        <g:each in="${groupe.points}" var="point">
                            <li class="ui-state-default">
                                <a id="${point.id}" href="/point/show/${point.id}">${point.name}</a>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
    </g:each>
    </div>
</div><!-- /.row -->


<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

<script type="text/javascript">

        function initMap() {

            <g:each in="${groupeList}" var="groupe">
            //console.log('${groupe.points}');
            if('${groupe.points}' != [] ) {
                <g:each in="${groupe.points}" var="point">
                var localisation = {
                    info: '<strong><a href="/point/show/${point.id}">${point.name}</strong><br>\
                        <g:each in="${groupe.points.images}" var="image">\n' +
                    '                </g:each>',
                };
                </g:each>

                var locations = [
                    [localisation.info, ${groupe.points.location[0].latitude[0]}, ${groupe.points.location[0].longitude[0]}],
                ];

                var options;
                <g:each in="${groupe.points}" var="point">
                options = {
                    zoom: 1,
                    center: new google.maps.LatLng(${point.location.latitude[0]}, ${point.location.longitude[0]}),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }

                var map = new google.maps.Map(document.getElementById('map${groupe.id}'), options);
                </g:each>

                var infowindow = new google.maps.InfoWindow({});

                var marker, i;
                <g:each in="${groupe.points}" var="point">
                <g:each in="${point.location}" var="location">
                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(${location.latitude},
                            ${location.longitude}),
                        map: map,
                    });

                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent('<strong><a href="/location/show/${location.id}">${location.name}</strong>');
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                }
                </g:each>

                </g:each>
            }
            else
            {alert('groupe vide')}
            </g:each>
            //google.maps.event.addDomListener(window, "load", initialize());
        }
</script>
</body>
</html>