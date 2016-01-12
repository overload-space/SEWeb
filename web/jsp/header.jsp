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
            /*
            String show_content=studentID;
            String show_right = "注册";
            String url_left = "/login";
            String url_right = "/register";
            if(studentID==null) {
                show_content="登录";
            }
            else {//if(!studentID.equals("登录")) {
                show_content=studentID;
                show_right = "退出";
                url_left = "javascript:void(0)";
                url_right = "/logout";
            }*/
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
                                            "<li><a href=\"#\">修改个人信息</a></li>\n" +
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
                                            "<li><a href=\"#\">修改个人信息</a></li>\n" +
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
                <li><a href="/">主页</a></li>
                <!-- End Home -->

                <!-- Home -->
                <li><a href="/message">通知</a></li>
                <!-- End Home -->

                <li><a href="/resource">资料</a></li>
                <!-- Home -->
                <li class="active"><a href="/homework">作业</a></li>
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