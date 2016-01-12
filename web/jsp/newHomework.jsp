<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 16/1/2
  Time: 下午1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.Homework" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
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
    <link href="/static/INSPINIA/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>

<body>

<%
    String type = (String) session.getAttribute("type");
    Homework homework = (Homework) session.getAttribute("homework");
    Timestamp deadline = new Timestamp(new Date().getTime());
    Timestamp delayDeadline1 = new Timestamp(new Date().getTime());
    Timestamp delayDeadline2 = new Timestamp(new Date().getTime());
    String title = "";
    String content = "";
    String head = "发布新作业";
    String homeworkID = "";
    if (type.equals("modify")) {
        deadline = homework.getDeadline();
        delayDeadline1 = homework.getDelayDeadLine1();
        delayDeadline2 = homework.getDelayDeadLine2();
        title = homework.getTitle();
        content = homework.getContent();
        head = "修改作业";
        homeworkID = "?homeworkID=" + homework.getHomeworkID();
    }

    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <form action="/homework/<%=type%>Homework<%=homeworkID%>" method="post" enctype="multipart/form-data">
                <div class="col-md-12">
                    <div class="headline">
                        <h2><%=head%></h2>
                    </div>
                    <div>
                        <div class="col-md-4">
                        <label class="col-sm-3"><h5>截止日期</h5></label>
                        <div class="input-group date col-sm-7">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input name="deadline" type="text" class="form-control" value="<%=simpleDateFormat.format(deadline)%>">
                        </div>
                        </div>
                        <div class="col-md-4">
                        <label class="col-sm-4"><h5>第一次延期</h5></label>
                        <div class="input-group date col-sm-7">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input name="delaydeadline1" type="text" class="form-control" value="<%=simpleDateFormat.format(delayDeadline1)%>">
                        </div>
                        </div>
                        <div class="col-md-4">
                        <label class="col-sm-4"><h5>第二次延期</h5></label>
                        <div class="input-group date col-sm-7">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input name="delaydeadline2" type="text" class="form-control" value="<%=simpleDateFormat.format(delayDeadline2)%>">
                        </div>
                        </div>
                    </div>
                    <br>
                    <div>
                        <label><h4>作业标题</h4></label>
                        <input name="title" placeholder="请输入作业标题" class="form-control" value="<%=title%>"/>
                    </div>
                    <br>
                    <div>
                        <label><h4>作业内容</h4></label>
                        <textarea name="content" class="summernote">
                        </textarea>
                    </div>
                    <div>
                        <input type="file" multiple name="file" />
                    </div>
                    <br>
                    <div>
                        <button class="btn btn-u" type="submit">提交</button>
                        <button class="btn btn-white" type="submit">取消</button>
                    </div>
                </div><!--/col-md-12-->

            </form>
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
<script type="text/javascript" src="/static/INSPINIA/js/plugins/summernote/summernote.min.js"></script>
<script type="text/javascript" src="/static/INSPINIA/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/static/INSPINIA/js/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        $('.summernote').summernote( {
            height: 220,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote});
            toolbar: [
                //['style', ['style']], // no style button
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['link']] // no insert buttons
                //['table', ['table']], // no table button
                //['help', ['help']] //no help button
            ]
        });
        $('.summernote').code('<%=content%>');

        $('.date').datetimepicker({
            language:  'zh-CN',
            minuteStep:1,
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 1,
            showMeridian: 0
        });
    });
</script>

<style type="text/css">
    .border {
        border-style: solid;
    }
</style>
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>