<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">GROUPS</h3>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div>
                <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Create a group</div>
                    <div class="panel-body">
                        <form action="/groupe/save" method="post" enctype="multipart/form-data" >
                            <fieldset class="form">

                                <div class='form-group'>
                                    <label for='name'>Name *</label>
                                    <input type="text" class="form-control" name="name" value="" required="" id="name" />
                                </div>

                                <div class='form-group'>
                                    <label for='description'>Description *</label>
                                    <input type="text" class="form-control" name="description" value="" required="" id="description" />
                                </div>

                                <div class='form-group'>
                                    <label for='point'>Points</label>
                                    <g:select multiple="multiple" name="pointID" class="form-control" required="" id="point" optionKey="id" optionValue="name" from="${customPointList}"  ></g:select>
                                    <a href="/point/create?groupe.id=">Add Point</a>
                                </div>

                                <div class='form-group'>
                                    <label for='image'>Images</label>
                                    <g:select multiple="multiple" name="imageID" class="form-control" id="image" optionKey="id" optionValue="filename" from="${customimageList}"  ></g:select>
                                    <a href="/image/create?groupe.id=">Add Image</a>
                                </div>
                            </fieldset>
                            <fieldset class="box-footer">
                                <input type="submit" name="create" class="save btn btn-primary" value="Create" id="create" />
                            </fieldset>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->

</body>
</html>
