<%--
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

                <!-- Clients Block-->
                <div class="row clients-page">

                    <div class="col-md-10">
                        <h3>Cisco Systems, Inc</h3>
                        <ul class="list-inline">
                            <li><i class="fa fa-map-marker color-green"></i> USA</li>
                            <li><i class="fa fa-globe color-green"></i> <a class="linked" href="#">http://www.example.com</a></li>
                            <li><i class="fa fa-briefcase color-green"></i> Web Design &amp; Development</li>
                        </ul>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati</p>
                        <p>Olerano ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna edetquam lacus. Fusce condimentum eleifend enim a sint occaecati feugiat..</p>
                    </div>
                </div>
                <!-- End Clients Block-->

                <!-- Clients Block-->
                <div class="row clients-page">
                    <div class="col-md-10">
                        <h3>Natural Green</h3>
                        <ul class="list-inline">
                            <li><i class="fa fa-map-marker color-green"></i> Canada</li>
                            <li><i class="fa fa-globe color-green"></i> <a class="linked" href="#">http://www.example.com</a></li>
                            <li><i class="fa fa-briefcase color-green"></i> Logo Design &amp; Wordpress</li>
                        </ul>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati. Olerano ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna edetquam lacus. Fusce condimentum eleifend enim a sint occaecati feugiat..</p>
                    </div>
                </div>
                <!-- End Clients Block-->

                <!-- Clients Block-->
                <div class="row clients-page">
                    <div class="col-md-10">
                        <h3>The Coca-Cola Company</h3>
                        <ul class="list-inline">
                            <li><i class="fa fa-map-marker color-green"></i> USA</li>
                            <li><i class="fa fa-globe color-green"></i> <a class="linked" href="#">http://www.example.com</a></li>
                            <li><i class="fa fa-briefcase color-green"></i> Web Design &amp; Development</li>
                        </ul>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati</p>
                        <p>Olerano ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna edetquam lacus. Fusce condimentum eleifend enim a sint occaecati feugiat..</p>
                    </div>
                </div>
                <!-- End Clients Block-->

                <!-- Pagination -->
                <div class="text-center md-margin-bottom-30">
                    <ul class="pagination">
                        <li><a href="#">«</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">»</a></li>
                    </ul>
                </div>
                <!-- End Pagination -->
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