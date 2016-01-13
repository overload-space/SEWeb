<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Message" %>
<%@ page import="model.Resource" %>
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
                <div class="headline"><h2>资料</h2></div>
                <%

                    if(isAdmin) {
                        out.print("<div class=\"col-md-offset-1\"><button offset=5px class=\"btn-u\" type=\"button\" onclick=\"return myclick()\">上传资料</button>");
                        out.print("</div>");
                    }
                %>

                <%
                    ArrayList<Resource> resources= (ArrayList<Resource>) session.getAttribute("resources");
                    int resourcePerPage = (int) session.getAttribute("resourcePerPage");
                    int resourceBeginNum= Integer.parseInt((String)session.getAttribute("resourceBeginNum"));
                    int beginIndex=resourcePerPage*(resourceBeginNum-1);
                    System.out.println(beginIndex);
                    if(resources != null) {
                        for(int i=beginIndex;i<beginIndex+resourcePerPage && i<resources.size();i++) {
                            Resource resource=resources.get(i);
                            System.out.println(resources.size());
                            out.print(" <div class=\"row clients-page\">  <div class=\"col-md-10\">");

                            out.print("<button class=\"btn btn-link\" name=\""+resource.getFileUrl()+resource.getFileName()+"\" onclick=\"return fn(this.name)\">"+resource.getFileName()+"</button>\n");



                            if(isAdmin) {
                                out.print("&nbsp&nbsp&nbsp<button offset=5px class=\"btn btn-info btn-mini\" type=\"button\" name=\""+resource.getId()+"\" onclick=\"return myclick2(this.name)\">修改</button>");
                                out.print("&nbsp&nbsp&nbsp<button offset=5px class=\"btn btn-danger btn-mini\" type=\"button\" name=\""+resource.getId()+"\" onclick=\"return myclick3(this.name)\">删除</button>");
                            }
                            out.print("<p>"+resource.getDescription()+"</p>");

                            out.print(" </div> </div>");
                        }
                    }

                %>
                <!-- Pagination -->
                <div class="text-center md-margin-bottom-30">
                    <p class="demo demo2">
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
        App.init();

    });
</script>
<!--[if lt IE 9]>
<script src="/static/plugins/respond.js"></script>
<script src="/static/plugins/html5shiv.js"></script>
<script src="/static/plugins/placeholder-IE-fixes.js"></script>

<![endif]-->

<script>
    function f(totalNum,currentPage) {

        $('.demo2').bootpag({
            total: parseInt(totalNum),
            page: currentPage,
            maxVisible: 4,
        }).on('page', function(event, num){
            var form =$('<form></form>');
            form.attr("method","post");
            form.attr("action","message");

            var field = $('<input></input>');
            field.attr("type", "hidden");
            field.attr("name", "postType");
            field.attr("value", num);

            form.append(field);
            $(document.body).append(form);

            form.submit();
        });


    }
    f(<%=(resources.size()-1)/resourcePerPage+1%>,<%=resourceBeginNum%>);
    function fn(url) {
        var form =$('<form></form>');
        form.attr("method","post");
        form.attr("action","downloadfile");

        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "fileurl");
        field.attr("value", url);

        form.append(field);
        $(document.body).append(form);
        form.submit();
    }


</script>
<script>
    function  myclick() {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","newResource");
        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "type");
        field.attr("value", "new");

        form.append(field);
        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "id");
        field.attr("value", null);
        form.append(field);
        $(document.body).append(form);
        form.submit();
    }
    function myclick2(id) {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","newResource");

        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "type");
        field.attr("value", "modify");

        form.append(field);
        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "id");
        field.attr("value", id);
        form.append(field);
        $(document.body).append(form);
        form.submit();
    }
    function myclick3(id) {
        var form =$('<form></form>');
        form.attr("method","get");
        form.attr("action","newResource");

        var field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "type");
        field.attr("value", "delete");

        form.append(field);
        field = $('<input></input>');
        field.attr("type", "hidden");
        field.attr("name", "id");
        field.attr("value", id);
        form.append(field);
        $(document.body).append(form);
        form.submit();
    }
</script>

</body>
</html>