<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 16/1/2
  Time: 下午1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Homework" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

    <!-- Web Fonts ->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'-->

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
    <link rel="stylesheet" href="/static/plugins/icon-font/iconfont.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/static/css/pages/page_clients.css">
    <link rel="stylesheet" href="/static/css/pages/page_misc_sticky_footer.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/static/css/custom.css">
</head>

<body>
<%
    List<Homework> homeworkList = (List<Homework>) session.getAttribute("homeworkList");
    boolean isAdmin = (boolean) session.getAttribute("isAdmin");
    String hide = "hide";
    if (isAdmin) {
        hide = "";
    }
    int currentPage = (int) session.getAttribute("page");
    int numPerPage = 5;
    int beginIndex = (currentPage - 1) * numPerPage;
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-9">
                <div class="headline">
                    <div class="div-inline">
                    <h2>作业</h2>
                    </div>
                    <div class="div-inline">&nbsp;</div>
                    <div class="div-inline text-right <%=hide%>">
                        <a href="/homework/newHomework?type=new&homeworkID=0" class="btn-u">发布新作业</a>
                    </div>
                </div>

                <%
                    if (studentID == null) {
                        studentID = "-1";
                    }
                    for (int i = beginIndex; i < beginIndex + 5 && i < homeworkList.size(); i++) {
                        Timestamp deadline = homeworkList.get(i).getDeadline();
                        long lastTime = deadline.getTime() - new Date().getTime();
                        if (lastTime < 0) {
                            deadline = homeworkList.get(i).getDelayDeadLine1();
                            lastTime = deadline.getTime() - new Date().getTime();
                        }
                        if (lastTime < 0) {
                            deadline = homeworkList.get(i).getDelayDeadLine2();
                        }
                %>
                <!-- Clients Block-->
                <div class="row clients-page">

                    <div class="col-md-10">
                        <a href="/homework/homeworkDetail?homeworkID=<%=homeworkList.get(i).getHomeworkID()%>&studentID=<%=studentID%>"><h3><%=homeworkList.get(i).getTitle()%></h3></a>
                        <ul class="list-inline">
                            <li><i class="icon iconfont">&#xe60c;</i> <b>截止日期 : <%=simpleDateFormat.format(deadline)%></b></li>
                        </ul>
                        <p><%=homeworkList.get(i).getContent()%></p>
                        <a class="btn btn-success btn-xs <%=hide%>" type="button" href="/homework/newHomework?type=modify&homeworkID=<%=homeworkList.get(i).getHomeworkID()%>">修改</a>
                        <a class="btn btn-danger btn-xs <%=hide%>" type="button" href="/homework/newHomework?type=delete&homeworkID=<%=homeworkList.get(i).getHomeworkID()%>">删除</a>
                    </div>
                </div>
                <!-- End Clients Block-->
                <%
                    }
                %>

                <!-- Pagination -->
                <div class="text-center md-margin-bottom-30">
                    <p class="pagination">
                    </p>
                </div>
                <!-- End Pagination -->
            </div><!--/col-md-9-->
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
<script type="text/javascript" src="/static/js/plugins/jquery.bootpag.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        $('.pagination').bootpag({
            total: <%=(homeworkList.size() - 1) / numPerPage + 1%>,
            page: <%=currentPage%>,
            maxVisible: 5
        }).on('page', function(event, num) {
            window.location.href = "/homework?page=" + num;
        });
    });
</script>
<style type="text/css">
    .div-inline {
        display: inline;
    }
</style>
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>