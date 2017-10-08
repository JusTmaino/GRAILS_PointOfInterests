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
            <h3 class="page-header">POINTS OF INTERESTS</h3>
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
            <div class="panel panel-primary">
                <div class="panel-heading">Images</div>
                <div class="panel-body" style="height:350px;">

                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="1500" >

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <g:each in="${this.point.images}" var="img">
                                <g:if test="${this.point.images.size() > 0 }">
                                    <g:if test="${img.id == this.point.images[0].id}">
                                        <div class="item active">
                                            <a href="/image/show/${img.id}"><img src="${grailsApplication.config.server.pathServer}/${img.filename}"/></a></div>
                                    </g:if>
                                    <g:else>
                                        <div class="item">
                                            <a href="/image/show/${img.id}"><img src="${grailsApplication.config.server.pathServer}/${img.filename}"/></a>
                                        </div>
                                    </g:else>
                                </g:if>
                            </g:each>
                        </div>
                        <!-- Wrapper for slides -->

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                   Map location
                </div>
                <div class="panel-body"  style="height:350px;" >
                    <div id="map"></div>
                    <script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

                    <script type="text/javascript">
                        if("${this.point.location[0]}" != [] ) {
                            function initMap() {

                                var infowindow = new google.maps.InfoWindow({});
                                var options, marker, i;

                                <g:each in="${pointLocations}" var="location">
                                var localisation = {
                                    info: '<strong><a href="/point/show/${location.id}">${location.name}</strong><br>\
                        <g:each in="${point.images}" var="image">\n' +
                                    '                </g:each>',
                                };


                                var locations = [
                                    [localisation.info, ${location.latitude}, ${location.longitude}],
                                ];

                                options = {
                                    zoom: 4,
                                    center: new google.maps.LatLng(locations[0][1], locations[0][2]),
                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                }

                                var map = new google.maps.Map(document.getElementById('map'),options);
                                console.log(map);
                                </g:each>

                                <g:each in="${pointLocations}" var="location">
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

                                //google.maps.event.addDomListener(window, "load", initialize());
                            }
                        }
                    </script>
                    </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">${this.point.name} details</div>
                <div class="panel-body">
                    <div class='form-group'>
                        <label>Name </label> : <span> ${this.point.name}</span>
                    </div>

                    <div class='form-group'>
                        <label>Description </label> : <span> ${this.point.description}</span>
                    </div>
                </div>
                <div class="panel-footer">
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <form action="/point/delete/${this.point.id}" method="post" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                            <fieldset class="box-footer">
                                <input class="btn btn-danger" type="submit" value="Delete" onclick="return confirm('Are you sure to delete this point?');" />
                                <input class="btn btn-primary" type="button" onclick="window.location='/point/edit/${this.point.id}';" value="Edit">
                            </fieldset>
                        </form>
                    </sec:ifAnyGranted>
                </div>
            </div>
    </div><!--/.row-->
</body>
</html>
