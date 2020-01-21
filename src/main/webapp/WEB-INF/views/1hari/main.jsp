<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- this page js -->
<%-- <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/flot/jquery.flot.pie.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/hari/assets/libs/chart/jquery.flot.pie.min.js"></script> --%>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>

<script type="text/javascript">

'use strict';

window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
};


$(function(){
	Chart.defaults.global.tooltips.custom = function(tooltip) {
		// Tooltip Element
		var tooltipEl = document.getElementById('chartjs-tooltip');

		// Hide if no tooltip
		if (tooltip.opacity === 0) {
			tooltipEl.style.opacity = 0;
			return;
		}

		// Set caret Position
		tooltipEl.classList.remove('above', 'below', 'no-transform');
		if (tooltip.yAlign) {
			tooltipEl.classList.add(tooltip.yAlign);
		} else {
			tooltipEl.classList.add('no-transform');
		}

		function getBody(bodyItem) {
			return bodyItem.lines;
		}

		// Set Text
		if (tooltip.body) {
			var titleLines = tooltip.title || [];
			var bodyLines = tooltip.body.map(getBody);

			var innerHtml = '<thead>';

			titleLines.forEach(function(title) {
				innerHtml += '<tr><th>' + title + '</th></tr>';
			});
			innerHtml += '</thead><tbody>';

			bodyLines.forEach(function(body, i) {
				var colors = tooltip.labelColors[i];
				var style = 'background:' + colors.backgroundColor;
				style += '; border-color:' + colors.borderColor;
				style += '; border-width: 2px';
				var span = '<span class="chartjs-tooltip-key" style="' + style + '"></span>';
				innerHtml += '<tr><td>' + span + body + '</td></tr>';
			});
			innerHtml += '</tbody>';

			var tableRoot = tooltipEl.querySelector('table');
			tableRoot.innerHTML = innerHtml;
		}

		var positionY = this._chart.canvas.offsetTop;
		var positionX = this._chart.canvas.offsetLeft;

		// Display, position, and set styles for font
		tooltipEl.style.opacity = 1;
		tooltipEl.style.left = positionX + tooltip.caretX + 'px';
		tooltipEl.style.top = positionY + tooltip.caretY + 'px';
		tooltipEl.style.fontFamily = tooltip._bodyFontFamily;
		tooltipEl.style.fontSize = tooltip.bodyFontSize;
		tooltipEl.style.fontStyle = tooltip._bodyFontStyle;
		tooltipEl.style.padding = tooltip.yPadding + 'px ' + tooltip.xPadding + 'px';
	};
	var data2=[30, 50, 100, 40]
	var config = {
		type: 'pie',
		data: {
			datasets: [{
				data: data2,
				backgroundColor: [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue,
				],
			}],
			labels: [
				'출근',
				'지각',
				'결근',
				'연차'
			]
		},
		options: {
			responsive: true,
			legend: {
				display: false
			},
			tooltips: {
				enabled: false,
			}
		}
	};

	window.onload = function() {
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
	};
})
</script>

	<style>
		#canvas-holder {
			width: 100%;
			margin-top: 50px;
			text-align: center;
		}
		#chartjs-tooltip {
			opacity: 1;
			position: absolute;
			background: rgba(0, 0, 0, .7);
			color: white;
			border-radius: 3px;
			-webkit-transition: all .1s ease;
			transition: all .1s ease;
			pointer-events: none;
			-webkit-transform: translate(-50%, 0);
			transform: translate(-50%, 0);
		}

		.chartjs-tooltip-key {
			display: inline-block;
			width: 10px;
			height: 10px;
			margin-right: 10px;
		}
	</style>
<style type="text/css">/* Chart.js */
@keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}</style></head>
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
						<div id="canvas-holder" style="width: 300px;">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class="">
								</div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class="">
								</div>
							</div>
						</div>
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class="">
								</div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class="">
								</div>
							</div>
						</div>
						<canvas id="chart-area" width="300" height="300" style="display: block; margin-left: 50%;" class="chartjs-render-monitor"></canvas>
						<div id="chartjs-tooltip" class="center" style="opacity: 0; left: 228.854px; top: 223.022px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-style: normal; padding: 6px; font-size: 12px;">
							<table>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>
											<span class="chartjs-tooltip-key" style="background:rgb(255, 99, 132); border-color:#fff; border-width: 2px">
											</span>
										</td>
									</tr>
								</tbody>
								</table>
							</div>
						</div>
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

