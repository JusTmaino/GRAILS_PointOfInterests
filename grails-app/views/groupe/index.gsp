<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

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

        <script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

        <script type="text/javascript">

            function initMap() {

                <g:each in="${groupeList}" var="groupe">

                var localisation = {
                    info: '<strong>${groupe.points.name}</strong><br>\
                        <g:each in="${groupe.points.images}" var="image">\n' +
                    '                </g:each>',
                };

                var locations = [
                    [localisation.info, ${groupe.points.location[0].latitude[0]} , ${groupe.points.location[0].longitude[0]}],
                ];
                var map = new google.maps.Map(document.getElementById('map')
                <g:each in="${groupe.points}" var="point">
                , {
                    zoom: 2,
                    center: new google.maps.LatLng(${point.location.latitude[0]},
                        ${point.location.longitude[0]}),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                    </g:each>
                );
                console.log(map);

                var infowindow = new google.maps.InfoWindow({});

                var marker, i;
                <g:each in="${groupe.points}" var="point">
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

                </g:each>
                //google.maps.event.addDomListener(window, "load", initialize());

            }
        </script>

        <g:each in="${groupeList}" var="groupe">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading"><a href="/groupe/show/${groupe.id}">${groupe.name}</a></div>
                    <div class="panel-body">
                        <div id="map"></div>
                        <ul id="${groupe.id}" class="sortable_list connectedSortable">
                            <g:each in="${groupe.points}" var="point">
                                <li class="ui-state-default" >
                                    <a id="${point.id}" href="/point/show/${point.id}" >${point.name}</a>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>
        </g:each>
    </div><!-- /.row -->

    <!-- /.form -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">List</div>
                <div class="panel-body">
                    <div class="box">
                        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                            <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
                        </sec:ifAnyGranted>
                    <!-- /.box-header -->
                        <div class="box-body">
                            <table id="points" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Points</th>
                                    <th>Images</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${groupeList}" var="groupe">
                                    <tr>
                                        <td><a href="/groupe/show/${groupe.id}">${groupe.name}</a></td>
                                        <td>${groupe.description}</td>
                                        <td>
                                            <g:each in="${groupe.points}" var="point">
                                               - ${point.name} -
                                            </g:each>
                                        </td>
                                        <td>
                                            <g:each in="${groupe.images}" var="img">
                                                <asset:image src="${img.filename}" height="70px" width="70px"/>
                                            </g:each>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <div class="pagination">
                        <g:paginate total="${groupeCount ?: 0}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>