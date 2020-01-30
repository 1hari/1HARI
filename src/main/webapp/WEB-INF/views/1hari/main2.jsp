<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">


</script>



	<style>
		
	</style>
<style type="text/css">/* Chart.js */
@keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}</style></head>
<body>
	
<!-- 페이지 내 컨텐츠 제목 란 시작  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->

	<div class = "a" style ="width: 100%; height: 250px; background-color: #d9d9d9; opacity:0.8;"><!-- 대시보드 안에 그림넣기div background-image:url(resources/hari/assets/images/divbg_10.png); !!!!!!!!!!!!!!!!1 -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h1 class="page-title">날씨 페이지 </h1>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<div>
	 	<!-- rain비  우산-->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_rain.png" alt="user" class="rounded-circle" width="31">
		<!-- snow 눈 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_snow.png" alt="user" class="rounded-circle" width="31">							
		<!-- sun 해 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_sun.png" alt="user" class="rounded-circle" width="31">	
		<!-- storm 구름 흐림 +비 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_storm.png" alt="user" class="rounded-circle" width="31">	
		<!-- wind 바람 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_wind.png" alt="user" class="rounded-circle" width="31">	
		
	</div>
	
</div>
</div>
</body>

