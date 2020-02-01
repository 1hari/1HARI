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
			
			//console.log(getTA.TAList[0]==0);
			//당월 근태 데이터가 있는지 확인
			var count = 0;
			$.each(getTA.TAList, function(index,data){
				//console.log(data==0);
				if(data == 0){
					count++;
				}
				
			});
			//console.log(count);
			
			//당월 근태 데이터가 있으면 chart
			if(count != 5) {
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
			}else {
				$('#chartTaList').empty();
				$('#chartTaList').append('<h4 class="card-title m-b-0">당월 근태 통계</h4><h4 class="card-title m-b-0">데이터가 없습니다.</h4>');
			}
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
	if (minutes < 46) {
		hour -= 1;
	}
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
	if (hour < 10) {
		hour = "0" + hour;
	}
	
	var xValue = rs.x;
	var yValue = rs.y;
	var weatherApi = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtFcst";
	var weatherServiceKey = "?ServiceKey="
			+ "PXss7TDZfDqmwbPtPSbrN5TR36wq4zETwTgTFsmDjWxyz0vVMWAI2NyzOqsou8m4%2FjrhI0joz7sLmoKctlkUkw%3D%3D";
	var numOfRows = "&numOfRows=100&pageNo=1"
	var base_date = "&base_date=" + year + month + day
	var base_time = "&base_time=" + hour + minutes;
	var nx = "&nx=" + xValue;
	var ny = "&ny=" + yValue;
		var dataType = "&dataType=json"
	var weatherUrl = weatherApi + weatherServiceKey + base_date + base_time + numOfRows + nx + ny + dataType;
	$.ajax({
		url : "${pageContext.request.contextPath}/ajax/getWeather.hari",
		dataType : 'json',
		type : "get",
		data : { "weatherUrl" : weatherUrl },
		success : function(getWeather) {
			$('#weatherDate').text(year + "년 " + month + "월 " + day +"일")
			var weatherTitle='<td style="width: 15%; height: 20%;" rowspan="2" id="weatherImg"></td>' +
			'<td style="width: 10%;">현재날씨</td>'+
			'<td style="width: 10%;"> 기 온</td>' +
			'<td style="width: 10%;"> 습 도 </td>"';
			var weatherContent='<td id="currWeather"></td>' +
			'<td id="t1h"></td>' +
			'<td id="reh"></td>';
			var weatherAraay=[]
			weatherAraay.push(getWeather.response.body.items[0])
            for(var i=1; i<getWeather.response.body.items.length; i++){
                if((getWeather.response.body.items[i-1].category) != (getWeather.response.body.items[i].category)){
                    weatherAraay.push(getWeather.response.body.items[i])
                    if(i==getWeather.response.body.items.length-1){
                        return;
                    }
                    continue;
                }
            }
			
			//현재날씨
			if(weatherAraay[1].fcstValue == '0'){ //비 & 눈이 아니면
				if(weatherAraay[3].fcstValue == '1'){//맑음
//						weatherTitle+='<td style="width: 10%;">현재날씨</td>';
//						weatherContent+='<td id="reh">몰라</td>';
					$("#weatherTitle").append(weatherTitle);
					$("#weatherContent").append(weatherContent);
					$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_sun.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
					$('#currWeather').text('맑음')
				}else if(weatherAraay[3].fcstValue == '3'){//구름 많음
					$("#weatherTitle").append(weatherTitle);
					$("#weatherContent").append(weatherContent);
					$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_cloud.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
					$('#currWeather').text('구름 많음')
				}else if(weatherAraay[3].fcstValue == '4'){//흐림
					$("#weatherTitle").append(weatherTitle);
					$("#weatherContent").append(weatherContent);
					$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_blur.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
					$('#currWeather').text('흐림')
				}
			}else if(weatherAraay[1].fcstValue == '1'){ //비오면
				weatherTitle+='<td style="width: 10%;">강우량</td>';
				weatherContent+='<td id="reh">' + weatherAraay[2].fcstValue + 'mm'  +'</td>';
				$("#weatherTitle").append(weatherTitle);
				$("#weatherContent").append(weatherContent);
				$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_rain.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
				$('#currWeather').text('비')
				
			}else if(weatherAraay[1].fcstValue == '2'){ //눈 비 오면
				weatherTitle+='<td style="width: 10%;">강우량</td>';
				weatherContent+='<td id="reh">' + weatherAraay[2].fcstValue + 'mm</td>';
				$("#weatherTitle").append(weatherTitle);
				$("#weatherContent").append(weatherContent);
				$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_snowrain.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
				$('#currWeather').text('눈 비')
			}else if(weatherAraay[1].fcstValue == '3'){ //눈 오면
				weatherTitle+='<td style="width: 10%;">적설량</td>';
				weatherContent+='<td id="reh">' + weatherAraay[2].fcstValue + 'mm</td>';
				$("#weatherTitle").append(weatherTitle);
				$("#weatherContent").append(weatherContent);
				$("#weatherImg").append('<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_snow.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;">');
				$('#currWeather').text('눈')
			}
			$('#t1h').text(weatherAraay[4].fcstValue + '℃') 
			$('#reh').text(weatherAraay[6].fcstValue + '%') 
	
		},
	});//날씨api END!!

	// 뉴스 API
	var newsUrl = 'https://newsapi.org/v2/top-headlines?' +
				'country=kr&' +
				'apiKey=dd1bdf27c6bb4f229189f5764e1bf04e';
	//var req = new Request(url);
	//fetch(req)
	//.then(function(response) {
	//   console.log(response.json());
	//})
	let news = "";
	$.ajax({
		url : newsUrl,
		dataType : "json",
		success : function(newsArticles) {
			for (var i = 0; i < newsArticles.articles.length; i++) {
				if (i % 2 == 0) {
					news += '<tr>' 
							+ '<td style="width: 58%;"><a href="' + newsArticles.articles[i].url + '" class="link" target="_blank">' + newsArticles.articles[i].title + '</a></td>'
				} else {
					news += '<td><a href="' + newsArticles.articles[i].url + '" class="link" target="_blank">' + newsArticles.articles[i].title + '</a></td>'
						+ '</tr>';
				}
			} 
			$('#news').append(news);
		}
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

	
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h1 class="page-title"></h1>
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
				<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_PERSONNEL')">
					<!-- 부서별 근무 통계 시작  -->
					<div class="card" style ="height:350px; box-shadow :0 0 12px #999999; border-radius:10px; margin-left:10%;">
						<div class="card-body" style="padding-bottom: 0">
							<span class="card-title m-b-0" style="margin-bottom:0; font-size: 18px;" >근무시간 통계</span>
							<select class="select2 form-control custom-select select2-hidden-accessible" id="month" style="width: 20%; height:30px; margin-left: 65%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
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
				<div class="card" style ="height:470px; box-shadow :0 0 12px #999999; border-radius:10px; margin-left:10%; ">
					<div class="card-body" id="chartTaList">
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
						<canvas id="chart-area" width="100%" height="100%" style="display: block; margin-left: 50%; margin-bottom:13%;" class="chartjs-render-monitor"></canvas>
						<div id="chartjs-tooltip2" class="center" style="opacity: 0; left: 228.854px; top: 223.022px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-size: 12px;">
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
	
		</div>
		<!--col-md-6 컨텐츠 컨테이너 내에서 오른쪽 부분 (연봉통계 + 전자결재) -->
			<div class="col-md-6">
				<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_PERSONNEL')">
				<!--부서별 연봉 통계 시작-->
					<div class="card" style ="height:350px; box-shadow :0 0 12px #999999; border-radius:10px; margin-right:10%;">
						<div class="card-body" style="padding-bottom: 0">
							<span class="card-title m-b-0" style="margin-bottom:0; font-size: 18px;" >연봉 통계</span>
							<select id="chartSelect" class="select2 form-control custom-select select2-hidden-accessible" id="month" style="width: 20%; height:30px; margin-left: 70%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
							</select>
						</div>
						<div id="container" style="width: 100%; height: 100%; margin-bottom: 1%;">
							<canvas id="adminCanvas2" style="height: 0%;"></canvas>
						</div>
					</div>
				</se:authorize>
				<!--부서별 연봉 통계 끝 -->
				<!-- 전자 결재 시작 -->
				<div class="card" style ="height:250px; box-shadow :0 0 12px #999999; border-radius:10px; margin-right:10%;">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr style ="vertical-align:left;">
								<td  scope="col" style="width:120px;margin-left:15%;"><i class="far fa-clipboard fa-2x"></i>&nbsp;<h4>진행중문서</h4></td>
								<td style ="margin-left:-80%;"><span style="font-size:xx-large;">${requestScope.ongoing}</span></td>
								<td scope="col" style="width:120px;margin-left:15%;"><i class="far fa-file-alt fa-2x"></i>&nbsp;<h4>결제반려문서</h4></td>
								<td  style ="margin-left:-80%;font-size:large;"><span  style="font-size:xx-large;">${requestScope.reject}</span></td>
							</tr>
							<tr style ="vertical-align:left;">
								<td scope="col" style="width:120px;margin-left:15%;"><i class="far fa-edit fa-2x"></i>&nbsp;<h4>결제할문서</h4></td>
								<td style ="margin-left:-80%;"><span style="font-size:xx-large;">${requestScope.approve}</span></td>
								<td scope="col" style="width:120px;margin-left:15%;"><i class="far fa-file-archive fa-2x"></i>&nbsp;<h4>결제완료문서</h4></td>
								<td style ="margin-left:-80%;"><span style="font-size:xx-large;">${requestScope.complete}</span></td>
							</tr>
						</thead> 
					</table>
				</div>
				<!-- 전자 결재 끝 -->
				<!-- 전자 결재 시작 -->
				<div class="card" style ="height:200px; box-shadow :0 0 12px #999999; border-radius:10px; margin-right:10%;">
					<div class="card-body" style="padding-bottom: 0">
						<span class="card-title m-b-0">오늘의 날씨</span>
						<span class="card-title m-b-0" style="padding-left: 70%;" id="weatherDate"></span>
					</div>
					<table class="table" id="weatherTable">
						<tr style ="vertical-align:left; padding-left: 5%;" id="weatherTitle">
<%-- 							<td style="width: 33%; height: 20%;" rowspan="2"><img id="weatherImg" src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_rain.png" alt="현재날씨" class="rounded-circle" style="width: 67%; height: 20%;"></td> --%>
<!-- 							<td style="width: 20%;">현재날씨</td> -->
<!-- 							<td style="width: 20%;"> 기 온</td> -->
<!-- 							<td style="width: 20%;"> 습 도 </td> -->
						</tr>
						<tr style ="vertical-align:left; padding-left: 5%;" id="weatherContent">
<!-- 							<td id="currWeather"></td> -->
<!-- 							<td id="t1h"></td> -->
<!-- 							<td id="reh"></td> -->
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
			</div>
		<!--col-md-6 컨텐츠 컨테이너 내에서 오른쪽 부분 (연봉통계 + 전자결재) 종료 -->
		</div>
	<!-- <div class="row"> 부분 끝 div-->
			<!-- 뉴스 시작 -->
			<div class="card" style ="height:200px; width:90%; box-shadow :0 0 12px #999999; border-radius:10px; margin-left:5%; ">
				<div class="card-body scrollable ps-container ps-theme-default ps-active-y">
					<h4 class="card-title m-b-0">오늘의 뉴스</h4>
					<table id="news" style="margin-left: 4%;">
					
					</table>
					<div class="ps-scrollbar-y-rail" style="top: 0px; height: auto; right: 3px;">
						<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: auto;">
						</div>
					</div>
				</div>
			</div>
			<!-- 뉴스 끝 -->
	</div>
<!--<div class="container-fluid"> 부분 끝 div-->
</div>

</body>

