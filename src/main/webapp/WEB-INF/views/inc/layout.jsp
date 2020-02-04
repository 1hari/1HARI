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
	<script type="text/javascript">
		const root= "${pageContext.request.contextPath}";
	</script>
	<!-- font awesome 아이콘 -->
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	
	<!-- Favicon 아이콘-->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png">
    
	<!-- css 설정 영역 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css">
<!-- 다채 사랑 폰트  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/stylesheetlove.css">

	<!--toaster (웹 페이지 내 알람) -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	
	<!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- SweetALert -->
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
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/xy_convert.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/dashboards/dashboard1.js"></script> -->
	<!--toaster (웹 페이지 내 알람) -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <!-- 숫자등 포맷 도와주는 JS -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
    <!-- moment js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.css">
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>


    
    
    
    
    
    
    
    
    
    
    
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