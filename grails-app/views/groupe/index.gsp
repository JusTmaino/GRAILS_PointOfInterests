<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

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
                        <div class="dropper">
                            <g:each in="${groupe.points}" var="point">
                                <div class="draggable">
                                    <a href="/point/show/${point.id}">${point.name}</a>
                                </div>
                            </g:each>
                        </div>
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
                        <i class="fa fa-map-marker" aria-hidden="true"></i><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
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

    <script type="text/javascript">
        (function() {
            var dndHandler = {
                draggedElement: null,

                applyDragEvents: function(element) {
                    element.draggable = true;
                    var dndHandler = this;
                    element.addEventListener('dragstart', function(e) {
                        dndHandler.draggedElement = e.target;
                        e.dataTransfer.setData('text/plain', '');// firefox
                    });
                },

                applyDropEvents: function(dropper) {
                    dropper.addEventListener('dragover', function(e) {
                        e.preventDefault();
                        this.className = 'dropper drop_hover';
                    });

                    dropper.addEventListener('dragleave', function() {
                        this.className = 'dropper';
                    });

                    var dndHandler = this;

                    dropper.addEventListener('drop', function(e) {

                        var target = e.target;
                        var draggedElement = dndHandler.draggedElement;
                        var clonedElement = draggedElement.cloneNode(true);

                        while (target.className.indexOf('dropper') == -1) { target = target.parentNode;}

                        target.className = 'dropper';

                        clonedElement = target.appendChild(clonedElement);
                        dndHandler.applyDragEvents(clonedElement);
                        draggedElement.parentNode.removeChild(draggedElement);
                    });
                }
            };

            var elements = document.querySelectorAll('.draggable');
            var elementsLen = elements.length;

            for (var i = 0; i < elementsLen; i++) { dndHandler.applyDragEvents(elements[i]); }
            var droppers = document.querySelectorAll('.dropper');
            var droppersLen = droppers.length;
            for (var i = 0; i < droppersLen; i++) { dndHandler.applyDropEvents(droppers[i]); }
        })();
    </script>
</body>
</html>