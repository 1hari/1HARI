<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="site-wrap"> <!-- 끝 footer 부분에 있음 -->
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<!--메뉴 바 -->
	<header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
		<div class="container">
			<div class="row align-items-center">

				<!-- 로고 쪽 -->
				<div class="col-6 col-xl-2">
					<h1 class="mb-0 site-logo m-0 p-0">
						<a href="index.html" class="mb-0">1HARI</a>
					</h1>
				</div>
				<!-- 로고 끝 -->
				<c:url value="/login" var="loginURL"/>
				<!--로그인 모달 시작 -->
				<div class="col-12 col-md-10 d-none d-xl-block">
					<nav class="site-navigation position-relative text-right" role="navigation">
						<ul class="site-menu main-menu js-clone-nav mr-auto d-lg-block">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">로그인<bclass="caret"></b></a>
								<ul class="dropdown-menu" style="padding: 15px; min-width: 250px;">
									<li>
										<!-- sign in 로그인 네브바 모달 내려오기  -->
										<form class="form" role="form" method="post" action="${loginURL}" accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">아이디 입력</label>
												<input type="text" class="form-control" name="username" id="exampleInputEmail2" placeholder="사번 입력" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">비밀번호 입력</label>
												<input type="password" name="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호 입력" required>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox"> 아이디 기억하기 </label>
											</div>
											<div class="form-group">
												<!-- <button type="submit" class="btn btn-success btn-block">로그인</button>  -->

												<!-- <button type ="button" data-toggle="modal" href="#shortModal" class="btn btn-primary">로그인</button>  -->
												<input type="submit" value="로그인" data-toggle="modal" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
												<label><a href="emailSubmit.hari"style="color: black">비밀번호 초기화</a></label>
											</div>
										</form>
									</li>
								</ul>
							</li>
						</ul> 
					</nav>
				</div>
				<!--<div class="col-12 col-md-10 d-none d-xl-block"> 끝 -->
				
			</div>
			<!--  <div class="row align-items-center"> 끝-->

			<!--이메일 인증 모달 -->
			<div id="add-new-event" class="modal modal-wide fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<input type="text" class="modal-title" placeholder="이메일 주소 입력">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<input type="password" id="password" class="form-control">
							<input type="password" id="password2" class="form-control">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<a href="javascript:void(0)" data-toggle="modal" data-target="#add" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
								<i class="ti-plus"></i> 인증번호 받기
							</a>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
		<!--컨테이너 메뉴 바  <div class="container"> 끝 -->

		<!--toggle 더보기 클릭하면 나오는 거-->
		<div class="col-6 d-inline-block d-xl-none ml-md-0 py-3">
			<a href="#" class="site-menu-toggle js-menu-toggle text-white float-right">
				<span class="icon-menu h3"></span>
			</a>
		</div>
		<!--toggle 끝 -->
		
		<div class="modal fade" id="join" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog2">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<form role="form" id="joinForm" name="joinForm" action="join.do" method="post">
					<div class="modal-body">
						
							<div class="form-group">
								<label class="control-label" for="userid">아이디</label>
								<input type="text" class="form-control" id="userid" name="userid">
								<small id="idcheck">아이디는 4자~6자 입니다.</small>
							</div>
							
							<div class="form-group">
								<label class="control-label" for="userpw">비밀번호</label>
								<input type="password" class="form-control" id="userpw" name="userpw">
								<small id="pwcheck">비밀번호는 4자~10자 입니다.</small>
							</div>
							
							<div class="form-group">
								<label class="control-label" for="userpwCk">비밀번호 확인</label>
								<input type="password" class="form-control" id="userpwCk">
								<small id="pwckcheck">비밀번호를 다시한번 입력해주세요.</small>
							</div>
							
							<div class="form-group">
								<label class="control-label" for="email">이메일</label>
								<input type="text" class="form-control" id="email" name="email">
								<small id="emailcheck">이메일을 입력해주세요.</small>
								<div style="text-align: right;">
									<button type="button" class="btn btn-primary" id="emailCheck" disabled="disabled">인증</button>
								</div>
								<input type="hidden" id="emailCheckReturn" name="emailCheckReturn" value="false">
							</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary" id="submit">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</header>