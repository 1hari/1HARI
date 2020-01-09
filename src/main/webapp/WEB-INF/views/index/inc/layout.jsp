<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<! DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>1HARI</title>
	
	<!--link 설정하기 끝 -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900|Oswald:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="resources/index/fonts/icomoon/style.css">
    <link rel="stylesheet" href="resources/index/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/index/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/index/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/index/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/index/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/index/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="resources/index/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/index/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/index/css/aos.css">
    <link rel="stylesheet" href="resources/index/css/style.css">
	
	<!--style 시작 -->
	<style>
	.modal.modal-wide .modal-dialog {
		width: 90%;
	}
	
	.modal-wide .modal-body {
		overflow-y: auto;
	}
	
	/* irrelevant styling */
	body {
		text-align: center;
	}
	
	body p {
		max-width: 400px;
		margin: 20px auto;
	}
	
	#tallModal .modal-body p {
		margin-bottom: 900px
	}
	
	input[type=button], input[type=submit], input[type=reset] {
		background-color: #2ab2aa;
		border: none;
		color: white;
		padding: 15px 80px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		text-transform: uppercase;
		font-size: 13px;
		-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
		box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
		-webkit-border-radius: 5px 5px 5px 5px;
		border-radius: 5px 5px 5px 5px;
		margin: 5px 10px 40px 10px;
		-webkit-transition: all 0.3s ease-in-out;
		-moz-transition: all 0.3s ease-in-out;
		-ms-transition: all 0.3s ease-in-out;
		-o-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;
	}
	
	input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
		{
		background-color: #2ab2aa;
	}
	
	input[type=button]:active, input[type=submit]:active, input[type=reset]:active
		{
		-moz-transform: scale(0.95);
		-webkit-transform: scale(0.95);
		-o-transform: scale(0.95);
		-ms-transform: scale(0.95);
		transform: scale(0.95);
	}
	
	input[type=text] {
		background-color: #f6f6f6;
		border: none;
		color: #0d0d0d;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 5px;
		width: 85%;
		border: 2px solid #f6f6f6;
		-webkit-transition: all 0.5s ease-in-out;
		-moz-transition: all 0.5s ease-in-out;
		-ms-transition: all 0.5s ease-in-out;
		-o-transition: all 0.5s ease-in-out;
		transition: all 0.5s ease-in-out;
		-webkit-border-radius: 5px 5px 5px 5px;
		border-radius: 5px 5px 5px 5px;
	}
	
	input[type=text]:focus {
		background-color: #fff;
		border-bottom: 2px solid #2ab2aa;
	}
	
	input[type=text]:placeholder {
		color: #cccccc;
	}
	</style>
	<!--style 끝 -->
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<!-- Header  영역 -->
	<tiles:insertAttribute name="header" />
	<div id="index">
		<!-- index  Content  영역 -->
		<tiles:insertAttribute name="content" />
	</div>

	<!-- Footer 영역 -->
	<tiles:insertAttribute name="footer" />
</body>
	<!--로그인 전 메인화면에서 필요한 js -->
	<script src="resources/index/js/jquery-3.3.1.min.js"></script>
	<script src="resources/index/js/jquery-ui.js"></script>
	<script src="resources/index/js/popper.min.js"></script>
	<script src="resources/index/js/bootstrap.min.js"></script>
	<script src="resources/index/js/owl.carousel.min.js"></script>
	<script src="resources/index/js/jquery.countdown.min.js"></script>
	<script src="resources/index/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/index/js/jquery.easing.1.3.js"></script>
	<script src="resources/index/js/aos.js"></script>
	<script src="resources/index/js/jquery.fancybox.min.js"></script>
	<script src="resources/index/js/jquery.sticky.js"></script>
	<script src="resources/index/js/main.js"></script>
	<!--필요한 js 끝 -->
	
	<!--모달 스크립트 js -->
	<script>	
		$(".modal-wide").on("show.bs.modal", function() {
		  var height = $(window).height() - 200;
		  $(this).find(".modal-body").css("max-height", height);
		});
	</script>
</html>