<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<! DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>1HARI</title>
 <!--    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet"> -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/index/css/style.css">
</head>
<body>
	<!-- Header  영역 -->
	<tiles:insertAttribute name="header" />
	
		<!-- index  Content  영역 -->
		<tiles:insertAttribute name="content" />

	<!-- Footer 영역 -->
	<tiles:insertAttribute name="footer" />
</body>


<!--layout 시작-->
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
  <script src="${pageContext.request.contextPath}/resources/index/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/index/js/main.js"></script>
  <!--layout 끝-->
  </body>
</html>