<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/interface.js"></script>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <style>
    #sortable {
        border: 1px solid #eee;
        width: 142px;
        min-height: 20px;
        list-style-type: none;
        margin: 0;
        padding: 5px 0 0 0;
        float: left;
        margin-right: 10px;
    }
    #sortable li {
        margin: 0 5px 5px 5px;
        padding: 5px;
        font-size: 1.2em;
        width: 120px;
    }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
                        <ul id="sortable1" class="connectedSortable">
                            <g:each in="${groupe.points}" var="point">
                                <li class="ui-state-default" >
                                    <a class="draggable" /point/show/${point.id}" >${point.name}</a>
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

    <script>
        $( function() {
            $( "#sortable, #sortable" ).sortable({
                connectWith: ".connectedSortable"
            }).disableSelection();
        } );
    </script>
<script type="text/javascript">

    $(document).ready (
        function() {
            $( "#sortlist" ).Sortable( {
                accept : 'sortable_item',
                axis : 'vertically',
                opacity : 0.6,
                onchange : function ( sorted ) {
                    serial = $.SortSerialize( 'sortlist' );
                }
            });
        });

</script>

</body>
</html>