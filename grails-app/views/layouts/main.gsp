<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <title>
        <g:layoutTitle default="Grails"/>
    </title>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    <g:if env="development">
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="font-awesome.min.css"/>
        <asset:stylesheet src="styles.css"/>
        <asset:stylesheet src="errors.css"/>
        <asset:javascript src="bootstrap.min.js"/>
    </g:if>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">


    <g:layoutHead/>
</head>

<body>

<!-- /.header -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/"><span>PointsOfInterests</span>Platform</a>
                <ul class="nav navbar-top-links navbar-right">
                    <sec:ifLoggedIn>
                    <li><a href="/logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <li><a href="/login"><em class="fa fa-power-off">&nbsp;</em> Login</a></li>
                    </sec:ifNotLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
<!-- /.container-fluid -->

    <!--/.sidebar-->
    <sec:ifLoggedIn>
        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"><sec:loggedInUserInfo field="username" /></div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <ul class="nav menu">
                <li><a href="/user/profile"><em class="fa fa-id-card">&nbsp;</em> Profile</a></li>
                <li class="parent "><a data-toggle="collapse" href="#sub-item-1">
                    <em class="fa fa-map-marker">&nbsp;</em> POIs Manager<span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
                    </a>
                        <ul class="children collapse" id="sub-item-1">
                            <li>
                                <a href="/groupe">
                                    <i class="fa fa-arrow-right"></i>
                                    <span>Groupes</span>
                                </a>
                            </li>
                            <li>
                                <a href="/point">
                                    <i class="fa fa-arrow-right"></i>
                                    <span>Points d'intérêts</span>
                                </a>
                            </li>

                        </ul>
                    <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                    <li><a href="/user"><em class="fa fa-users">&nbsp;</em> User Manager</a></li>
                    </sec:ifAnyGranted>
                </li>
            </ul>
        </div>
    </sec:ifLoggedIn>
    <!--/.sidebar-->

    <!-- /.CONTENT-->
    <sec:ifLoggedIn>
        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <div class="col-sm-12  main">
    </sec:ifNotLoggedIn>
            <g:layoutBody/>
        </div>
        </div>
</body>
</html>
