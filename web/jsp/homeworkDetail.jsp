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
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Resource" %>
<%@ page import="model.Handin" %>
<%@ page import="java.sql.Timestamp" %>
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
    <link href="/static/INSPINIA/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/dropzone/dropzone.css" rel="stylesheet">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/static/css/custom.css">
</head>

<body>
<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <%
        List<Resource> attachmentList = (List<Resource>) session.getAttribute("attachmentList");
        Homework homework = (Homework) session.getAttribute("homework");
        Handin handin = (Handin) session.getAttribute("handin");
        Resource handinAttachment = (Resource) session.getAttribute("handinAttachment");
        Timestamp deadline = homework.getDeadline();
        long lastTime = deadline.getTime() - new Date().getTime();
        int deadlineStat = 0;
        if (lastTime < 0) {
            deadline = homework.getDelayDeadLine1();
            lastTime = deadline.getTime() - new Date().getTime();
            deadlineStat = 1;
        }
        if (lastTime < 0) {
            deadline = homework.getDelayDeadLine2();
            lastTime = deadline.getTime() - new Date().getTime();
            deadlineStat = 2;
        }
        long lastDays = lastTime / (3600*24*1000);
        long lastHours = (lastTime - lastDays*3600*24*1000) / (3600*1000);
        long lastMinutes = (lastTime - lastDays*3600*24*1000 - lastHours*3600*1000) / (1000*60);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    %>

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
                <div class="col-md-12">
                    <div class="headline">
                        <h2><%=homework.getTitle()%></h2>
                    </div>
                    <div>
                        <ul class="list-inline">
                            <li><i class="icon iconfont">&#xe60c;</i> <b>截止日期 : <%=simpleDateFormat.format(deadline)%></b></li>
                        </ul>
                        <br>
                        <div><%=homework.getContent()%></div>
                    </div>
                    <br><br>
                    <div>
                        <h4>附件列表</h4>
                        <table class="table">
                            <%
                                if (attachmentList.size() == 0) {
                                    out.print("<tr><td>无附件</td></tr>");
                                }
                                for (Resource attachment : attachmentList) {
                            %>
                            <tr>
                                <td><button class="btn btn-link" name="<%=attachment.getFileUrl()%><%=attachment.getFileName()%>" onclick="return fn(this.name)"><%=attachment.getFileName()%></button></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr><td></td></tr>
                        </table>
                    </div>
                    <br><br>
                    <%
                        String hide = "";
                        if (studentID == null) {
                            hide = "hide";
                        }
                        String handinStat = "未提交";
                        String submitButton = "添加提交";
                        if (handin != null) {
                            submitButton = "修改提交";
                            handinStat = "已提交(未延期)";
                            long handinTime = homework.getDeadline().getTime() - handin.getSubmitTime().getTime();
                            if (handinTime < 0) {
                                handinTime = homework.getDelayDeadLine1().getTime() - handin.getSubmitTime().getTime();
                                handinStat = "已提交(延期1次)";
                            }
                            if (handinTime < 0) {
                                handinStat = "已提交(延期2次)";
                            }
                        }
                    %>
                    <div id="notSubmit" class="<%=hide%>">
                        <h4>作业提交状态</h4>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <td>提交状态</td>
                                <td><%=handinStat%></td>
                            </tr>
                            <tr>
                                <td>截止日期</td>
                                <td><%=simpleDateFormat.format(deadline)%></td>
                            </tr>
                            <tr>
                                <td>延期次数</td>
                                <td><%=deadlineStat%></td>
                            </tr>
                            <tr>
                                <%
                                    String forbidSubmit = "";
                                    if (lastTime >= 0) {
                                        out.print("<td>剩余时间</td><td style=\"color: red\">" + lastDays + " 天 " + lastHours + " 小时 " + lastMinutes + " 分钟</td>");
                                    } else {
                                        forbidSubmit = "hide";
                                        out.print("<td>剩余时间</td><td style=\"color: red\">已过期, 不可提交");
                                    }
                                %>
                            </tr>
                            <tr>
                                <%
                                    if (handin != null) {
                                        out.print("<td>我的提交</td><td><a href=\"#\" name=\"" + handinAttachment.getFileUrl() + handinAttachment.getFileName() + "\" onclick=\"return fn(this.name)\">" + handinAttachment.getFileName() + "</a></td>");
                                    }
                                %>
                            </tr>
                        </table>
                        <a class="btn rounded btn-default <%=forbidSubmit%>" id="submitHomework"><%=submitButton%></a>
                    </div>
                    <div id="uploadHomework" class="hide">
                        <h4>提交作业</h4>
                        <span>作业命名格式 : <%=homework.getTitle()%>_学号_姓名.zip</span>
                        <form id="dropzone-form" class="dropzone" enctype="multipart/form-data">
                            <div class="input-group margin-bottom-20">
                                <input type="hidden" name="type" id="type" value="">
                                <input type="hidden" name="id" id="id" value="">
                            </div>
                            <div class="dz-default dz-message file-dropzone text-center well col-sm-12">

                                <span class="glyphicon glyphicon-paperclip"></span> <span>
								To attach files, drag and drop here</span><br> <span>OR</span><br>
                                <span>Just Click</span>
                            </div>

                            <!-- this is were the previews should be shown. -->
                            <div class="dropzone-previews"></div>
                        </form>
                        <br>
                        <button id="upload-button" class="btn btn-u">上传</button>
                        <a href="/homework/homeworkDetail?homeworkID=<%=homework.getHomeworkID()%>&studentID=<%=studentID%>" class="btn btn-default">返回</a>
                    </div>
                </div><!--/col-md-12-->

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
<script  type="text/javascript" src="/static/INSPINIA/js/plugins/dropzone/dropzone.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        $('#homeworkHeader').addClass("active");
        $('#submitHomework').click(function() {
            $('#notSubmit').hide();
            $('#uploadHomework').removeClass("hide");
        });

        Dropzone.options.dropzoneForm = {
            url : "homeworkDetail?homeworkID=<%=homework.getHomeworkID()%>&studentID=<%=studentID%>",
            type:"post",
            autoProcessQueue : false,
            maxFilesize : 1024, // MB
            maxFiles : 1,
            addRemoveLinks : true,
            previewsContainer : ".dropzone-previews",
            acceptedFiles: "application/zip",
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
    function fn(url) {
        var form =$('<form></form>');
        form.attr("method","post");
        form.attr("action","/downloadfile");

        var field = $('<input/>');
        field.attr("type", "hidden");
        field.attr("name", "fileurl");
        field.attr("value", url);

        form.append(field);
        $(document.body).append(form);
        form.submit();
    }
</script>
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>