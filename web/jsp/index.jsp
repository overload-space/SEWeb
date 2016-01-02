<%@ page import="model.Message" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 15/12/7
  Time: 下午9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>软件工程</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/static/img/favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/static/css/headers/header-default.css">
    <link rel="stylesheet" href="/static/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/static/plugins/animate.css">
    <link rel="stylesheet" href="/static/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/static/css/pages/page_clients.css">
    <link rel="stylesheet" href="/static/css/pages/page_misc_sticky_footer.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/static/css/custom.css">
</head>

<body>

<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-9">
                <div class="headline"><h2>通知</h2></div>

               <%
                   ArrayList<Message> messages= (ArrayList<Message>) session.getAttribute("messageIndex");


                if(messages != null) {
                for(int i=0;i<3 && i<messages.size();i++) {
                     Message message=messages.get(i);

                    out.print(" <div class=\"row clients-page\">  <div class=\"col-md-10\">");

                    out.print("<span><h3>"+message.getSubject()+"</h3></span>");

                    out.print("<ul class=\"list-inline\">");
                    if(message.isImportant()) {
                        out.print("<li><i class=\"fa fa-star color-yellow\"></i>重要</li>\n");
                    }
                    out.print("</ul>");

                    String[] lines = message.getContent().split("\\r?\\n");
                    for(String line:lines) {
                        out.print("<p>"+line+"</p>");
                    }
                    out.print(" </div> </div>");
                 }
                }
            %>


            </div><!--/col-md-9-->

            <div class="col-md-3">
                <!-- Our Services -->
                <div class="who margin-bottom-30">
                    <div class="headline"><h2>课程介绍</h2></div>
                    <p>At vero eos et accusamus et iusto odio dign issimos ducimus qui blanditiis iusto.</p>
                    <ul class="list-unstyled">
                        <li><a href="#"><i class="fa fa-desktop"></i>Vivamus imperdiet condimentum</a></li>
                        <li><a href="#"><i class="fa fa-bullhorn"></i>Anim pariatur cliche squid</a></li>
                        <li><a href="#"><i class="fa fa-globe"></i>Eget placerat felis consectetur</a></li>
                        <li><a href="#"><i class="fa fa-group"></i>Condimentum diam eget placerat</a></li>
                    </ul>
                </div>

                <!-- About Us -->
                <div class="headline"><h2>教师与助教</h2></div>
                <div class="margin-bottom-30">
                    <p>At vero eos et acc usamus et iusto odio dign issimos ducimus atque corrupti quos.</p>
                    <p>dolores etrerum facilis est etenim a feugiat cupiditate non quos. <a class="linked color-green" href="#">Read more</a></p>
                </div>

            </div><!--/col-md-3-->
        </div><!--/row-->
    </div><!--/container-->
    <!--=== End Content Part ===-->

    <!--=== Footer Version 1 ===-->
    <%@include file="footer.html"%>
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
    });
</script>
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>