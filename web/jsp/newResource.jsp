
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"><!--<![endif]-->
<head>
    <title>软件工程</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!--

    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/headers/header-default.css">
    <link rel="stylesheet" href="/static/css/footers/footer-v1.css">
    <link rel="stylesheet" href="/static/plugins/animate.css">
    <link rel="stylesheet" href="/static/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/pages/page_clients.css">
    <link rel="stylesheet" href="/static/css/pages/page_misc_sticky_footer.css">

    -->

    <link rel="shortcut icon" href="/static/img/favicon.ico">
    <link rel="stylesheet" href="/static/css/custom.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/headers/header-default.css">
    <link rel="stylesheet" href="/static/css/footers/footer-v1.css">
    <link rel="stylesheet" href="/static/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/pages/page_clients.css">
    <link rel="stylesheet" href="/static/css/pages/page_misc_sticky_footer.css">

    <link href="/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="/static/INSPINIA/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/dropzone/dropzone.css" rel="stylesheet">

</head>

<body>


<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->
    <%
        String description = (String)session.getAttribute("desp");
        int id = ((Integer)session.getAttribute("id")).intValue();
    %>


    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">

            <div class="col-md-9">
                <%
                    String temp_page_title;
                    String type=null;
                    if(id!=-1) {
                        temp_page_title="修改资料";
                        type="modify";
                    }
                    else {
                        temp_page_title="新建资料";
                        type="new";
                    }
                %>
                <div class="headline"><h2><%=temp_page_title%></h2></div>

                <div class="input-group margin-bottom-20">
              <!--      <input type="text" placeholder="资料描述"  id="desp">-->
                </div>

                <div class="wrapper wrapper-content animated fadeIn">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h3>上传文件</h3>
                                </div>
                                <div class="ibox-content" style="display: block;">
                                    <form id="dropzone-form" class="dropzone"
                                          enctype="multipart/form-data">
                                        <div class="input-group margin-bottom-20">
                                            <input type="text" class="form-control" placeholder="资料描述"  name="desp" id="desp">
                                            <input type="hidden" name="type" id="type" value="<%=type%>">
                                            <input type="hidden" name="id" id="id" value="<%=id%>">
                                        </div>
                                        <div class="dz-default dz-message file-dropzone text-center well col-sm-12">

                                            <span class="glyphicon glyphicon-paperclip"></span> <span>
								To attach files, drag and drop here</span><br> <span>OR</span><br>
                                            <span>Just Click</span>
                                        </div>

                                        <!-- this is were the previews should be shown. -->
                                        <div class="dropzone-previews"></div>
                                    </form>
                                    <hr>
                                    <button id="upload-button" class="btn btn-u">
                                        <span class="glyphicon glyphicon-upload"></span> 上传
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div><!--/col-md-9-->

    </div><!--/row-->
</div><!--/container-->
<!--=== End Content Part ===-->

<!--=== Footer Version 1 ===-->

<!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="/static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/static/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/static/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/static/plugins/smoothScroll.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="/static/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/static/js/app.js"></script>
<script  type="text/javascript" src="/static/INSPINIA/js/plugins/dropzone/dropzone.js"></script>

<script>
    $(document).ready(function(){
        f(<%=id%>,"<%=description%>");

        $(".file-dropzone").on('dragover', handleDragEnter);
        $(".file-dropzone").on('dragleave', handleDragLeave);
        $(".file-dropzone").on('drop', handleDragLeave);

        function handleDragEnter(e) {

            this.classList.add('drag-over');
        }

        function handleDragLeave(e) {

            this.classList.remove('drag-over');
        }

        // "dropzoneForm" is the camel-case version of the form id "dropzone-form"
        Dropzone.options.dropzoneForm = {
            url : "newResource",
            type:"post",
            autoProcessQueue : false,
            uploadMultiple : true,
            maxFilesize : 256, // MB
            parallelUploads : 100,
            maxFiles : 100,
            addRemoveLinks : true,
            previewsContainer : ".dropzone-previews",
            // The setting up of the dropzone
            init : function() {
                var myDropzone = this;
                // first set autoProcessQueue = false
                $('#upload-button').on("click", function(e) {
                    e.preventDefault();
                    e.stopPropagation();

                    if (myDropzone.getQueuedFiles().length > 0) {
                        myDropzone.processQueue();
                    } else {
                        myDropzone.uploadFiles([]); //send empty
                    }

                });


                // customizing the default progress bar
                this.on("uploadprogress", function(file, progress) {
                    progress = parseFloat(progress).toFixed(0);
                    var progressBar = file.previewElement.getElementsByClassName("dz-upload")[0];
                    progressBar.innerHTML = progress + "%";
                });

                // displaying the uploaded files information in a Bootstrap dialog
                this.on("successmultiple", function(files, serverResponse) {
                  //  showInformationDialog(files, serverResponse);
                });
                this.on("success", function() {
                    myDropzone.options.autoProcessQueue = true;
                });
            }
        }
    });

</script>


<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>

<![endif]-->
<script>
    function f(id,description) {
        if(id!=-1) {
            document.getElementById("desp").value = description;
        }
    }

</script>

</body>
</html>