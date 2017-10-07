<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'point.label', default: 'Point')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<!-- /.CONTENT-->


    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">POINTS OF INTERESTS</h3>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div>
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">PointsList</div>
                <div class="panel-body">
                    <div class="box">
                    <!-- /.box-header -->
                        <div class="box-body">
                        <div style="height: 500px;width:100%;" id="map"></div>

                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.form-->
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

<script type="text/javascript">

    function initMap() {

        <g:each in="${customPointsList}" var="point">

        var localisation = {
            info: '<strong><a href="/point/show/${point.id}">${point.name}</a></strong><br>\
                        <g:each in="${point.images}" var="image">\n' +
            '                </g:each>',
        };

        var locations = [
            [localisation.info, ${point.location.latitude[0]}, ${point.location.longitude[0]}],
        ];

        var options;

        options = {
            zoom: 1,
            center: new google.maps.LatLng(${point.location.latitude[0]}, ${point.location.longitude[0]}),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }

        var map = new google.maps.Map(document.getElementById('map'),options);
        console.log(map);

        var infowindow = new google.maps.InfoWindow({});

        var marker, i;
        <g:each in="${customPointsList}" var="pt">

        for (i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(${pt.location.latitude[0]},
                    ${pt.location.longitude[0]}),
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
        </g:each>
        //google.maps.event.addDomListener(window, "load", initialize());

    }
</script>

</body>
</html>