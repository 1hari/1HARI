<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
	
	
<!-- 	
<!-- 컬러 코드  
Custom template | don't include it in your project!
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
					<i class="flaticon-settings"></i>
				</div>
			</div>
		End Custom template
	</div>
	<!--   Core JS Files   
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	jQuery UI
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	Bootstrap Toggle
	<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
	jQuery Scrollbar
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Azzara JS 
	<script src="assets/js/ready.min.js"></script>
	Azzara DEMO methods, don't include it in your project!
	<script src="assets/js/setting-demo.js"></script>
	컬러 코드 끝
	 -->
	
	
	
	<!-- 페이지내 컨텐츠 컨테이너 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-md-6">

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