<%--
  Created by IntelliJ IDEA.
  User: Cloud
  Date: 16/1/2
  Time: 下午1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>
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

    <!-- Data Tables -->
    <link href="/static/INSPINIA/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="/static/INSPINIA/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/static/css/custom.css">
</head>

<body>
<div class="wrapper">
    <!--=== Header ===-->
    <%@include file="header.jsp"%>
    <!--=== End Header ===-->

    <%
        List<Student> studentList = (List<Student>) session.getAttribute("studentList");
        List<Student> notCheckedStudentList = (List<Student>) session.getAttribute("notCheckedStudentList");
        List<Student> TAList = (List<Student>) session.getAttribute("TAList");
        boolean isTeacher = (boolean) session.getAttribute("isTeacher");
        String hide = "hide";
        if (isTeacher) {
            hide = "";
        }
    %>

    <!--=== Content Part ===-->
    <div class="container content">
        <div class="row">
            <div class="col-md-9">
                <div class="headline">
                    <div class="div-inline">
                        <h2>学生管理</h2>
                    </div>
                    <div class="div-inline">&nbsp;</div>
                    <div class="div-inline">
                        <button class="btn-u" data-toggle="modal" data-target="#responsive">新建账号</button>
                    </div>
                </div>
                <form action="/studentManager/newStudent" method="post" class="modal fade" id="responsive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel4">新建账号</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>学号</h4>
                                        <p><input class="form-control" type="text" name="id" /></p>
                                        <h4>姓名</h4>
                                        <p><input class="form-control" type="text" name="name" /></p>
                                        <h4>邮箱</h4>
                                        <p><input class="form-control" type="email" name="email" /></p>
                                        <h4>密码</h4>
                                        <p><input class="form-control" type="password" name="password" id="password" /></p>
                                        <h4>重复密码</h4>
                                        <p><input class="form-control" type="password" name="passwordCheck" /></p>
                                        <br>
                                        <p class="pull-right <%=hide%>">
                                            <input type="checkbox" name="level" value="1" /><i></i><label>&nbsp;&nbsp;设为助教</label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn-u btn-u-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn-u btn-u-primary">提交</button>
                            </div>
                        </div>
                    </div>
                </form>
                <br><br>
                <div>
                    <h3>待审核列表</h3>
                    <br>
                    <table class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>选项</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Student student : notCheckedStudentList) {

                        %>
                        <tr>
                            <td><%=student.getId()%></td>
                            <td><%=student.getName()%></td>
                            <td><a href="mailto:<%=student.getEmail()%>"><%=student.getEmail()%></a></td>
                            <td>
                                <a href="/studentManager/checkStudent?type=true&studentID=<%=student.getId()%>" class="btn-success btn-sm">同意</a>
                                <a href="/studentManager/checkStudent?type=false&studentID=<%=student.getId()%>" class="btn-default btn-sm">拒绝</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <br><br><hr>
                <div>
                    <h3>学生列表</h3>
                    <br>
                    <table class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>选项</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Student student : studentList) {

                        %>
                        <tr>
                            <td><%=student.getId()%></td>
                            <td><%=student.getName()%></td>
                            <td><a href="mailto:<%=student.getEmail()%>"><%=student.getEmail()%></a></td>
                            <td><a href="/studentManager/deleteStudent?studentID=<%=student.getId()%>" class="btn-danger btn-sm">删除</a></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <br><br><hr>
                <div>
                    <h3>助教列表</h3>
                    <br>
                    <table class="table table-striped table-bordered table-hover" >
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>选项</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Student student : TAList) {

                        %>
                        <tr>
                            <td><%=student.getId()%></td>
                            <td><%=student.getName()%></td>
                            <td><a href="mailto:<%=student.getEmail()%>"><%=student.getEmail()%></a></td>
                            <td><a href="/studentManager/deleteStudent?studentID=<%=student.getId()%>" class="btn-danger btn-sm <%=hide%>">删除</a></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
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
<script type="text/javascript" src="/static/INSPINIA/js/plugins/validate/jquery.validate.min.js"></script>
<!-- Data Tables -->
<script src="/static/INSPINIA/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/static/INSPINIA/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="/static/INSPINIA/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="/static/INSPINIA/js/plugins/dataTables/dataTables.tableTools.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        $('.table').dataTable({
            paging: true,//分页
            ordering: false,//是否启用排序
            searching: true,//搜索
            language: {
                lengthMenu: '每页显示 _MENU_ 条记录',
                search: '搜索: ',//右上角的搜索文本，可以写html标签

                paginate: {//分页的样式内容。
                    previous: "上一页",
                    next: "下一页",
                    first: "第一页",
                    last: "最后"
                },

                zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
                //下面三者构成了总体的左下角的内容。
                info: "显示第_START_ 到第 _END_ ，共 _TOTAL_ 条",//左下角的信息显示，大写的词为关键字。
                infoEmpty: "0条记录",//筛选为空时左下角的显示。
                infoFiltered: ""//筛选之后的左下角筛选提示，
            },
            dom: 'lftp',
            pagingType: "full_numbers"//分页样式的类型

        });
        $('#responsive').validate({
            rules: {
                id: {
                    required: true,
                    minlength: 1
                },
                name: {
                    required: true,
                    minlength: 1
                },
                email: {
                    required: true,
                    minlength: 1
                },
                password: {
                    required: true
                },
                passwordCheck: {
                    equalTo: "#password"
                }
            }
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