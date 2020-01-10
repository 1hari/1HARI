<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script type="text/javascript">
	$(function(){
		//정규표현식
		let pw_pattern = /^[a-z0-9_]{4,10}$/;
		let email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

        let pw_check = false;
        let pwck_check = false;
        let email_check = false;
        
		//이메일 유효성검사
		$('#email').keyup(function(){
            if(email_pattern.test($(this).val()) != true){
                $('#emailcheck').text("이메일 형식에 맞지 않습니다.");
            }else{
                $('#emailcheck').text("이메일 형식에 맞습니다.");
                email_check=true;
            }
        });
	    //인증번호 전송버튼 클릭
		$('#emailSend').click(function() {
			//이메일이 입력되면 새창으로 이동
			if(!email_check){
				alert("이메일이 형식이 올바르지 않습니다.");
				return;
			}else {
				var url = "emailSubmit.hari?email="+$('#email').val();
				open(url,"Email Check","statusber=no, scrollbar=no, menuber=no, width=400, height=130");
				return;
			}
		});

		//창 닫으면 초기화
		$('#closeModal').click(function(){
			console.log('cliack');
			$('#email').val('');
			$('#newPassword').val('');
			$('#newPassword2').val('');
		})
		
		//pw 유효성체크
		$('#newPassword').keyup(function() {
			if (pw_pattern.test($(this).val()) != true){
				$('#pwcheck').text("비밀번호가 조건에 일치하지 않습니다.");
			}else {
				$('#pwcheck').text("사용가능한 비밀번호 입니다.");
				pw_check = true;
			}
		});//이벤트 끝
		
		//pw재입력 체크
		$('#newPassword2').keyup(function() {
			if($('#newPassword').val() != $('#newPassword2').val()){
				$('#pwckcheck').text("비밀번호가 일치하지 않습니다.");
			}else {
				$('#pwckcheck').text("비밀번호가 확인되었습니다.");
				pwck_check = true;
			}
		});//이벤트 끝
		if(pwck_check && pw_check && email_check){
			$('#chaagePassword').removeAttr('disabled');	
		}
		//비밀번호 변경 버튼
// 		$('#chaagePassword').click(function(){
// 			location.href='1hariMy/chaagePassword.hari?password=' + $('#newPassword').val() + '&email=' + $('#email').val();
// 		})
		
	});
</script>

	<!--컨텐츠 시작 -->
    <!--메인 백그라운드 이미지-->
    <div class="hero-wrap" style="background-image: url(resources/index/images/bg_2.jpg);" data-stellar-background-ratio="0.5">
      
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-lg-6 col-md-6 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">1HARI<br><span>HR system</span></h1>
            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="icon-calendar mr-2"></span>2020-01-10 SOUTH KOREA</p>
            <div id="timer" class="d-flex">
						  <div class="time" id="days"></div>
						  <div class="time pl-3" id="hours"></div>
						  <div class="time pl-3" id="minutes"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
					</div>
					<div class="col-lg-2 col"></div>

					<!--로그인 화면 시작-->
			<c:url value="/login" var="loginURL"/>	
          <div class="col-lg-4 col-md-6 mt-0 mt-md-5">
          	<form action="${loginURL}" class="request-form ftco-animate" method="post">
          		<h2>로그인</h2>
	    				<div class="form-group">
	    					<input type="text" id="username" name="username" class="form-control" placeholder="사번 번호 입력">
	    				</div>
	    				<div class="form-group">
	    					<input type="password" id="password" name="password" class="form-control" placeholder="비밀 번호 입력">
	    				</div>
	    				<div class="form-group">
								<div class="checkbox">
								   <label><input type="checkbox" value="" class="mr-2">사번 번호 기억하기</label>
								</div>
							</div>
	            <div class="form-group">
	              <input type="submit" value="로그인"  class="btn btn-primary py-3 px-4">
	              <span data-toggle="modal" data-target="#add-new-event" >이메일 인증하기</span>
	            </div>
	    			</form>
					</div>
					<!--로그인 화면 끝 -->
					
					
					<!--이메일 인증 모달 -->
			<div id="add-new-event" class="modal modal-wide fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" id="closeModal"data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<form action="1hariMy/chaagePassword.hari" method="post">
								<input type="text" class="modal-title" id="email" name="email" placeholder="이메일 주소 입력">
								<small id="emailcheck">이메일을 입력해주세요.</small><br>
								<button type="button" class="btn btn-default" id=emailSend>인증번호 전송</button>
								<input type="password" id="newPassword" name="newPassword"class="form-control" disabled="disabled">
								<small id="pwcheck">비밀번호는 4자~10자 입니다.</small>
								<input type="password" id="newPassword2" name="newPassword2"class="form-control" disabled="disabled">
								<small id="pwckcheck">비밀번호를 다시한번 입력해주세요.</small>
								<button type="submit" id="chaagePassword" class="form-control" disabled="disabled">변경하기</button>
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
              <div class="icon"><span class="flaticon-placeholder"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Venue</h3>
                <p>	203 Fake St. Mountain View, San Francisco, California, USA</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-world"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Transport</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-hotel"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Hotel</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-cooking"></span></div>
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