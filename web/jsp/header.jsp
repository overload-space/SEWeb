<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="container">
        <!-- Logo -->
        <a class="logo" href="/">
            <img src="/static/img/logo1-default.png" alt="Logo">
        </a>
        <!-- End Logo -->

        <!-- Topbar -->
        <%
            String studentID=(String)session.getAttribute("studentID");
            boolean isAdmin = false;
        %>
        <div class="topbar">
            <ul class="loginbar pull-right">
                <%
                    if (studentID == null) {
                        out.print(
                                "<li>\n" +
                                        "<a href=\"/login\">登录</a>\n" +
                                        "</li>\n" +
                                        "<li class=\"topbar-devider\"></li>\n" +
                                        "<li><a href=\"/register\">注册</a></li>"
                        );
                    } else {
                        isAdmin = (boolean) session.getAttribute("isAdmin");
                        if (isAdmin) {
                            out.print(
                                    "<li class=\"hoverSelector\">\n" +
                                            "<a>"+ studentID +"</a>\n" +
                                            "<ul class=\"languages hoverSelectorBlock\">\n" +
                                            "<li><a href=\"modify\">修改个人信息</a></li>\n" +
                                            "<li><a href=\"/studentManager\">学生管理</a></li>\n" +
                                            "</ul>\n" +
                                            "</li>\n" +
                                            "<li class=\"topbar-devider\"></li>\n" +
                                            "<li><a href=\"/logout\">退出</a></li>"
                            );
                        } else {
                            out.print(
                                    "<li class=\"hoverSelector\">\n" +
                                            "<a>"+ studentID +"</a>\n" +
                                            "<ul class=\"languages hoverSelectorBlock\">\n" +
                                            "<li><a href=\"modify\">修改个人信息</a></li>\n" +
                                            "</ul>\n" +
                                            "</li>\n" +
                                            "<li class=\"topbar-devider\"></li>\n" +
                                            "<li><a href=\"/logout\">退出</a></li>"
                            );
                        }
                    }
                %>
            </ul>
        </div>
        <!-- End Topbar -->

        <h1>&nbsp;&nbsp;&nbsp;&nbsp;软件工程课程网站</h1>
        <!-- Toggle get grouped for better mobile display -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="fa fa-bars"></span>
        </button>
        <!-- End Toggle -->
    </div><!--/end container-->

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
        <div class="container">
            <ul class="nav navbar-nav">
                <!-- Home -->
                <li id="indexHeader"><a href="/index">主页</a></li>
                <!-- End Home -->

                <!-- Home -->
                <li id="messageHeader"><a href="/message">通知</a></li>
                <!-- End Home -->

                <li id="resourceHeader"><a href="/resource">资料</a></li>
                <!-- Home -->
                <li id="homeworkHeader"><a href="/homework">作业</a></li>
                <!-- End Home -->

                <!-- Search Block -->
                <li>
                    <i class="search fa fa-search search-btn"></i>
                    <div class="search-open">
                        <div class="input-group animated fadeInDown">
                            <input type="text" class="form-control" placeholder="Search">
                                <span class="input-group-btn">
                                    <button class="btn-u" type="button">Go</button>
                                </span>
                        </div>
                    </div>
                </li>
                <!-- End Search Block -->
            </ul>
        </div><!--/end container-->
    </div><!--/navbar-collapse-->
</div>