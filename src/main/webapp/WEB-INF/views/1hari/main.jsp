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
	function promise_function(){
		  return new Promise(function(resolve, reject){ 
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getAllEmpTA.hari",
					type: "post",
					dataType: "json",
					success: function(getAllEmpTA) {
//			 			console.log(getAllEmpTA);
						//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
						for(var i =0; i<getAllEmpTA.length; i++){
							getAllEmpTA[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
							getAllEmpTA[i].borderColor=colorArray[i];
							dataset=getAllEmpTA;

						}
						console.log(dataset);
						resolve(true);
					}
				})		
		  });
		}
	
	function successFunction(){
		return false;
	}
	function errorFunction(){
		  return false;
	}	
				


			function chart(){
				var horizontalBarChartData = {
					labels: MONTHS,
					datasets: dataset
				}
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
							text: 'Chart.js Horizontal Bar Chart'
						}
					}
				})
			}
	
				
	promise_function()
	.then(chart())
	.then(successFunction)
/* 	.catch(errorFunction);
 */

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
					console.log(getEmpTAMonth);
					
					MONTHS=[];
					MONTHS.push($('#month').val() + '월');


// 				setTimeout(function(){
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
								text: '월간 근무시간'
							},
							tooltips:{
								enabled: true,
							}
						}

					})
// 				},1000);
				}
			})
		} 
		else{
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




			
// 			var ctx = document.getElementById('adminCanvas').getContext('2d');
// 			window.myHorizontalBar = new Chart(ctx, {
// 				type: 'horizontalBar',
// 				data: horizontalBarChartData,
// 				options: {
// 					// Elements options apply to all of the options unless overridden in a dataset
// 					// In this case, we are setting the border of each horizontal bar to be 2px wide
// 					elements: {
// 						rectangle: {
// 							borderWidth: 2,
// 						}
// 					},
// 					responsive: true,
// 					legend: {
// 						position: 'right',
// 					},
// 					title: {
// 						display: true,
// 						text: 'Chart.js Horizontal Bar Chart'
// 					}
// 				}
// 			})









































	

	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTA.hari",
		type: "post",
		dataType: "json",
		success: function(getTA) {
// 			Chart.defaults.global.tooltips.custom = function(tooltip) {
// 				// Tooltip Element
// 				var tooltipEl2 = document.getElementById('chartjs-tooltip2');
// 				// Hide if no tooltip
// 				if (tooltip.opacity === 0) {
// 					tooltipEl2.style.opacity = 0;
// 					return;
// 				}

// 				// Set caret Position
// 				tooltipEl2.classList.remove('above', 'below', 'no-transform');
// 				if (tooltip.yAlign) {
// 					tooltipEl2.classList.add(tooltip.yAlign);
// 				} else {
// 					tooltipEl2.classList.add('no-transform');
// 				}

// 				function getBody(bodyItem) {
// 					return bodyItem.lines;
// 				}

// 				// Set Text
// 				if (tooltip.body) {
// 					var titleLines = tooltip.title || [];
// 					var bodyLines = tooltip.body.map(getBody);
// 					var innerHtml = '<thead>';

// 					titleLines.forEach(function(title) {
// 						innerHtml += '<tr><th>' + title + '</th></tr>';
// 					});
// 					innerHtml += '</thead><tbody>';

// 					bodyLines.forEach(function(body, i) {
// 						var colors = tooltip.labelColors[i];
// 						var style = 'background:' + colors.backgroundColor;
// 						style += '; border-color:' + colors.borderColor;
// 						style += '; border-width: 2px';
// 						var span = '<span class="chartjs-tooltip-key" style="' + style + '"></span>';
// 						innerHtml += '<tr><td>' + span + body + '</td></tr>';
// 					});
// 					innerHtml += '</tbody>';

// 					var tableRoot = tooltipEl2.querySelector('table');
// 					tableRoot.innerHTML = innerHtml;
// 				}

// 				var positionY = this._chart.canvas.offsetTop;
// 				var positionX = this._chart.canvas.offsetLeft;

// 				// Display, position, and set styles for font
// 				tooltipEl2.style.opacity = 1;
// 				tooltipEl2.style.left = positionX + tooltip.caretX + 'px';
// 				tooltipEl2.style.top = positionY + tooltip.caretY + 'px';
// 				tooltipEl2.style.fontFamily = tooltip._bodyFontFamily;
// 				tooltipEl2.style.fontSize = tooltip.bodyFontSize;
// 				tooltipEl2.style.fontStyle = tooltip._bodyFontStyle;
// 				tooltipEl2.style.padding = tooltip.yPadding + 'px ' + tooltip.xPadding + 'px';
// 			};
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



// 	var horizontalBarChartData;
// 	//관리자 차트 부서별 근무시간***********************
// 	$.ajax({
// 		url: "${pageContext.request.contextPath}/ajax/getAllEmpTA.hari",
// 		type: "post",
// 		dataType: "json",
// 		success: function(getAllEmpTA) {
// 			console.log(getAllEmpTA);
// 			//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
// 			for(var i =0; i<getAllEmpTA.length; i++){
// 				getAllEmpTA[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
// 				getAllEmpTA[i].borderColor=colorArray[i];
// 			}

			
// 			horizontalBarChartData = {
// 				labels: MONTHS,
// 				datasets:  [{
// 					label: 'Dataset 1',
// 					backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
// 					borderColor: window.chartColors.red,
// 					borderWidth: 1,
// 					data: [
// 						11,12
// 					]
// 				}, {
// 					label: 'Dataset 2',
// 					backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
// 					borderColor: window.chartColors.blue,
// 					data: [
// 						15,16
// 					]
// 				}]
// 			};
			
			
// 			var ctx = document.getElementById('adminCanvas').getContext('2d');
// 			window.myHorizontalBar = new Chart(ctx, {
// 				type: 'horizontalBar',
// 				data: horizontalBarChartData,
// 				options: {
// 					// Elements options apply to all of the options unless overridden in a dataset
// 					// In this case, we are setting the border of each horizontal bar to be 2px wide
// 					elements: {
// 						rectangle: {
// 							borderWidth: 2,
// 						}
// 					},
// 					responsive: true,
// 					legend: {
// 						position: 'right',
// 					},
// 					title: {
// 						display: true,
// 						text: 'Chart.js Horizontal Bar Chart'
// 					}
// 				}
// 			});
// 		}
// 	});
	
	

// 	$('#month').change(function(){
// 		window.myHorizontalBar.destroy();
// 		if($('#month').val() != 0){
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/ajax/getEmpTAMonth.hari",
// 			type: "post",
// 			data: 
// 				{
// 					monthStr:$('#month').val()
// 				},
// 			dataType: "json",
// 			success: function(getEmpTAMonth) {
// 				for(var i =0; i<getEmpTAMonth.length; i++){
// 					getEmpTAMonth[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
// 					getEmpTAMonth[i].borderColor=colorArray[i];
// 				}
// 				console.log(getEmpTAMonth);
// 				MONTHS=[];
// 				MONTHS.push($('#month').val() + '월');
// 				var horizontalBarChartData = {
// 					labels: MONTHS,
// 					datasets: getEmpTAMonth
// 				};
// 				var ctx = document.getElementById('adminCanvas').getContext('2d');
// 				window.myHorizontalBar = new Chart(ctx, {
// 					type: 'horizontalBar',
// 					data: horizontalBarChartData,
// 					options: {
// 						// Elements options apply to all of the options unless overridden in a dataset
// 						// In this case, we are setting the border of each horizontal bar to be 2px wide
// 						elements: {
// 							rectangle: {
// 								borderWidth: 2,
// 							}
// 						},
// 						responsive: true,
// 						legend: {
// 							position: 'right',
// 						},
// 						title: {
// 							display: true,
// 							text: '월간 근무시간'
// 						},
// 						tooltips:{
// 							enabled: true,
// 						}
// 					}
// 				});
// 			}
// 		})
// 	} else{
// 			$.ajax({
// 				url: "${pageContext.request.contextPath}/ajax/getAllEmpTA.hari",
// 				type: "post",
// 				dataType: "json",
// 				success: function(getAllEmpTA) {
// 					//java에서 못넣은 색 추가.. 제일 윗쪽에 chart.js에서 준 컬러값 배열 만들어놨음
// 					for(var i =0; i<getAllEmpTA.length; i++){
// 						getAllEmpTA[i].backgroundColor=color(colorArray[i]).alpha(0.5).rgbString();
// 						getAllEmpTA[i].borderColor=colorArray[i];
// 					}
// 					MONTHS=['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
// 					var horizontalBarChartData = {
// 						labels: MONTHS,
// 						datasets: getAllEmpTA
// 					};
// 					var ctx = document.getElementById('adminCanvas').getContext('2d');
// 					window.myHorizontalBar = new Chart(ctx, {
// 						type: 'horizontalBar',
// 						data: horizontalBarChartData,
// 						options: {
// 							// Elements options apply to all of the options unless overridden in a dataset
// 							// In this case, we are setting the border of each horizontal bar to be 2px wide
// 							elements: {
// 								rectangle: {
// 									borderWidth: 2,
// 								}
// 							},
// 							responsive: true,
// 							legend: {
// 								position: 'right',
// 							},
// 							title: {
// 								display: true,
// 								text: '월간 근무시간'
// 							},
// 							tooltips:{
// 								enabled: true,
// 							}
// 						}
// 					});
// 				}
// 			});
// 		}
// 	})
// });


// var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
// var color = Chart.helpers.color;
// var horizontalBarChartData = {
// 	labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
// 	datasets: [{
// 		label: 'Dataset 1',
// 		backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
// 		borderColor: window.chartColors.red,
// 		borderWidth: 1,
// 		data: [
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor()
// 		]
// 	}, {
// 		label: 'Dataset 2',
// 		backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
// 		borderColor: window.chartColors.blue,
// 		data: [
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor(),
// 			randomScalingFactor()
// 		]
// 	}]

// };

// window.onload = function() {
// 	var ctx = document.getElementById('canvas').getContext('2d');
// 	window.myHorizontalBar = new Chart(ctx, {
// 		type: 'horizontalBar',
// 		data: horizontalBarChartData,
// 		options: {
// 			// Elements options apply to all of the options unless overridden in a dataset
// 			// In this case, we are setting the border of each horizontal bar to be 2px wide
// 			elements: {
// 				rectangle: {
// 					borderWidth: 2,
// 				}
// 			},
// 			responsive: true,
// 			legend: {
// 				position: 'right',
// 			},
// 			title: {
// 				display: true,
// 				text: 'Chart.js Horizontal Bar Chart'
// 			}
// 		}
// 	});

// };

// document.getElementById('randomizeData').addEventListener('click', function() {
// 	var zero = Math.random() < 0.2 ? true : false;
// 	horizontalBarChartData.datasets.forEach(function(dataset) {
// 		dataset.data = dataset.data.map(function() {
// 			return zero ? 0.0 : randomScalingFactor();
// 		});

// 	});
// 	window.myHorizontalBar.update();
// });

// var colorNames = Object.keys(window.chartColors);

// document.getElementById('addDataset').addEventListener('click', function() {
// 	var colorName = colorNames[horizontalBarChartData.datasets.length % colorNames.length];
// 	var dsColor = window.chartColors[colorName];
// 	var newDataset = {
// 		label: 'Dataset ' + (horizontalBarChartData.datasets.length + 1),
// 		backgroundColor: color(dsColor).alpha(0.5).rgbString(),
// 		borderColor: dsColor,
// 		data: []
// 	};

// 	for (var index = 0; index < horizontalBarChartData.labels.length; ++index) {
// 		newDataset.data.push(randomScalingFactor());
// 	}

// 	horizontalBarChartData.datasets.push(newDataset);
// 	window.myHorizontalBar.update();
// });

// document.getElementById('addData').addEventListener('click', function() {
// 	if (horizontalBarChartData.datasets.length > 0) {
// 		var month = MONTHS[horizontalBarChartData.labels.length % MONTHS.length];
// 		horizontalBarChartData.labels.push(month);

// 		for (var index = 0; index < horizontalBarChartData.datasets.length; ++index) {
// 			horizontalBarChartData.datasets[index].data.push(randomScalingFactor());
// 		}

// 		window.myHorizontalBar.update();
// 	}
// });

// document.getElementById('removeDataset').addEventListener('click', function() {
// 	horizontalBarChartData.datasets.pop();
// 	window.myHorizontalBar.update();
// });

// document.getElementById('removeData').addEventListener('click', function() {
// 	horizontalBarChartData.labels.splice(-1, 1); // remove the label first

// 	horizontalBarChartData.datasets.forEach(function(dataset) {
// 		dataset.data.pop();
// 	});

// 	window.myHorizontalBar.update();
// });

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

	<div class = "a" style ="width: 100%; height: 250px; background-image:url(resources/hari/assets/images/divbg_06.png); opacity:0.8;"><!-- 대시보드 안에 그림넣기div !!!!!!!!!!!!!!!!1 -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h1 class="page-title">대시보드</h1>
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
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px dashed #bcbcbc; margin-top:-20%; margin-left:10%;">
					<div class="card-body" style="padding-bottom: 0">
						<h4 class="card-title m-b-0" style="margin-bottom:0;" >근무시간 통계</h4>
							<select class="select2 form-control custom-select select2-hidden-accessible" id="month" style="width: 13%; height:10%; margin-left: 88%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
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
					<div id="container" style="width: 100%; height: 100%; margin-bottom: 40px;">

						<canvas id="adminCanvas"></canvas>
					</div>
				</div>
				<!--time line 시작 -->
				<div class="card" style ="box-shadow :10px 10px  #999999; border-radius:10px; border : 4px dashed #bcbcbc; margin-left:10%; ">
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

			<!--오른쪽 div 컨테이너 부분 시작 (전자결재 + 투두리스트)-->
			<div class="col-md-6">

				<!--전자 결재 시작-->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px;border : 4px dashed #bcbcbc;  margin-top:-20%; margin-right:10%;">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><i class="far fa-clipboard fa-2x"></i>&nbsp;<h4>진행중문서</h4>
									<td style ="marign-left:-5%;">0</td>
								</th>
								<th scope="col"><i class="far fa-file-alt fa-2x"></i>&nbsp;<h4>보류중문서</h4>
									<td>2</td>
								</th>
							</tr>
							
							<tr>
								<th scope="col"><i class="far fa-edit fa-2x"></i>&nbsp;<h4>결제중문서</h4>
									<td>0</td>
								</th>
								<th scope="col"><i class="far fa-file-archive fa-2x"></i>&nbsp;<h4>결제완료문서</h4>
									<td>2</td>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<!--전자 결재 끝 -->


				<!-- todo list 시작 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px dashed #bcbcbc; margin-right:10%;">
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

