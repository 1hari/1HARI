<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
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
var dataset2;
var color = Chart.helpers.color;
/*공통정보*/
var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
var AppTest = "&MobileOS=ETC&MobileApp=AppTest";
var contentTypeId = "&contentTypeId=12";
var pramContentId = "&contentId=";
//	var contentid = "${requestScope.contentId}";
/*Json*/
var numOfRows = "&numOfRows=10";
var numOfRows2 = "&numOfRows=1";
var numOfRows4 = "&numOfRows=4";
var pageNo = "&pageNo=1";
var areaCode = "&areaCode=";
var Sigungu = "&sigunguCode=";
var type = "&_type=json";
var type2 = "&_type=json&";
/*서비스*/
var pramDetailImage = "detailImage?";
var pramDetailCommon = "detailCommon?";
var pramDetailIntro = "detailIntro?";
var pramLocationBasedList = "locationBasedList?";
var pramDetailInfo = "detailInfo?";
/*기타*/
var etc2 = "&imageYN=Y&subImageYN=Y";
var pramSubImage = "&cat1=&cat2=&cat3=&listYN=Y";
var pramImage = "&imageYN=Y";
var pramSubImage = "&subImageYN=Y";
var pramOverView = "&overviewYN=Y";
var pramMapInfo = "&mapinfoYN=Y";
var pramAddrInfo = "&addrinfoYN=Y";
var pramCatCode = "&catcodeYN=Y";
var pramDefault = "&defaultYN=Y";
var pramFirstImage = "&firstImageYN=Y";
var pramAreaCode = "&areacodeYN=Y";
var pramArrrange = "&arrange=";
var pramMapX = "&mapX=";
var pramMapY = "&mapY=";
var pramRadius = "&radius=3000";
var pramListYN = "&listYN=Y";
var pramrange = "&radius=3000";
var loArray = "&arrange=E";
/*변수*/
var api = "";
var api2 = "";
var api3 = "";
var api4 = "";
var api5 = "";
var api6 = "";
var x = "";
var y = "";
var apilocation = "";
var apiCommon = "";
// var api = addr + pramDetailImage + servicekey + numOfRows + pageNo /*이미지조회*/
// 		+ AppTest + pramContentId + contentid + type2 + etc2;

// var api2 = addr + pramDetailCommon + servicekey + numOfRows + pageNo /*공통조회*/
// 		+ AppTest + pramContentId + contentid + contentTypeId
// 		+ pramDefault + pramFirstImage + pramAreaCode + pramCatCode
// 		+ pramAddrInfo + pramMapInfo + pramOverView + type;
$(function(){
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
	
	//당월 근태통계 차트
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
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getTeamSalList.hari",
				type: "post",
				data:{
						"year": $('#chartSelect').val()
						},
				dataType: "json",
				success: function(getTeamSalList) {
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

	//날씨 API
		var rs = dfs_xy_conv("toXY", 37.525913599999996, 126.83591679999999);
		console.log(rs)
// 		var fixLatitude=parseFloat(37.525913599999996);
// 		var fixLongitude=parseFloat(126.83591679999999);
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		if(month<10){
			month = "0" + month;
		}
		var day = date.getDate();
		if(day<10){
			day = "0" + day; 
		}
		var hour = date.getHours();
		var minutes = date.getMinutes();
		if (minutes < 41) {
			hour -= 1;
		}
		if (hour < 10) {
			hour = "0" + hour;
		}
		//http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=PXss7TDZfDqmwbPtPSbrN5TR36wq4zETwTgTFsmDjWxyz0vVMWAI2NyzOqsou8m4%2FjrhI0joz7sLmoKctlkUkw%3D%3D&numOfRows=10&pageNo=1&base_date=20200130&base_time=0230&nx=55&ny=127
		console.log(year + month + day + hour + minutes)
		var xValue = rs.x;
		var yValue = rs.y;
		var weatherApi = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
		var weatherServiceKey = "?ServiceKey="
				+ "PXss7TDZfDqmwbPtPSbrN5TR36wq4zETwTgTFsmDjWxyz0vVMWAI2NyzOqsou8m4%2FjrhI0joz7sLmoKctlkUkw%3D%3D";
		//&numOfRows=10&pageNo=1&base_date=20200130&base_time=0230&nx=55&ny=127
		var numOfRows = "&numOfRows=9&pageNo=1"
		var base_date = "&base_date=" + year + month + day
		var base_time = "&base_time=" + hour + "00";
		var nx = "&nx=" + xValue;
		var ny = "&ny=" + yValue;
 		var dataType = "&dataType=json";
		var weatherUrl = weatherApi + weatherServiceKey + base_date + base_time + numOfRows + nx + ny + dataType;
		console.log(weatherUrl)
// 		var jsonWeatherUrl = { "weatherUrl" : weatherUrl };
		$.ajax({
			url : "${pageContext.request.contextPath}/ajax/getWeather.hari",
			dataType : 'json',
			type : "get",
			data : { "weatherUrl" : weatherUrl },
			success : function(getWeather) {
					console.log(getWeather.response.body.items)
// 					var icon = $('<i>');
// 					var totalRain = $('<span>');
// 					var degree = $('<span>');
// 						$.each(weatherData.response.body.items.item,function(index,element) {
// 									if (element.category == "PTY") {
// 										if (element.obsrValue == 0) {
// 											$(icon).attr("class","wi wi-day-sunny");
// 												}else{
// 													$(icon).attr("class","wi wi-rain");
// 												}
// 											}else if (element.category == "RN1") {
// 												$(totalRain).html("&nbsp;&nbsp;&nbsp;&nbsp;시간당 강수량 : "+ element.obsrValue+ "ml");
// 											}else if (element.category == "T1H") {
// 												$(degree).html("&nbsp;&nbsp;&nbsp;&nbsp;현재기온 : "+ element.obsrValue+ "℃ ");
// 											}
// 										});
// 						$("#title").after(totalRain);
// 						$("#title").after(degree);
// 						$("#title").after(icon);
			},
		});//날씨api END!!
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
				<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_PERSONNEL')">
					<!-- 부서별 근무 통계 시작  -->
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
				<!-- 부서별 근무 통계 종료 -->
				</se:authorize>
				<!--당월 근태 통계 -->
				<div class="card" style ="box-shadow :10px 10px  #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-left:10%; ">
					<div class="card-body">
						<h4 class="card-title m-b-0">당월 근태 통계</h4>
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
										<td><span class="chartjs-tooltip-key" style="background:rgb(255, 99, 132); border-color:#fff; border-width: 2px"></span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--당월 근태 통계 종료-->
			<!-- 무언가.. 시작 -->
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
									<td><span class="chartjs-tooltip-key" style="background:rgb(255, 99, 132); border-color:#fff; border-width: 2px"></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	<!-- 무언가.. 종료 -->
	</div>
	<!--col-md-6 컨텐츠 컨테이너 내에서 오른쪽 부분 (연봉통계 + 전자결재) -->
			<div class="col-md-6">
				<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_PERSONNEL')">
				<!--부서별 연봉 통계 시작-->
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
				</se:authorize>
				<!--부서별 연봉 통계 끝 -->
				<!-- 전자 결재 시작 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-right:10%;">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr style ="vertical-align:left;">
								<td><i class="far fa-clipboard fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">진행중문서</h4></td> 
								<td style ="margin-left:-80%;">${requestScope.ongoing}</td>
								<td scope="col"><i class="far fa-file-alt fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제반려문서</h4></td>
								<td  style ="margin-left:-80%;">${requestScope.reject}</td>
							</tr>
							<tr style ="vertical-align:left;">
								<td scope="col"><i class="far fa-edit fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제할문서</h4></td>
								<td style ="margin-left:-80%;">${requestScope.approve}</td>
								<td scope="col"><i class="far fa-file-archive fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제완료문서</h4></td>
								<td style ="margin-left:-80%;">${requestScope.complete}</td>
							</tr>
						</thead> 
					</table>
				</div>
				<!-- 전자 결재 끝 -->
				<!-- 전자 결재 시작 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px groove #bcbcbc; margin-right:10%;">
					<div class="card-body" style="padding-bottom: 0">
						<h5 class="card-title m-b-0">오늘의 날씨</h5>
					</div>
					<table class="table" id="weatherTable">
						<tr style ="vertical-align:left; padding-left: 5%;" >
							<td  style="width: 33%; height: 20%;" rowspan="2"><img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_rain.png" alt="user" class="rounded-circle" style="width: 67%; height: 20%;"></td>
							<td>dddd</td>
							<td>dddd</td>
							<td>dddd</td>
						</tr>
						<tr style ="vertical-align:left; padding-left: 5%;">
							<td>ddd</td>
							<td>ddd</td>
							<td>ddd</td>
						</tr>
<!-- 							<tr style ="vertical-align:left;"> -->
<!-- 								<td scope="col"><i class="far fa-edit fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제할문서</h4></td> -->
<%-- 								<td style ="margin-left:-80%;">${requestScope.approve}</td> --%>
<!-- 								<td scope="col"><i class="far fa-file-archive fa-2x" style ="margin-left:-50%;"></i>&nbsp;<h4 style ="margin-left:-50%;">결제완료문서</h4></td> -->
<%-- 								<td style ="margin-left:-80%;">${requestScope.complete}</td> --%>
<!-- 							</tr> -->
					</table>
				</div>
				<!-- 전자 결재 끝 -->
					<div>
	 	<!-- rain비  우산-->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_rain.png" alt="user" class="rounded-circle" width="100%">
		<!-- snow 눈 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_snow.png" alt="user" class="rounded-circle" width="100%">							
		<!-- sun 해 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_sun.png" alt="user" class="rounded-circle" width="100%">	
		<!-- storm 구름 흐림 -->
		<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_cloud.png" alt="user" class="rounded-circle" width="100%">	
		
	</div>
			</div>
		<!--col-md-6 컨텐츠 컨테이너 내에서 오른쪽 부분 (연봉통계 + 전자결재) 종료 -->
		</div>
	<!-- <div class="row"> 부분 끝 div-->
	</div>
<!--<div class="container-fluid"> 부분 끝 div-->
</div>

</body>

