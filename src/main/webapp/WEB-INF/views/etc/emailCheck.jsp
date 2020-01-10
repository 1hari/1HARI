<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var authNum = '${authNum}';
			console.log(authNum);
			
			$('#authNumCheck').click(function() {
				console.log($('#userAuthNum').val());
				
				//입력값이 없다 
				if($('#userAuthNum').val() == null){
					alser("인증번호가 입력되지 않았습니다.");
					$('#authNumCheck').focus();
					
				//인증번호가 안맞는다					
				}else if($('#userAuthNum').val() != authNum){
					alert("인증번호가 맞지 않습니다.");
					window.self.close();
					
				//인증번호 일치
				}else if($('#userAuthNum').val() == authNum){
					alert("인증되었습니다.");
					$('#emailCheckReturn', parent.opener.document).val("true");
					$('#email', parent.opener.document).attr("readonly", "readonly");
					$('#emailcheck', parent.opener.document).text("이메일 인증이 완료되었습니다.");
					window.self.close();
					//opener.document.joinForm.emailCheckReturn.value = 1;
				}
			});
		});
	</script>
	<header class="topbar" data-navbarbg="skin5">

		<nav class="navbar top-navbar navbar-expand-md navbar-dark">
			<div class="navbar-header" data-logobg="skin5">
				<!-- 모바일용 토글러-->
				<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
					<i class="ti-menu ti-close"></i>
				</a>
				<!-- ============================================================== -->
				<!-- Logo -->
				<!-- ============================================================== -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/main.hari"> <!-- 로고 아이콘 시작 -->
					<b class="logo-icon p-l-10"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
						<!-- 로고 아이콘 png-->
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-img-final.png" alt="homepage" class="light-logo" style="width: 30%; height: 20%;" />
					</b><!--로고 아이콘 끝  -->
					<!-- 로고 글씨 시작 -->
					<span class="logo-text">
						<!-- 로고 글씨 png-->
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-152.png" alt="homepage" class="light-logo" style="width: 200%; height: 20%; margin-left: -120%;" />
					</span> <!-- Logo icon --> <!-- <b class="logo-icon"> --> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
					<!-- </b> --> <!--End Logo icon -->
				</a>
				<!-- 로고 전체 끝 !! -->

				<a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<i class="ti-more"></i>
				</a>
			</div>
			<!-- ============================================================== -->
			<!-- navbar 로고 전체 끝 !!  -->
			<!-- ============================================================== -->
		</nav>
	</header>

	<form method="post" action="" name="emailcheck">
		<div class="form-group" style="text-align:center">
			<label class="control-label" for="email">인증번호를 입력하세요.</label>
			<input type="text" class="form-control " id="userAuthNum" name="userAuthNum" style="width:80%;text-align:center;display:inline;"/>
			<div style="padding-top: 15px">
				<button type="button" class="btn btn-primary" id="authNumCheck">확인</button>
			</div>
		</div>
	</form>
	
	
