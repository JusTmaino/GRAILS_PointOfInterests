<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">GROUPS</h3>
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
                <div class="panel-body" style="height:390px;">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" >

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <g:each in="${this.groupe.images}" var="img">
                                <g:if test="${this.groupe.images.size() > 0 }">
                                    <g:if test="${img.id == this.groupe.images[0].id}">
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
                    POIs map location
                </div>
                <div class="panel-body" style="height:390px;">
                    <div id="map"></div>
                    <script async defer src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                    <script async defer
                            src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>
                    <script type="text/javascript">
                        function initMap() {

                            var localisation = {
                                info: '<strong>${this.groupe.points.name}</strong><br>\
                        <g:each in="${this.groupe.points.images}" var="image">\n' +
                                '                </g:each>',
                            };

                            var locations = [
                                [localisation.info, ${this.groupe.points.location.latitude[0]} , ${this.groupe.points.location.longitude[0]}],
                            ];
                            <g:each in="${this.groupe.points}" var="point">
                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 2,
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
                                });

                                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                    return function () {
                                        infowindow.setContent(locations[i][0]);
                                        infowindow.open(map, marker);
                                    }
                                })(marker, i));
                            }

                            </g:each>
                            google.maps.event.addDomListener(window, "load", initialize());

                        }
                    </script>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">${this.groupe.name}</div>
                <div class="panel-body">
                    <div class='form-group'>
                        <label>Description </label> : <span> ${this.groupe.description}</span>
                    </div>
                    <div class='form-group'>
                        <label>Points d'intérêts</label>
                        <ul class="inline">
                            <g:each in="${this.groupe.points}" var="point">
                                <li><a href="/point/show/${point.id}">${point.name}</a></li>
                            </g:each>
                        </ul>
                    </div>
                </div>
                <div class="panel-footer">
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                        <g:form resource="${this.groupe}" method="DELETE">
                            <fieldset class="buttons">
                                <input class="delete btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                <g:link class="edit btn btn-primary"  action="edit" resource="${this.groupe}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            </fieldset>
                        </g:form>
                    </sec:ifAnyGranted>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</body>
</html>
