<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script type="text/javascript">
	$(function(){
			//이메일 인증
		$('#emailCheck').click(function() {
			//이메일이 입력되면 새창으로 이동
			if($('#emailCheck').val() != null){
				var url = "emailSubmit.hari?email="+$('#email').val();
				//console.log(url);
				open(url,"Email Check","statusber=no, scrollbar=no, menuber=no, width=400, height=130");
			}else {
				alert("이메일이 입력되지 않았습니다.");
			}
		});//이벤트 끝
		$('#closeModal').click(function(){
			console.log('cliack');
			$('#email').val('');
			})
		$('#chaagePassword').click(function(){
		})
		
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
							<input type="text" class="modal-title" id="email" placeholder="이메일 주소 입력">
							<button type="button" class="btn btn-default" id="emailCheck">인증번호</button>
							<input type="password" id="password" class="form-control" disabled="disabled">
							<input type="password" id="password2" class="form-control" disabled="disabled">
							<button type="button" id="chaagePassword" class="form-control" disabled="disabled">변경하기</button>
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