<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/colorcode/assets/img/icon.ico" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/webfont/webfont.min.js"></script>
<!-- 	<script type = "text/javascript">
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['.../assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script> -->

	<!-- CSS Files -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/colorcode/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/colorcode/assets/css/azzara.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/colorcode/assets/css/demo.css">

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
</body>


<!--   Core JS Files-->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/core/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/core/bootstrap.min.js"></script>

<!-- jQuery UI -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Moment JS -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/moment/moment.min.js"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- Bootstrap Toggle -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Google Maps Plugin -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/gmaps/gmaps.js"></script>

<!-- Sweet Alert -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Azzara JS -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/ready.min.js"></script>

<!-- Azzara DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/setting-demo.js"></script>
<script src="${pageContext.request.contextPath}/resources/colorcode/assets/js/demo.js"></script>
</body>
</html>