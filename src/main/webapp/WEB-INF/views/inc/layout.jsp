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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Favicon 아이콘-->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png">
    
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
     <script type="text/javascript">
	
     </script>
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