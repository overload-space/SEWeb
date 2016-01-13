<%@ page import="model.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <title>修改资料</title>

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
    <%
        String studentName = (String)session.getAttribute("studentName");
        String studentEmail =(String) session.getAttribute("studentEmail");
        Integer wrongPassword=(Integer) session.getAttribute("wrongPassword");

    %>
    <span id="warning"></span>

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-9">
                <div class="headline">
                    <ul class="nav navbar-nav">
                        <li><button class="btn btn-link" onclick="return func(1);"><h3>修改个人资料</h3></button></li>
                        <li><button class="btn btn-link" onclick="return func(2);"><h3>修改密码</h3></button></li>
                    </ul>
                </div>
                <div class="form-group">&nbsp;</div>                <div class="form-group">&nbsp;</div>


                <div class="row">
                <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <form class="reg-page" action="modify" method="post">
                    <label>学号 <span class="color-red">*</span></label>
                    <input type="text" class="form-control margin-bottom-20" readonly="readonly" value="<%=studentID%>">
                    <span id="region"></span>
                    <div class="col-md-6">
                        <button class="btn-u pull-right" type="submit">确认修改</button>
                    </div>
                </form>
                </div>
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

<script>
    function func(type) {
        if (type == 1) {
            document.getElementById("region").innerHTML = "  \
            <input type=\"hidden\" name=\"type\" value=\"information\"> \
         <label>姓名 <span class=\"color-red\">*</span></label>\
                <input type=\"text\" class=\"form-control margin-bottom-20\" name=\"name\" value=\"<%=studentName%>\">\
                <label>邮箱 <span class=\"color-red\">*</span></label>\
                <input type=\"email\" class=\"form-control margin-bottom-20\" name=\"email\" value=\"<%=studentEmail%>\">\
                <div class=\"row\">\
                <div class=\"col-sm-6\">\
                <label>密码 <span class=\"color-red\">*</span></label>\
                <input type=\"password\" class=\"form-control margin-bottom-20\" name=\"password\">\
                </div>\
                </div>";
        }
        else {
            document.getElementById("region").innerHTML = " \
                <input type=\"hidden\" class=\"margin-bottom-20\" name=\"type\" value=\"password\"> \
                <label>旧密码 <span class=\"color-red\">*</span></label>\
                <input type=\"password\" class=\"form-control margin-bottom-20\" name=\"old_password\">\
                <label>新密码 <span class=\"color-red\">*</span></label>\
                <input type=\"password\" class=\"form-control margin-bottom-20\" name=\"password\">\
                <label>重复新密码 <span class=\"color-red\">*</span></label>\
                <input type=\"password\" class=\"form-control margin-bottom-20\" name=\"passwordCheck\">";
        }
    }
    function update(value) {
        if(1 == value) {
            document.getElementById("warning").innerHTML="<div id=\"myAlert\" class=\"alert alert-warning\">\
            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\
            <strong>登陆失败,密码错误或者正在审核</strong>\
            </div>";
        }
        else {
            document.getElementById("warning").innerHTML="";
        }
    }
    update(<%=wrongPassword%>);
 func(1);
</script>
</body>
</html>