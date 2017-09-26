<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Points Of Interests</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <g:if env="development">
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="font-awesome.min.css"/>
        <asset:stylesheet src="ionicons.min.css"/>
        <asset:stylesheet src="jquery-jvectormap.css"/>
        <asset:stylesheet src="AdminLTE.min.css"/>
        <asset:stylesheet src="_all-skins.min.css"/>
    </g:if>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">

            <!-- Logo -->
            <a href="/" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>POI</b>s</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">Points Of Interests</span>
            </a>

            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gears"></i></a>
                            <ul class="dropdown-menu">
                                <!-- Menu Footer-->
                                <li class="user-header">
                                <asset:image src="avatar5.png" class="img-circle" alt="User Image"/>
                                    <p>
                                        <sec:loggedInUserInfo field="username" />
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                </li>
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="/logout" class="btn btn-default btn-flat">Sign Out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <asset:image src="avatar5.png" class="img-circle" alt="User Image"/>
                    </div>
                    <div class="pull-left info">
                        <p> <sec:loggedInUserInfo field="username" /> </p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="active treeview menu-open">
                        <a href="#">
                            <i class="fa fa-files-o"></i>
                            <span>Controllers</span>
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right">10</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                <li class="controller">
                                    <g:link controller="${c.logicalPropertyName}">${c.toString()}</g:link>
                                </li>
                            </g:each>
                        </ul>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Gestion de points d'intérêts
                    <small>MBDS_Grails</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <!-- Info boxes -->
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Groupes</span>
                                <span class="info-box-number">3</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">POIs</span>
                                <span class="info-box-number">15</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <!-- fix for small devices only -->
                    <div class="clearfix visible-sm-block"></div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Users</span>
                                <span class="info-box-number">3</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">README</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <p class="text-center">
                                            <strong>To Be Continued</strong>
                                        </p>

                                    </div>
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
    </section>

</div>


    <g:if env="development">
        <asset:javascript src="jquery.min.js"/>
        <asset:javascript src="bootstrap.min.js"/>
        <asset:javascript src="fastclick.js"/>
        <asset:javascript src="adminlte.min.js"/>
        <asset:javascript src="jquery.sparkline.min.js"/>
        <asset:javascript src="jquery.slimscroll.min.js"/>
        <asset:javascript src="Chart.js"/>
        <!--asset:javascript src="dashboard2.js"/-->
    </g:if>

</body>
</html>
