<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	
<style><!--토글 css 이 페이지에서 필수 -->
	.custom-template {
	position:absolute; /*fixed*/
/* 	top: 50%; */
	transform: translateY(-50%);
	right: -325px;
	width: 325px;
	height: max-content;
	display: block;
	z-index: 1;
	background: #ffffff;
	transition: all .3s;
	z-index: 1003;
	box-shadow: -1px 1px 20px rgba(69, 65, 78, 0.15);
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	transition: all .5s;
}

.custom-template.open {
	right: 0px;
}

.custom-template .custom-toggle {
	position: absolute;
	width: 45px;
	height: 45px;
	background: rgb(88, 103, 221);
	/* top: 50%; */
	/* left: -45px; */
	transform: translateY(-100%);
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: 1px solid #177dff;
	cursor: pointer;
	color: #ffffff;
	box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
}

.custom-template .custom-toggle i {
	font-size: 20px;
	animation: 1.3s spin linear infinite;
}

.custom-template .title{
    padding: 15px;
    text-align: left;
    font-size: 16px;
    font-weight: 600;
    color: #ffffff;
    border-top-left-radius: 5px;
    border-bottom: 1px solid #ebedf2;
    background: #5867dd;
}

.custom-template .custom-content{
	padding: 20px 15px;
	overflow: auto;
}

.custom-template .switcher {
	padding: 5px 0;
}

.custom-template .switch-block h4 {
	font-size: 13px;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	margin-bottom: 0;
	text-transform: uppercase;
}

.custom-template .btnSwitch {
	margin-top: 20px;
	margin-bottom: 25px;
}

.custom-template .btnSwitch button {
	border: 0px;
	height: 20px;
	width: 20px;
	outline: 0;
	margin-right: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	padding: 0;
	border-radius: 50%;
	border: 2px solid #eee;
	position: relative;
	transition: all .2s;
}

.custom-template .btnSwitch button:hover{
	border-color: #0bf;
}

.custom-template .btnSwitch button.selected{
	border-color: #0bf;
}

.custom-template .img-pick {
	padding: 4px;
	min-height: 100px;
	border-radius: 5px;
	cursor: pointer;
}

.custom-template .img-pick img {
	height: 100%;
	height: 100px;
	width: 100%;
	border-radius: 5px;
	border: 2px solid transparent;
}

.custom-template .img-pick:hover img, .custom-template .img-pick.active img{
	border-color: #177dff;
}

.demo .btn, .demo .progress{
	margin-bottom: 15px !important;
}

.demo .form-check-label, .demo .form-radio-label{
	margin-right: 15px;
}

.demo .toggle, .demo .btn-group{
	margin-right: 15px;
}

.demo #slider{
	margin-bottom: 15px;
}

.table-typo tbody > tr > td{
	border-color: #fafafa;
}

.table-typo tbody > tr > td:first-child{
	min-width: 200px;
	vertical-align: bottom;
}

.table-typo tbody > tr > td:first-child p{
	font-size: 14px;
	color: #333;
}

.demo-icon {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 20px;
	padding: 10px;
	transition: all .2s;
}

.demo-icon:hover{
	background-color: #f4f5f8;
	border-radius: 3px;
}

.demo-icon .icon-preview{
	font-size: 1.8rem;
	margin-right: 10px;
	line-height: 1;
	color: #333439;
}

.demo-icon .icon-class{
	font-weight: 300;
	font-size: 13px;
	color: #777;
}

.form-show-notify .form-control{
	margin-bottom: 15px;
}

.form-show-notify label{
	padding-top: 0.65rem;
}

.map-demo {
	height: 300px;
}

#instructions li{
	padding: 5px 0;
}

.row-demo-grid{
	margin-bottom: 15px;
}

.row-demo-grid [class^="col"]{
	text-align: center;
}

.row-demo-grid [class^="col"] .card-body{
	background: #ddd;
}

.btnSwitch button[data-color="default"] {
	background-color: #fff;
}
.btnSwitch button[data-color="black"] {
	background-color: #191919;
}
.btnSwitch button[data-color="dark"] {
	background-color: #282a3c;
}
.btnSwitch button[data-color="blue"] {
	background-color: #177dff;
}
.btnSwitch button[data-color="purple"] {
	background-color: #716aca;
}
.btnSwitch button[data-color="light-blue"] {
	background-color: #05b4d8;
}
.btnSwitch button[data-color="green"] {
	background-color: #35cd3a;
}
.btnSwitch button[data-color="orange"] {
	background-color: #ffa534;
}
.btnSwitch button[data-color="red"] {
	background-color: #f3545d;
}
.btnSwitch button[data-color="bg1"] {
	background-color: #fafafa;
}
.btnSwitch button[data-color="bg2"] {
	background-color: #fff;
}
.btnSwitch button[data-color="bg3"] {
	background-color: #f1f1f1;
}

@media screen and (max-width: 550px){
	.table-typo tr td{
		display: flex;
		align-items: center;
		word-break: break-word;
	}

	.table-typo tr td:first-child p{
		margin-bottom: 0px;
	}
}

@media screen and (max-width: 576px){
	.custom-template .custom-content {
		overflow: auto;
	}
	.form-show-notify > .text-right, .form-show-validation > .text-right {
		text-align: left !important;
	}
}

@media screen and (max-width: 400px) {
	.custom-template {
		width: 85% !important;
		right: -85%;
	}
}


/* _layouts-color.scss  */

/*     	Customable Layouts Colors     */

.main-header[data-background-color] {
	.btn-minimize {
		color: #fff !important;
	}
	.logo-header{
		background-color: rgba(31, 30, 30, 0.12) !important;
		.navbar-toggler {
			.navbar-toggler-icon {
				color: $white-color !important;
			}
		}
		.more {
			color: $white-color !important;
		}
	}
	.navbar-header{
		.nav-search{
			.input-group {
				border: 0;
				background: rgba(31, 30, 30, 0.12) !important;
				box-shadow: inset 0 1px 0 0 rgba(61, 70, 79, 0);
				transition: all .4s;
				.form-control {
					color: $white-color !important;
					&::-webkit-input-placeholder { /* Chrome/Opera/Safari */
						opacity: 1;
					}
					&::-moz-placeholder { /* Firefox 19+ */
						opacity: 1;
					}
					&:-ms-input-placeholder { /* IE 10+ */
						opacity: 1;
					}
					&:-moz-placeholder { /* Firefox 18- */
						opacity: 1;
					}
				}
				.search-icon {
					color: $white-color !important;
				}
				&.focus {
					background: #fff !important;
					.form-control {
						color: inherit !important;
						&::-webkit-input-placeholder { /* Chrome/Opera/Safari */
							color: #bfbfbf !important;
						}
						&::-moz-placeholder { /* Firefox 19+ */
							color: #bfbfbf !important;
						}
						&:-ms-input-placeholder { /* IE 10+ */
							color: #bfbfbf !important;
						}
						&:-moz-placeholder { /* Firefox 18- */
							color: #bfbfbf !important;
						}
					}
					.search-icon {
						color: #bfbfbf !important;
					}
				}
			}
		}
		.navbar-nav .nav-item {
			.nav-link {
				color: $white-color !important;
				&:hover, &:focus {
					background: rgba(31, 30, 30, 0.12) !important;
				}
			}
			&.active {
				.nav-link {
					background: rgba(31, 30, 30, 0.12) !important;
				}
			}
		}
	}
}

@mixin main-header-state-style($color) {
	background: $color !important;
}

@mixin logo-header-state-style($color) {
	background: $color !important;
	&:after {
		background: $transparent-bg !important;
	}
}

@mixin navbar-header-state-style($color) {
	.navbar-header {
		background: $color !important;
	}
}

@mixin sidebar-state-style($color, $opacity) {
	background: $color !important;
	.sidebar-background {
		&:after {
			background: $color;
			opacity: $opacity;
		}
	}
}

/* //[data-background-color="dark"] 
 */
.main-header[data-background-color="dark"] {
	@include main-header-state-style($default-color);
	@include navbar-header-state-style($default-color);
}

/* //[data-background-color="blue"] */

.main-header[data-background-color="blue"] {
	@include main-header-state-style($primary-color);
	@include navbar-header-state-style($primary-color);
}
/* 
//[data-background-color="purple"] */

.main-header[data-background-color="purple"] {
	@include main-header-state-style($secondary-color);
	@include navbar-header-state-style($secondary-color);
}
/* 
//[data-background-color="purple"] */

.main-header[data-background-color="light-blue"] {
	@include main-header-state-style($info-color);
	@include navbar-header-state-style($info-color);
}
/* 
//[data-background-color="orange"] */

.main-header[data-background-color="orange"] {
	@include main-header-state-style($warning-color);
	@include navbar-header-state-style($warning-color);
}
/* 
//[data-background-color="green"] */

.main-header[data-background-color="green"] {
	@include main-header-state-style($success-color);
	@include navbar-header-state-style($success-color);
}

/* //[data-background-color="red"] */

.main-header[data-background-color="red"] {
	@include main-header-state-style($danger-color);
	@include navbar-header-state-style($danger-color);
}

</style>

	
<!-- 페이지 내 컨텐츠 제목 란 시작  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">대시보드</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- 페이지 내 컨텐츠 제목 란 끝  -->
	
	
 	

	<!-- 페이지내 컨텐츠 컨테이너 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-md-6">
			
			
			
				<!-- Custom template | don't include it in your project! 수정한 부분 나중에 다시 고칠 것 !!  2020.01.13 수연 -->
				
				
<div class="main-panel">
<div class="content">
	<div class="page-inner">
		<div class="custom-template">
			<div class="title">Settings</div>
			<div class="custom-content">
				<div class="switcher">
					<div class="switch-block">
					
					
					
						<h4>Topbar</h4>
						<div class="btnSwitch">
							<button type="button" class="changeMainHeaderColor" data-color="blue"></button>
							<button type="button" class="selected changeMainHeaderColor" data-color="purple"></button>
							<button type="button" class="changeMainHeaderColor" data-color="light-blue"></button>
							<button type="button" class="changeMainHeaderColor" data-color="green"></button>
							<button type="button" class="changeMainHeaderColor" data-color="orange"></button>
							<button type="button" class="changeMainHeaderColor" data-color="red"></button>
						</div>
					</div>
					<div class="switch-block">
						<h4>Background</h4>
						<div class="btnSwitch">
							<button type="button" class="changeBackgroundColor" data-color="bg2"></button>
							<button type="button" class="changeBackgroundColor selected" data-color="bg1"></button>
							<button type="button" class="changeBackgroundColor" data-color="bg3"></button>
						</div>
					</div>
				</div>
			</div>
			<div class="custom-toggle">
				<i class="fas fa-cogs"></i>
				<!-- <i class="flaticon-settings"></i> -->
			</div>
		</div>
		</div>
		</div>
		</div>
		<!-- End Custom template -->
		
		

				<!-- 공지사항 시작  -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">공지사항</h4>
					</div>
					<ul class="list-style-none">

						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-plus w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Maruti is a Responsive Admin theme</a>
								<span class="text-muted">But already everything was solved. It will ...</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">19</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-leaf w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Envato approved Maruti Admin template</a>
								<span class="text-muted">i am very happy to approved by TF</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">20</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-question-circle w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0"> I am alwayse here if you have any question</a>
								<span class="text-muted">we glad that you choose our template</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">15</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-plus w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Maruti is a Responsive Admin theme</a>
								<span class="text-muted">But already everything was solved. It will ...</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">19</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
				<!--공지사항 끝 -->

				<!--time line 시작 -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">타임라인</h4>
					</div>
					
					<div class="comment-widgets scrollable">
						<!-- Comment Row -->
						<div class="d-flex flex-row comment-row m-t-0">
							<div class="p-2">
								<img src="resources/hari/assets/images/users/1.jpg" alt="user" width="50" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h6 class="font-medium">James Anderson</h6>
								<span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
								<div class="comment-footer">
									<span class="text-muted float-right">April 14, 2016</span>
									<button type="button" class="btn btn-cyan btn-sm">Edit</button>
									<button type="button" class="btn btn-success btn-sm">Publish</button>
									<button type="button" class="btn btn-danger btn-sm">Delete</button>
								</div>
							</div>
						</div>

						<!-- Comment Row -->
						<div class="d-flex flex-row comment-row">
							<div class="p-2">
								<img src="resources/hari/assets/images/users/3.jpg" alt="user" width="50" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h6 class="font-medium">Johnathan Doeting</h6>
								<span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
								<div class="comment-footer">
									<span class="text-muted float-right">August 1, 2016</span>
									<button type="button" class="btn btn-cyan btn-sm">Edit</button>
									<button type="button" class="btn btn-success btn-sm">Publish</button>
									<button type="button" class="btn btn-danger btn-sm">Delete</button>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!--타임 라인 끝-->

			</div>
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (공지사항 + 타임라인 합친 부분) 끝 -->

			<!--오른쪽 div 컨테이너 부분 시작 (전자결재 + 투두리스트)-->
			<div class="col-md-6">

				<!--전자 결재 시작-->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">진행중<br>문서
									<td>0</td>
								</th>
								<th scope="col">보류중<br>문서
									<td>2</td>
								</th>
							</tr>
							
							<tr>
								<th scope="col">결제중<br>문서
									<td>0</td>
								</th>
								<th scope="col">보류중<br>문서
									<td>2</td>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<!--전자 결재 끝 -->

				<!-- todo list 시작 -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">To Do List</h4>
						<div class="todo-widget scrollable" style="height: 450px;">
							<ul class="list-task todo-list list-group m-b-0" data-role="tasklist">
								<li class="list-group-item todo-item" data-role="task">
								
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck">
										<label class="custom-control-label todo-label" for="customCheck">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span>
											<span class="badge badge-pill badge-danger float-right">Today</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/1.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Steave">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/2.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Jessica">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label todo-label" for="customCheck1">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing</span>
											<span class="badge badge-pill badge-primary float-right">1 week </span>
										</label>
									</div>
									<div class="item-date">26 jun 2017</div>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck2">
										<label class="custom-control-label todo-label" for="customCheck2">
											<span class="todo-desc">Give Purchase report to</span>
											<span class="badge badge-pill badge-info float-right">Yesterday</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck3">
										<label class="custom-control-label todo-label" for="customCheck3">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing </span>
											<span class="badge badge-pill badge-warning float-right">2 weeks</span>
										</label>
									</div>
									<div class="item-date">26 jun 2017</div>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck4">
										<label class="custom-control-label todo-label" for="customCheck4">
											<span class="todo-desc">Give Purchase report to</span>
											<span class="badge badge-pill badge-info float-right">Yesterday</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--투두리스트 끝-->

			</div>
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (전자 결재 + 투두리스트 합친 부분) 끝 -->

		</div>
		<!-- <div class="row"> 부분 끝 div-->
	</div>
	<!--<div class="container-fluid"> 부분 끝 div-->
	
	
	

	
	
	
	
	
</div>
<script>
"use strict"; //setting-demo.js

//Setting Color

$(window).resize(function() {
	$(window).width(); 
});


$('.changeMainHeaderColor').on('click', function(){
	if($(this).attr('data-color') == 'default'){
		$('.main-header').removeAttr('data-background-color');
	} else {
		$('.main-header').attr('data-background-color', $(this).attr('data-color'));
	}

	$(this).parent().find('.changeMainHeaderColor').removeClass("selected");
	$(this).addClass("selected");
	layoutsColors();
});

$('.changeBackgroundColor').on('click', function(){
	$('body').removeAttr('data-background-color');
	$('body').attr('data-background-color', $(this).attr('data-color'));
	$(this).parent().find('.changeBackgroundColor').removeClass("selected");
	$(this).addClass("selected");
});

var toggle_customSidebar = false,
custom_open = 0;

if(!toggle_customSidebar) {
	var toggle = $('.custom-template .custom-toggle');

	toggle.on('click', (function(){
		if (custom_open == 1){
			$('.custom-template').removeClass('open');
			toggle.removeClass('toggled');
			custom_open = 0;
		}  else {
			$('.custom-template').addClass('open');
			toggle.addClass('toggled');
			custom_open = 1;
		}
	})
	);
	toggle_customSidebar = true;
}

/// ready.js 

</script>

