<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>
		<tiles:getAsString name="title"/>	
	</title>
	
	<!-- font awesome 아이콘 -->
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	
	<!-- Favicon 아이콘-->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png">
    
	<!-- css 설정 영역 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css">
	
	<!--toaster (웹 페이지 내 알람) -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	
	<!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/dashboards/dashboard1.js"></script> -->
	<!--toaster (웹 페이지 내 알람) -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    

    
    
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/css/select2.min.css"> --%>
	
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/mask/mask.init.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.full.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script> --%>
<%--     <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.css"> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/quill/dist/quill.min.js"></script> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.css">
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>

    <script type="text/javascript">

    </script>
    
    
    
    
    
    
    
    
    
    
    
    <!--  -->
</head>
<body>
	<!-- header 영역 -->
	<tiles:insertAttribute name="header" />
	
	<!-- aside 영역 -->
	<tiles:insertAttribute name="aside" />
	
	<!-- content 영역 -->
	<tiles:insertAttribute name="content" />
	
	<!-- footer 영역 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>