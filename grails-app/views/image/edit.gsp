<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link href="style.css" rel="stylesheet" type="text/css">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:if env="development">
        <asset:stylesheet src="image.css"/>
        <asset:javascript src="image.js"/>
    </g:if>
</head>
<body>
    <!--/.title-->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">IMAGES</h3>
        </div>
    </div>
    <!--/.title-->

    <!-- /.form -->
    <div class="row">
        <div>
            <g:link class="list" action="index"><i class="fa fa-list-alt fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MOD'>
                <g:link class="create" action="create"><i class="fa fa-plus-square-o fa-2x" style="padding-left: 20px;padding-bottom: 10px; /*border: solid; border-color: #0f0f0f*/" aria-hidden="true"></i></g:link>
            </sec:ifAnyGranted>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Edit : ${this.image.filename}</div>
                <div class="panel-body">
                    <form action="/image/update/${this.image.id}" method="post" enctype="multipart/form-data" ><input type="hidden" name="_method" value="PUT" id="_method" />
                        <input type="hidden" name="version" value="0" id="version" />
                        <fieldset class="form">

                            <div class='form-group'>
                                <label for='filename'>Filename * </label>
                                <input type="text" class="form-control" name="filename" value="${this.image.filename}" required="" id="filename" />
                            </div>

                            <div class='form-group'>
                            <label for='date_created'>Date Created *</label>
                            <input type="hidden" name="date_created" value="date.struct" />

                                <div style="width: 70px; display: inline-block;" >
                            <select name="date_created_day" id="date_created_day" class="form-control" aria-labelledby="date_created"
                            ><option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                                </div>

                                <div style="width: 100px; display: inline-block;">
                            <select name="date_created_month" id="date_created_month" class="form-control" aria-labelledby="date_created"
                            ><option value="1" selected="selected">janvier</option>
                                <option value="2">février</option>
                                <option value="3">mars</option>
                                <option value="4">avril</option>
                                <option value="5">mai</option>
                                <option value="6">juin</option>
                                <option value="7">juillet</option>
                                <option value="8">août</option>
                                <option value="9">septembre</option>
                                <option value="10">octobre</option>
                                <option value="11">novembre</option>
                                <option value="12">décembre</option>
                            </select>
                                </div>

                                <div style="width: 100px; display: inline-block;">
                            <select name="date_created_year" id="date_created_year" class="form-control" aria-labelledby="date_created">
                                <option value="2050">2050</option>
                                <option value="2049">2049</option>
                                <option value="2048">2048</option>
                                <option value="2047">2047</option>
                                <option value="2046">2046</option>
                                <option value="2045">2045</option>
                                <option value="2044">2044</option>
                                <option value="2043">2043</option>
                                <option value="2042">2042</option>
                                <option value="2041">2041</option>
                                <option value="2040">2040</option>
                                <option value="2039">2039</option>
                                <option value="2038">2038</option>
                                <option value="2037">2037</option>
                                <option value="2036">2036</option>
                                <option value="2035">2035</option>
                                <option value="2034">2034</option>
                                <option value="2033">2033</option>
                                <option value="2032">2032</option>
                                <option value="2031">2031</option>
                                <option value="2030">2030</option>
                                <option value="2029">2029</option>
                                <option value="2028">2028</option>
                                <option value="2027">2027</option>
                                <option value="2026">2026</option>
                                <option value="2025">2025</option>
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                                <option value="2018">2018</option>
                                <option value="2017" selected="selected">2017</option>
                                <option value="2016">2016</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                                <option value="2013">2013</option>
                                <option value="2012">2012</option>
                                <option value="2011">2011</option>
                                <option value="2010">2010</option>
                                <option value="2009">2009</option>
                                <option value="2008">2008</option>
                                <option value="2007">2007</option>
                                <option value="2006">2006</option>
                                <option value="2005">2005</option>
                                <option value="2004">2004</option>
                                <option value="2003">2003</option>
                                <option value="2002">2002</option>
                                <option value="2001">2001</option>
                                <option value="2000">2000</option>
                                <option value="1999">1999</option>
                                <option value="1998">1998</option>
                                <option value="1997">1997</option>
                                <option value="1996">1996</option>
                                <option value="1995">1995</option>
                                <option value="1994">1994</option>
                                <option value="1993">1993</option>
                                <option value="1992">1992</option>
                                <option value="1991">1991</option>
                                <option value="1990">1990</option>
                                <option value="1989">1989</option>
                                <option value="1988">1988</option>
                                <option value="1987">1987</option>
                                <option value="1986">1986</option>
                                <option value="1985">1985</option>
                                <option value="1984">1984</option>
                                <option value="1983">1983</option>
                                <option value="1982">1982</option>
                                <option value="1981">1981</option>
                                <option value="1980">1980</option>
                            </select>
                            </div>

                        </div>
                        </fieldset>

                            <script language="JavaScript" type="text/javascript">
                                function HandleBrowseClick()
                                {
                                    var fileinput = document.getElementById("browse");
                                    fileinput.click();
                                }
                                function Handlechange()
                                {
                                    var fileinput = document.getElementById("browse");
                                    var textinput = document.getElementById("filename");
                                    textinput.value = fileinput.value.substring(12);
                                }
                                $(function() {

                                    // preventing page from redirecting
                                    $("html").on("dragover", function(e) {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        $("h1").text("Drag here");
                                    });

                                    $("html").on("drop", function(e) { e.preventDefault(); e.stopPropagation(); });

                                    // Drag enter
                                    $('.upload-area').on('dragenter', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        $("h1").text("Drop");
                                    });

                                    // Drag over
                                    $('.upload-area').on('dragover', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        $("h1").text("Drop");
                                    });

                                    // Drop
                                    $('.upload-area').on('drop', function (e) {
                                        e.stopPropagation();
                                        e.preventDefault();

                                        $("h1").text("Upload");

                                        var file = e.originalEvent.dataTransfer.files;
                                        var fd = new FormData();

                                        fd.append('file', file[0]);

                                        uploadData(fd);
                                    });

                                    // Open file selector on div click
                                    $("#uploadfile").click(function(){
                                        $("#file").click();
                                    });

                                    // file selected
                                    $("#file").change(function(){
                                        var fd = new FormData();

                                        var files = $('#file')[0].files[0];

                                        fd.append('file',files);

                                        uploadData(fd);
                                    });
                                });

                                // Sending AJAX request and upload file
                                function uploadData(formdata){

                                    $.ajax({
                                        url: 'upload.php',
                                        type: 'post',
                                        data: formdata,
                                        contentType: false,
                                        processData: false,
                                        dataType: 'json',
                                        success: function(response){
                                            addThumbnail(response);
                                        }
                                    });
                                }

                                // Added thumbnail
                                function addThumbnail(data){
                                    $("#uploadfile h1").remove();
                                    var len = $("#uploadfile div.thumbnail").length;

                                    var num = Number(len);
                                    num = num + 1;

                                    var name = data.name;
                                    var size = convertSize(data.size);
                                    var src = data.src;

                                    // Creating an thumbnail
                                    $("#uploadfile").append('<div id="thumbnail_'+num+'" class="thumbnail"></div>');
                                    $("#thumbnail_"+num).append('<img src="'+src+'" width="100%" height="78%">');
                                    $("#thumbnail_"+num).append('<span class="size">'+size+'<span>');

                                }

                                // Bytes conversion
                                function convertSize(size) {
                                    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
                                    if (size == 0) return '0 Byte';
                                    var i = parseInt(Math.floor(Math.log(size) / Math.log(1024)));
                                    return Math.round(size / Math.pow(1024, i), 2) + ' ' + sizes[i];
                                }
                            </script>
                            <input type="file" class="form-control" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>
                            <div id="dragandrophandler"> <input type="button" value="Click to select file" draggable="true" id="fakeBrowse" onclick="HandleBrowseClick();"/> or drag & drop file here</div>
                            <br><br>
                            <div id="status1"></div>

                        <fieldset class="box-footer">
                            <input class="save btn btn-primary" type="submit" value="Update" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
