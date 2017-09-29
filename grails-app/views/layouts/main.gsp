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

    <g:if env="development">
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="font-awesome.min.css"/>
        <asset:stylesheet src="datepicker3.css"/>
        <asset:stylesheet src="styles.css"/>
    </g:if>

    <!--Custom Font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    <g:layoutHead/>
</head>

<body>

<!-- /.header -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/"><span>PointsOfInterests</span>Platform</a>
                <ul class="nav navbar-top-links navbar-right">
                    <li><a href="/logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
<!-- /.container-fluid -->

<!--/.sidebar-->
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
        <form role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </form>
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
                <li><a href="/user"><em class="fa fa-users">&nbsp;</em> User Manager</a></li>
            </li>
        </ul>
    </div>
<!--/.sidebar-->


    <g:layoutBody/>

    <g:if env="development">
        <asset:javascript src="application.js"/>
        <asset:javascript src="jquery-1.11.1.min.js"/>
        <asset:javascript src="bootstrap.min.js"/>
        <asset:javascript src="chart.min.js"/>
        <asset:javascript src="chart-data.js"/>
        <asset:javascript src="easypiechart.js"/>
        <asset:javascript src="easypiechart-data.js"/>
        <asset:javascript src="bootstrap-datepicker.js"/>
        <asset:javascript src="custom.js"/>
    </g:if>
</body>
</html>
