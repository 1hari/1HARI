<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/matrix.interface.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.time.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/matrix.charts.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/turning-series.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/chart/chart-page-init.js"></script>
<script type="text/javascript">

$(function(){

});
</script>
<body>
	
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
	
<!-- <div class="form-group"> -->
<!-- <label for="position-top-right">Top right</label> -->
<!-- <div class="minicolors minicolors-theme-bootstrap minicolors-position-top minicolors-position-right minicolors-focus"> -->
<!-- <input type="text" id="position-top-right" class="form-control demo minicolors-input" data-position="top right" value="#0088cc" size="7"> -->
<!-- <span class="minicolors-swatch minicolors-sprite minicolors-input-swatch"> -->
<!-- <span class="minicolors-swatch-color" style="opacity: 1;"></span> -->
<!-- </span> -->
<!-- <div class="minicolors-panel minicolors-slider-hue" style="display: block;"> -->
<!-- <div class="minicolors-slider minicolors-sprite"> -->
<!-- <div class="minicolors-picker" style="top: 0px;"> -->
<!-- </div></div><div class="minicolors-opacity-slider minicolors-sprite"> -->
<!-- <div class="minicolors-picker"> -->
<!-- </div> -->
<!-- </div> -->
<!-- <div class="minicolors-grid minicolors-sprite" style="background-color: rgb(255, 0, 0);"> -->
<!-- <div class="minicolors-grid-inner"> -->
<!-- </div> -->
<!-- <div class="minicolors-picker" style="top: 150px; left: 0px;"> -->
<!-- <div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

	<!-- 페이지내 컨텐츠 컨테이너 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>
							<div class="pie" style="height: 400px; padding: 0px; position: relative;"><canvas class="flot-base" width="596" height="400" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 596.5px; height: 400px;"></canvas><canvas class="flot-overlay" width="596" height="400" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 596.5px; height: 400px;"></canvas><div class="legend"><div style="position: absolute; width: 57px; height: 38px; top: 5px; right: 5px; background-color: rgb(255, 255, 255); opacity: 0.85;"> </div><table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(72,140,19);overflow:hidden"></div></div></td><td class="legendLabel">Series1</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(27,85,192);overflow:hidden"></div></div></td><td class="legendLabel">Series2</td></tr></tbody></table></div><div class="pieLabelBackground" style="position: absolute; width: 39.5625px; height: 36px; top: 86px; left: 364.719px; background-color: rgb(0, 0, 0); opacity: 0.5;"> </div><span class="pieLabel" id="pieLabel0" style="position: absolute; top: 86px; left: 364.719px;"><div style="font-size:8pt;text-align:center;padding:2px;color:white;">Series1<br>28%</div></span><div class="pieLabelBackground" style="position: absolute; width: 39.5625px; height: 36px; top: 278px; left: 134.719px; background-color: rgb(0, 0, 0); opacity: 0.5;"> </div><span class="pieLabel" id="pieLabel1" style="position: absolute; top: 278px; left: 134.719px;"><div style="font-size:8pt;text-align:center;padding:2px;color:white;">Series2<br>72%</div></span></div>
						</div>
					</div>
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
</body>

