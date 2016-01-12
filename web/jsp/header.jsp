<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="header">
    <div class="container">
        <!-- Logo -->
        <a class="logo" href="/">
            <img src="/static/img/logo1-default.png" alt="Logo">
        </a>
        <!-- End Logo -->

        <!-- Topbar -->
        <%String studentID=(String)session.getAttribute("studentID");
            String show_content=studentID;
            if(studentID==null) {
                show_content="登录";
            }
            else if(!studentID.equals("登录")) {
                show_content=studentID+" 退出";
            }
        %>
        <div class="topbar">
            <ul class="loginbar pull-right">
                <li><a href="page_faq.html">帮助</a></li>
                <li class="topbar-devider"></li>
                <li><a href="login"><%=show_content%></a></li>
                <li class="topbar-devider"></li>
                <li><a href="register">注册</a></li>
                <li class="topbar-devider"></li>
                <li><a href="modify">修改</a></li>
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
                <li><a href="index">主页</a></li>
                <!-- End Home -->

                <!-- Home -->
                <li><a href="message">通知</a></li>
                <!-- End Home -->

                <li><a href="resource">资料</a></li>
                <!-- Home -->
                <li><a href="#">作业</a></li>
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