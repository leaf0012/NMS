<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>告警系统 | 系统定义</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- FontAwesome 4.3.0 -->
    <link href="/resources/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <!-- uniform -->
    <link href="/resources/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="/resources/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/css/skins/_all-skins.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/css/components.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>

    <link href="/resources/plugins/sweetalert-master/sweetalert.css" rel="stylesheet" type="text/css"/>
</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../common/header.jsp" flush="true"/>
    <jsp:include page="../common/menu.jsp" flush="true"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <i class="fa fa-dashboard"></i> Home > 系统配置 > 监控对象管理 >
                <small>系统定义</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form:form id="form_system" class="form-horizontal" action="/config/system/save"
                                       method="post"
                                       modelAttribute="system">
                                <div class="form-body">
                                    <div class="alert alert-danger display-hide">
                                        <button class="close" data-close="alert"></button>
                                        部分配置项校验失败，请检查输入！
                                    </div>
                                    <div class="alert alert-success display-hide">
                                        <button class="close" data-close="alert"></button>
                                        校验通过！
                                    </div>
                                    <form:input type="hidden" id="system-id" name="id" value="${system.id}"
                                                path="id"/>

                                    <div class="form-group">
                                        <name class="control-label col-md-3">系统名称 <span class="required">
										* </span>
                                        </name>

                                        <div class="col-md-4">
                                            <form:input type="text" name="name" value="${system.name}"
                                                        data-required="1"
                                                        class="form-control"
                                                        path="name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <name class="control-label col-md-3">系统编码 <span class="required">
										* </span>
                                        </name>

                                        <div class="col-md-4">
                                            <form:input type="text" name="code" value="${system.code}"
                                                        data-required="1"
                                                        class="form-control"
                                                        path="code"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <name class="control-label col-md-3">备注</name>

                                        <div class="col-md-4">
                                            <form:input name="desc" value="${system.desc}" type="text"
                                                        class="form-control" path="desc"/>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn blue">提交</button>
                                            <button id="cancel_form_system" type="button" class="btn default">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <!-- END FORM-->
                        </div>
                        <!-- END VALIDATION STATES-->
                    </div>
                </div>
            </div>
        </section>

    </div>

    <jsp:include page="../common/footer.jsp" flush="true"/>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.1.4 -->
<%--<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>--%>
<script src="/resources/scripts/common/jquery.min.js" type="text/javascript"></script>
<!-- uniform -->
<script src="/resources/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/plugins/bootstrap/scripts/bootstrap.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/resources/scripts/app.js" type="text/javascript"></script>

<!-- data picker -->
<script src="/resources/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- jquery validate -->
<script src="/resources/plugins/jquery-validation/js/jquery.validate.js" type="text/javascript"></script>
<script src="/resources/plugins/jquery-validation/js/additional-methods.js" type="text/javascript"></script>

<script src="/resources/plugins/sweetalert-master/sweetalert.min.js" type="text/javascript"></script>

<script src="/resources/scripts/common/common.js" type="text/javascript"></script>
<script src="/resources/scripts/config/system.js" type="text/javascript"></script>

<script>
    jQuery(document).ready(function () {
        SystemFormValidation.init();
    });
</script>
</body>
</html>
