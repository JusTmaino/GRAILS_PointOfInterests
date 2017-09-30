<!doctype html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Points Of Interests - Profile</title>
</head>
<body>

        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">My profile</h3>
            </div>
        </div>
        <!--/.title-->

        <!-- /.form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Details</div>
                    <div class="panel-body">
                        <form action="/user/update/${customUser.id}" method="post" ><input type="hidden" name="_method" value="PUT" id="_method" />

                            <input type="hidden" name="version" value="0" id="version" />

                            <fieldset class="box-body">
                                <div class='form-group'>
                                    <label for="username">Username * </label>
                                    <input type="text" class="form-control" name="username" placeholder="Username" value="${customUser.username}" required="" id="username" />
                                </div>

                                <div class='form-group'>
                                    <label for="username">Password * </label>
                                    <input type="text" class="form-control" name="password" placeholder="Retape your Password" value="${customUser.password}" required="" id="password" />
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputFile">Image</label>
                                    <input type="file" id="exampleInputFile">

                                    <p class="help-block">Upload your image here.</p>
                                </div>
                            </fieldset>

                            <fieldset class="box-footer">
                                <input class="btn btn-primary" type="submit" value="Update" />
                            </fieldset>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-->

</body>
</html>