<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Message" %>
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



    <link href="/static/INSPINIA/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/animate.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/style.css" rel="stylesheet">

</head>

<body>


<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->
    <%
        String title = (String)session.getAttribute("title");
        String content = (String)session.getAttribute("content");
        int id = ((Integer)session.getAttribute("id")).intValue();
    %>


    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">

            <div class="col-md-9">
                <%
                    String temp_page_title;
                    if(id!=-1) {
                        temp_page_title="修改通知";
                    }
                    else {
                        temp_page_title="新建通知";
                    }
                %>
                <div class="headline"><h2><%=temp_page_title%></h2></div>

                <div class="input-group margin-bottom-20">
                    <input type="text" placeholder="通知标题"  id="title">
                </div>
                <div class="col-lg-12">

                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content no-padding">
                            <div class="summernote">
                            </div>
                        </div>



                <%
                    if(id!=-1) {
                        out.print("<button class=\"btn-u\" type=\"button\" onclick=\"return mysubmit2("+id+")\">确认</button>\n");
                    }
                    else {
                        out.print("<button class=\"btn-u\" type=\"button\" onclick=\"return mysubmit()\">确认</button>\n");
                    }
                %>
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
<!--
<script type="text/javascript" src="/static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/static/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/static/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="/static/js/custom.js"></script>
<script type="text/javascript" src="/static/js/app.js"></script>
<script type="text/javascript" src="/static/js/editor.js"></script>
-->

<script type="text/javascript" src="/static/INSPINIA/js/plugins/pace/pace.min.js"></script>
<script type="text/javascript"  src="/static/INSPINIA/js/inspinia.js"></script>
<script type="text/javascript" src="/static/INSPINIA/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="/static/INSPINIA/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="/static/INSPINIA/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script  type="text/javascript" src="/static/INSPINIA/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/static/INSPINIA/js/plugins/summernote/summernote.min.js"></script>


<script>
    $(document).ready(function(){
        $('#messageHeader').addClass("active");
        $('.summernote').summernote({
                focus: true,
            height: 500,
            minHeight: null,
            maxHeight: 500,
        });
        f(<%=id%>,"<%=title%>",'<%=content%>');
    });
    var edit = function() {
        $('.click2edit').summernote({focus: true});
    };
    var save = function() {
        var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
        $('.click2edit').destroy();
    };

</script>
<!--
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        $("#placeHolder").Editor();
        f(<%=id%>,"<%=title%>",'<%=content%>');
    });

</script>
-->
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>

<![endif]-->
<script>
    function f(id,title,content) {
        if(id!=-1) {
            //$("#placeHolder").Editor("setText", content)
            document.getElementsByClassName("note-editable")[0].innerHTML=content;
            document.getElementById("title").value = title;
        }
    }


    function mysubmit() {

        var text =$('.note-editable').code();
        var form =$('<form></form>');
        form.attr("method","post");
        form.attr("action","newMessage");

        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "content");
        field.attr("value", text);

        form.append(field);

        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "title");
        field.attr("value", document.getElementById("title").value);

        form.append(field);

        $(document.body).append(form);

        form.submit();
    }

    function mysubmit2(id) {
        //var text = $("#placeHolder").Editor("getText");
        var text =$('.note-editable').code();
        var form =$('<form></form>');
        form.attr("method","post");
        form.attr("action","modifyMessage");

        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "content");
        field.attr("value", text);

        form.append(field);

        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "title");
        field.attr("value", document.getElementById("title").value);

        form.append(field);

        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "id");
        field.attr("value", id);

        form.append(field);

        $(document.body).append(form);

        form.submit();
    }
</script>

</body>
</html>