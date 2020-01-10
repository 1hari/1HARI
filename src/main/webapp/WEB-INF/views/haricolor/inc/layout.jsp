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
	
	<!-- Favicon 아이콘-->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png"> <!-- navbar 아이콘 -->
    
	<!-- css 설정 영역 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css">
	
	<!-- All Jquery -->
    <!-- dashboard.html에서 필요한 제이쿼리 부분 -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/sparkline/sparkline.js"></script>
    <!-- Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/waves.js"></script>
    <!-- Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/sidebarmenu.js"></script>
    <!-- Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/hari/dist/js/custom.min.js"></script>
     <!-- dashboard.html에서 필요한 제이쿼리 부분 끝 -->

	<!--위에는 원래 있던 제이쿼리들 -->

	
	
	
	
	
	<!-- 칼라 코드 때문에 넣은 link와 script -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/colorcode/assets/img/icon.ico" type="image/x-icon"/> <!--아이콘 -->
	
	<!-- Fonts and icons -->
	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/webfont.min.js"></script> <!--아이콘 플러그인 -->
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['resources/colorcode/assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script> 

	<!-- CSS Files -->
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/colorcode/assets/css/azzara.min.css"><!-- 네브바 CSS -->
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/colorcode/assets/css/demo.css">
	<!-- 칼라 코드 때문에 넣은 link와 script 끝 -->
	
	
	
	
	
	
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






	<!-- 아래는 칼라코드에 필요한 제이쿼리들   -->

	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/core/jquery.3.2.1.min.js"></script>
<!-- 	<script src="assets/js/core/popper.min.js"></script> -->
<!-- 	<script src="assets/js/core/bootstrap.min.js"></script> -->
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/jquery-ui.min.js"></script><!--필요!! -->
<!-- 	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script> -->
	<!-- Bootstrap Toggle -->
	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/bootstrap-toggle.min.js"></script> <!--필요!! -->
	<!-- jQuery Scrollbar -->
	<!-- <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script> -->
	<!-- Azzara JS -->
	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/ready.min.js"></script> 
	<!-- Azzara DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/setting-demo.js"></script> <!--필요! -->
</body>
</html>