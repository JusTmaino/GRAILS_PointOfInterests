<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <style>
        .sortable_list {
            width: 142px;
            min-height: 20px;
            list-style-type: none;
            margin: 0;
            padding: 5px 0 0 0;
            float: left;
            margin-right: 10px;
        }

        .sortable_list li {
            margin: 0 5px 5px 5px;
            padding: 5px;
            font-size: 1.2em;
            width: 120px;
        }
    </style>

</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <h2>GROUPS</h2>
        </div>
        <g:each in="${groupeList}" var="groupe">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading"><a href="/groupe/show/${groupe.id}">${groupe.name}</a></div>
                    <div class="panel-body">
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

    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

    <script>
        $(function() {
            $( ".sortable_list" ).sortable({
                connectWith: ".connectedSortable",
                receive: function(event, ui) {
                    //alert(ui.item[0].innerHTML.substring(44,45)); // Where the item is dropped
                    //alert("sender = " + ui.sender[0].id);
                    if(ui.item[0].innerHTML.substring(45,46).includes('"'))
                        window.location='/groupe/index?oldGroupeID='+ui.sender[0].id+'&newGroupeID='+this.id+'&pointID='+ui.item[0].innerHTML.substring(44,45);
                    else
                        window.location='/groupe/index?oldGroupeID='+ui.sender[0].id+'&newGroupeID='+this.id+'&pointID='+ui.item[0].innerHTML.substring(44,46);
                }
            }).disableSelection();
        });
    </script>

</body>
</html>