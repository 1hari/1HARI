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
var colorArray=[window.chartColors.red, window.chartColors.orange, window.chartColors.yellow, window.chartColors.green, window.chartColors.blue, window.chartColors.purple, window.chartColors.grey];
var MONTHS = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
var dataset;
var color = Chart.helpers.color;
$(function(){
	var dataset;
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/getAllEmpTA.hari",
			type: "post",
			dataType: "json",
			success: function(getAllEmpTA) {
				//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
				for(var i =0; i<getAllEmpTA.length; i++){
					getAllEmpTA[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
					getAllEmpTA[i].borderColor=colorArray[i];
					dataset=getAllEmpTA;
				}

				var horizontalBarChartData = {
					labels: MONTHS,
					datasets: dataset
				}
				var ctx = document.getElementById('adminCanvas').getContext('2d');
				window.myHorizontalBar = new Chart(ctx, {
					type: 'horizontalBar',
					data: horizontalBarChartData,
					options: {
						elements: {
							rectangle: {
							borderWidth: 2,
							}
						},
						responsive: true,
						legend: {
							position: 'right',
						},
						title: {
							display: true,
							text: '부서별 월간 근무시간 통계'
						}
					}
				})
			}
		})
		


	$('#month').change(function(){
		window.myHorizontalBar.destroy();
		
		if($('#month').val() != 0){
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getEmpTAMonth.hari",
				type: "post",
				data: 
					{
						monthStr:$('#month').val()
					},
				dataType: "json",
				success: function(getEmpTAMonth) {
					for(var i =0; i<getEmpTAMonth.length; i++){
						getEmpTAMonth[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
						getEmpTAMonth[i].borderColor=colorArray[i];
					}
				}
			}).then((getEmpTAMonth) => {
				MONTHS=[];
				MONTHS.push($('#month').val() + '월');
				var horizontalBarChartData = {
						labels: MONTHS,
						datasets: getEmpTAMonth
					};

				var ctx = document.getElementById('adminCanvas').getContext('2d');
				window.myHorizontalBar = new Chart(ctx, {
					type: 'horizontalBar',
					data: horizontalBarChartData,
					options: {
						// Elements options apply to all of the options unless overridden in a dataset
						// In this case, we are setting the border of each horizontal bar to be 2px wide
						elements: {
							rectangle: {
								borderWidth: 2,
							}
						},
						responsive: true,
						legend: {
							position: 'right',
						},
						title: {
							display: true,
							text: '부서별 월간 근무시간 통계'
						},
						tooltips:{
							enabled: true,
						}
					}

				})
			})
		}else{
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getAllEmpTA.hari",
				type: "post",
				dataType: "json",
				success: function(getAllEmpTA) {
					//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
					for(var i =0; i<getAllEmpTA.length; i++){
						getAllEmpTA[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
						getAllEmpTA[i].borderColor=colorArray[i];
					}
					MONTHS=['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
					var horizontalBarChartData = {
						labels: MONTHS,
						datasets: getAllEmpTA
					};
					var ctx = document.getElementById('adminCanvas').getContext('2d');
					window.myHorizontalBar = new Chart(ctx, {
						type: 'horizontalBar',
						data: horizontalBarChartData,
						options: {
							// Elements options apply to all of the options unless overridden in a dataset
							// In this case, we are setting the border of each horizontal bar to be 2px wide
							elements: {
								rectangle: {
									borderWidth: 2,
								}
							},
							responsive: true,
							legend: {
								position: 'right',
							},
							title: {
								display: true,
								text: '월간 근무시간'
							},
							tooltips:{
								enabled: true,
							}
						}
					})
				}
			})
		}

		})
	})


	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTA.hari",
		type: "post",
		dataType: "json",
		success: function(getTA) {
			var config = {
				type: 'pie',
				data: {
					datasets: [{
						data: getTA.TAList,
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
						'연차',
						'조퇴'
					]
				},
				options: {
					responsive: true,
					legend: {
						display: true,
						position: 'bottom'
					},
					tooltips: {
						enabled: true,
						mode: 'index'
					}
				}
			}
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		}
	});
	
	
	//부서별 연봉 통계 년도 옵션
	var dataset2;
	var salYearList=[]
	$.ajax({
	url: "${pageContext.request.contextPath}/ajax/getSalYear.hari",
	type: "post",
	dataType: "json",
	success: function(getSalYear) {
		salYearList=getSalYear
		console.log(getSalYear)
		let years = "";
		$.each(getSalYear, function(index, element) {
			if (index==0) {
				years += '<option value="' + element + '" selected>' + element + '</option>';
			} else {
				years += '<option value="' + element + '">' + element + '</option>';
			}
		})
		$("#chartSelect").append(years);
		}
	}).then((getSalYear) =>{

		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/getTeamSalList.hari",
			type: "post",
			data:{
						"year":getSalYear[0]
			},
			dataType: "json",
			success: function(getTeamSalList) {

				var labels=[];
				console.log(getTeamSalList)
				//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
				for(var i =0; i<getTeamSalList.length; i++){
					getTeamSalList[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
					getTeamSalList[i].borderColor=colorArray[i];
					dataset2=getTeamSalList;
					labels.push(getTeamSalList[i].label)
				}
				
				var barChartData = {
					labels: [getSalYear[0]+'년'],
					datasets: dataset2
				}
				var ctx2 = document.getElementById('adminCanvas2').getContext('2d');
				window.myBar = new Chart(ctx2, {
					type: 'bar',
					data: barChartData,
					options: {
						elements: {
							rectangle: {
							borderWidth: 2,
							}
						},
						responsive: true,
						legend: {
							position: 'right',
						},
						title: {
							display: true,
							text: '부서별 연봉 통계'
						}
					}
				})
			}
		})
	}).then((getSalYear) =>{
		$("#chartSelect").change(function(){
			window.myBar.destroy();
			console.log($('#chartSelect').val())
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getTeamSalList.hari",
				type: "post",
				data:{
						"year": $('#chartSelect').val()
						},
				dataType: "json",
				success: function(getTeamSalList) {
					console.log(getTeamSalList)
					//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
					for(var i =0; i<getTeamSalList.length; i++){
						getTeamSalList[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
						getTeamSalList[i].borderColor=colorArray[i];
						dataset2=getTeamSalList;
					}
					
					var barChartData = {
						labels: [$('#chartSelect').val()+'년'],
						datasets: dataset2
					}
					var ctx2 = document.getElementById('adminCanvas2').getContext('2d');
					window.myBar = new Chart(ctx2, {
						type: 'bar',
						data: barChartData,
						options: {
							elements: {
								rectangle: {
								borderWidth: 2,
								}
							},
							responsive: true,
							legend: {
								position: 'right',
							},
							title: {
								display: true,
								text: '부서별 연봉 통계'
							}
						}
					})
				}
			})
		})
	})

</script>



	<style>
		#canvas-holder {
			width: 100%;
			margin-top: 50px;
			text-align: center;
		}
		#chartjs-tooltip2 {
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
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	
	
	    h1.page-title {
	    	   text-shadow:
			    0 1px 0 #ffffff,
			    0 1.5px 0 #d3d5d6,
			    0 2px 0 #7c98a1,
			    0 2.5px 0 #4e727e,
			    2px 3px 4px rgba(0,0,0,0.1),
			    2px 3px 4px rgba(0,0,0,0.3);
			    color: white;}
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

	<div class = "a" style ="width: 100%; height: 250px; background-color: #d9d9d9; opacity:0.8;"><!-- 대시보드 안에 그림넣기div background-image:url(resources/hari/assets/images/divbg_10.png); !!!!!!!!!!!!!!!!1 -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h1 class="page-title"></h1>
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
</div><!-- 대시보드 안에 그림 넣기 디브  -->
	<!-- 페이지내 컨텐츠 컨테이너 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-md-6">
			<!-- 근무 통계 시작  -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-top:-35%; margin-left:10%;">
					<div class="card-body" style="padding-bottom: 0">
						<span class="card-title m-b-0" style="margin-bottom:0; font-size: 18px;" >근무시간 통계</span>
							<select class="select2 form-control custom-select select2-hidden-accessible" id="month" style="width: 13%; height:10%; margin-left: 65%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
								<option value="0">전체</option>
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					<div id="container" style="width: 100%; height: 100%; margin-bottom: 7%;">
						<canvas id="adminCanvas" style="height: 10%;"></canvas>
					</div>
				</div>
				<!--근태 통계 -->
				<div class="card" style ="box-shadow :10px 10px  #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-left:10%; ">
					<div class="card-body">
						<h4 class="card-title m-b-0">당월 근태통계</h4>
						<div id="canvas-holder" style="width: 66%; margin-left: -16%;">
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
						<div id="chartjs-tooltip2" class="center" style="opacity: 0; left: 228.854px; top: 223.022px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-style: normal; padding: 6px; font-size: 12px;">
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
				<div class="card" style ="box-shadow :10px 10px  #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-left:10%; ">
					<div class="card-body">
						<h4 class="card-title m-b-0">당월 근태통계</h4>
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
						<div id="chartjs-tooltip2" class="center" style="opacity: 0; left: 228.854px; top: 223.022px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-style: normal; padding: 6px; font-size: 12px;">
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
				<!--타임 라인 끝-->
			</div>
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (공지사항 + 타임라인 합친 부분) 끝 -->

			<!--오른쪽 div 컨테이너 부분 시작 (연봉통계 + 전자결재 + 투두리스트)-->
			<div class="col-md-6">
				<!--연봉 통계 시작-->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-top:-35%; margin-right:10%;">
					<div class="card-body" style="padding-bottom: 0">
						<span class="card-title m-b-0" style="margin-bottom:0; font-size: 18px;" >연봉 통계</span>
							<select id="chartSelect" class="select2 form-control custom-select select2-hidden-accessible" id="month" style="width: 13%; height:10%; margin-left: 67%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
							</select>
						</div>
					<div id="container" style="width: 100%; height: 100%; margin-bottom: 1%;">
						<canvas id="adminCanvas2" style="height: 0%;"></canvas>
					</div>
				</div>
				<!--연봉 통계 끝 -->
				<!-- 전자 결재 시작 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-right:10%;">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr style ="vertical-align:left;">
								<td><i class="far fa-clipboard fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">진행중문서</h4>
                                    <td style ="margin-left:-80%;">${requestScope.ongoing}</td>
								</td> 
                                <td scope="col"><i class="far fa-file-alt fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제반려문서</h4>
                                    <td  style ="margin-left:-80%;">${requestScope.reject}</td>
								</td>
							</tr>
							<tr style ="vertical-align:left;">
                                <td scope="col"><i class="far fa-edit fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제할문서</h4>
                                    <td style ="margin-left:-80%;">${requestScope.approve}</td>
								</td>
								<td scope="col"><i class="far fa-file-archive fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제완료문서</h4>
                                    <td style ="margin-left:-80%;">${requestScope.complete}</td>
								</td>
							</tr>
						</thead> 
					</table>
				</div>
				<!-- 전자 결재 끝 -->
				<!-- to do list -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-right:10%;">
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
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (연봉 통계 + 전자 결재 + 투두리스트 합친 부분) 끝 -->
			<div class="col-md-6">
			
			</div>
			<div class="col-md-6">
			
			</div>
		<!-- <div class="row"> 부분 끝 div-->
	</div>
	<!--<div class="container-fluid"> 부분 끝 div-->

</div>
</body>

