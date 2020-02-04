<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 시큐리티에서 넘겨준 error 메세지 -->
<c:set var="error" value="${requestScope.ERRORMSG}" />
<script type="text/javascript">

	$(function() {
		//로그인 실패 여부 확인 및 에러메세지 출력
		var error ='${error}'
			if(error !="null" && error.trim() != ''){ //에러메세지가 null이 아니거나, 빈값이 아니면
				var errorSpl=error.split(',')
				swal({
					title:errorSpl[0],
					text: errorSpl[1],
					icon: "warning",
					button: "확인"
				})	.then((value)=>{
					location.href="${pageContext.request.contextPath}"
				})

			}
		//정규표현식
		let pw_pattern = /^[a-z0-9_]{4,10}$/;
		let email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var form = $('loginform');
		let pw_check = false;
		let pwck_check = false;
		let email_check = false;
		let isExist = false;

		$("#password").keydown(function(key) {
			if (key.keyCode == 13) { // 13 = Enter Key
				login();
			}
		});
       
		//이메일 유효성검사
		$('#email').keyup(function() {
			if(email_pattern.test($(this).val()) != true){
				$('#emailcheck').text("이메일 형식에 맞지 않습니다.");
				email_check = false;
			} else {
				$('#emailcheck').text("이메일 형식에 맞습니다.");
				email_check = true;
			}
		});

		var empNum=$('#empNum').val();
		var email=$('#email').val();
		//인증번호 전송버튼 클릭
		$('#emailSend').click(function() {
			//이메일 형식체크
			if (!email_check) {
				swal({
					text: "이메일을 확인해주세요.",
					button: "닫기"
				});
				return;
			} else {
				//이메일 형식이 맞으면 사번과 이메일이 일치하는 계정이 있는지 확인
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/empNumEmail.hari",
					type: "post",
					data:
						{
							"empNum": $('#empNum').val(),
							"email": $('#email').val()
						},
					dataType: "text",
					success: function(data) {
						//있으면 true, 없으면 false
						isExist = data;
	
						if (isExist == false) {
							swal({
								text: "이메일 또는 사번을 잘못 입력하셨습니다.",
								icon: "warning",
								button: "닫기"
							});
							return;
						} else {
							//인증번호 입력 창 오픈
							var url = "emailSubmit.hari?email=" + $('#email').val();
							open(url, "Email Check", "statusber=no, scrollbar=no, menuber=no, width=560, height=240 top=270 left=530");
						}
					}
				});
			}
		});

		//창 닫으면 초기화
		$('#closeModal').click(function() {
			$('#email').val('');
			$('#empNum').val('');
			$('#newPassword').val('');
			$('#newPassword2').val('');
		})

		//비밀번호 유효성검사
		$('#newPassword').keyup(function() {
			if (pw_pattern.test($(this).val()) != true) {
				$('#pwcheck').text("비밀번호가 조건에 일치하지 않습니다.");
				pw_check = false;
			} else {
				$('#pwcheck').text("사용가능한 비밀번호 입니다.");
				pw_check = true;
			}
		});

		//비밀번호 확인
		$('#newPassword2').keyup(function() {
			if ($('#newPassword').val() != $('#newPassword2').val()) {
				$('#pwckcheck').text("비밀번호가 일치하지 않습니다.");
				pwck_check = false;
			} else {
				$('#pwckcheck').text("비밀번호가 확인되었습니다.");
				pwck_check = true;
			}
		});

		$('#updatePassword').click(function() {
			if (pwck_check && pw_check && email_check) {
				swal({
					text: "비밀번호가 변경되었습니다.",
					icon: "success",
					button: "확인"
				}).then((value) => {
					$('#add-new-event').modal("hide");
					$('#update').submit();
				});
			} else {
				swal({
					text: "비밀번호가 일치하지 않습니다.",
					icon: "warning",
					button: "닫기"
				});
			}
		})
	});

	//로그인
	function login() {
		if ($('#username').val().trim() == '' || $('#username').val() == null) {
			$('#usernamecheck').text("사번을 입력해주세요.");
			$('#username').focus();
			
			$('#username').keyup(function() {
				$('#usernamecheck').text("");
			});
			return;
		}
		
		if ($('#password').val().trim() == '' || $('#password').val() == null) {
			$('#passwordcheck').text("비밀번호를 입력해주세요.");
			$('#passwordcheck').focus();

			$('#password').keyup(function() {
				$('#passwordcheck').text("");
			});
			return;
		}

		// 로그인 실패 시 알림 구현 해야함
		$('#loginform').submit();
	}
</script>

	<!--컨텐츠 시작 -->
	<!--메인 백그라운드 이미지-->
	<div class="hero-wrap" style="background-image: url(resources/index/images/bg_4.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
				<div class="col-lg-6 col-md-6 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">1HARI<br>
						<span>HR system</span>
					</h1>
					<p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
				</div>
				<div class="col-lg-2 col"></div>
				<!--로그인 화면 시작-->
				<c:url value="/login" var="loginURL"/>   
				<div class="col-lg-4 col-md-6 mt-0 mt-md-5" style = "border-radius:10px;">
					<form action="${loginURL}" class="request-form ftco-animate" method="post" name="loginform" id="loginform" style ="box-shadow :3px 3px #999999;">
						<h4 style ="font-size: x-large; color: black; font-family: 'Nanum DaCaeSaRang';font-weight: bold;">로그인</h4>
						<div class="form-group">
							<input type="text" id="username" name="username" class="form-control" placeholder="사번 입력" >
							<span id="usernamecheck" style="font-size: 14px; color: red;"></span>
						</div>
						<div class="form-group">
							<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호 입력" >
							<span id="passwordcheck" style="font-size: 14px; color: red;"></span>
						</div>
						<div class="form-group">
							<input type="button" value="로그인" onclick="login();" class="btn btn-primary py-3 px-4">
							<br>
							<span data-toggle="modal" data-target="#add-new-event" style="cursor:pointer;">이메일 인증하기</span>
						</div>
					</form>
				</div>
				<!--로그인 화면 끝 -->
               
				<!--이메일 인증 모달 -->
				<div id="add-new-event" class="modal modal-wide fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5>이메일 인증하기</h5>
								<button type="button" class="close" id="closeModal"data-dismiss="modal" aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/updatePassword.hari" method="post" id="update">
									<div class="input-group">
										<span class="input-group-addon" >
											<small>&nbsp;</small>
											<i class="fa fa-user fa-2x"></i>
										</span>
										<small>&nbsp;&nbsp;</small>
										<input type="text" class="form-control" id="empNum" name="empNum" placeholder="사번 입력">
									</div>
									<small>&nbsp;</small>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-envelope fa-2x"></i>
										</span>
										<small>&nbsp;</small>
										<input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소 입력">
									</div>
									<small id="emailcheck">이메일을 입력해주세요.</small><br>
									<button type="button" class="btn btn-default" id=emailSend>
										<strong>
											<i class="fa fa-paper-plane fa-1x"></i>&nbsp;인증번호 전송
										</strong>
									</button>
									<input type="password" id="newPassword" name="newPassword"class="form-control" disabled="disabled">
									<small id="pwcheck">비밀번호는 4자~10자 입니다.</small>
									<input type="password" id="newPassword2" name="newPassword2"class="form-control" disabled="disabled">
									<small id="pwckcheck">비밀번호를 다시 한 번 입력해주세요.</small>
									<br>
									<br>
									<div style="text-align:center;">
										<button type="button" id="updatePassword" class="btn btn-primary py-3 px-4" disabled="disabled">변경하기</button>
									</div>
								</form>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				
			</div>
		</div>
	</div>
	
	<!--회사 소개 페이지 컨텐츠 시작 -->
	<section class="ftco-section services-section bg-primary">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-placeholder"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Venue</h3>
							<p>   203 Fake St. Mountain View, San Francisco, California, USA</p>
						</div>
					</div>      
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-world"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Transport</h3>
							<p>A small river named Duden flows by their place and supplies.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							<span class="flaticon-hotel"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Hotel</h3>
							<p>A small river named Duden flows by their place and supplies.</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block">
						<div class="icon">
							 <span class="flaticon-cooking"></span>
						</div>
						<div class="media-body">
							<h3 class="heading mb-3">Restaurant</h3>
							<p>A small river named Duden flows by their place and supplies.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--회사 소개 페이지 컨텐츠 끝 -->
<!--컨텐츠 끝!!  -->
          
<!--main 화면 끝입니다 contents -->