<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

				<!--로그인 모달 시작 -->
				<div class="col-12 col-md-10 d-none d-xl-block">
					<nav class="site-navigation position-relative text-right" role="navigation">
						<ul class="site-menu main-menu js-clone-nav mr-auto d-lg-block">
							<li class="dropdown">
								<a href="http://www.jquery2dotnet.com" class="dropdown-toggle" data-toggle="dropdown">로그인<bclass="caret"></b></a>
								<ul class="dropdown-menu" style="padding: 15px; min-width: 250px;">
									<li>
									
										<!-- sign in 로그인 네브바 모달 내려오기  -->
										<form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">아이디 입력</label>
												<input type="email" class="form-control" id="exampleInputEmail2" placeholder="아이디 입력" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">비밀번호 입력</label>
												<input type="password" class="form-control" id="exampleInputPassword2" placeholder="비밀번호 입력" required>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox"> 아이디 기억하기 </label>
											</div>
											<div class="form-group">
												<!-- <button type="submit" class="btn btn-success btn-block">로그인</button>  -->

												<!-- <button type ="button" data-toggle="modal" href="#shortModal" class="btn btn-primary">로그인</button>  -->
												<a href="javascript:void(0)" data-toggle="modal" data-target="#add-new-event" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
													<i class="ti-plus"></i> 로그인
												</a>
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

			<!--인증 모달 -->
			<div id="add" class="modal modal-wide fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">

							<input type="text" class="modal-title" placeholder="인증번호 입력">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<a href="javascript:void(0)" data-toggle="modal" data-target="#add" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
								<i class="ti-plus"></i> 인증하기
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
	</header>