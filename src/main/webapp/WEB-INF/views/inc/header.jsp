<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">

$(function(){
	var isStart=false; //오늘 출근했는지
	var isEnd=false;//오늘 퇴근했는지
	var currYear;
	var currMonth;
	var fixLatitude=parseFloat(37.4995124);
	var fixLongitude=parseFloat(127.0292657);
	var myLatitude; //사용자 위도
	var myLongitude;////사용자 경도
	currYear=new Date().getFullYear();
	currMonth=new Date().getMonth()+1;
	console.log(currYear);
	console.log(currMonth);
	//총 근무일
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTotalTA.hari",
		type: "post",
		dataType: "json",
		success: function(totalTA) {
			console.log(totalTA);
			$('#totalTA').append(totalTA);
		}
	});
	
	//오늘 퇴근기록 체크
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/todayEndWorkCheck.hari",
		type: "post",
		dataType: "json",
		success: function(data) {
			//퇴근근기록이 있으면 true, 없으면 false
			isEnd=data;

			if(isEnd==false){
				//false 면 현재시간 - 출근시간
				console.log('getWorkTime ' + ': ' + isEnd);
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getWorkTime.hari",
					type: "post",
					dataType: "text",
					success: function(getWorkTime) {
						if(getWorkTime.trim() != "empty" ){
							console.log('getWorkTime!=null');
							$('#getWorkTime').text('');
							$('#getWorkTime').append(getWorkTime);
						} else{
							console.log('getWorkTime==null');
							$('#getWorkTime').text('');
							$('#getWorkTime').append('00:00');
						}
					}
				});
			} else{
				//true면 퇴근시간 - 출근시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTodayTotalTime.hari",
					type: "post",
					dataType: "text",
					success: function(getTodayTotalTime) {
						$('#getWorkTime').text('');
						$('#getWorkTime').append(getTodayTotalTime);
					}
				});
			}
		}
	})
	//오늘 출근기록 체크
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/todayStartWorkCheck.hari",
		type: "post",
		dataType: "json",
		success: function(data) {
			//퇴근근기록이 있으면 true, 없으면 false
			isStart=data;
			if(isStart == false && isEnd==false){
				$('#startWork').removeAttr('disabled');	
				$('#endWork').attr('disabled', 'disabled');	
			}else if(isStart == true && isEnd==false){
				$('#startWork').attr('disabled', 'disabled');
				$('#endWork').removeAttr('disabled');	
			} else if(isStart == true && isEnd==true) {
				$('#endWork').attr('disabled', 'disabled');
				$('#startWork').attr('disabled', 'disabled');
			}
		}
	})
	
	$('#startWork').click(function() {
	   //형남 0112 출근기능
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/startWork.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
			//총 근무일 갱신
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTotalTA.hari",
					type: "post",
					dataType: "json",
					success: function(totalTA) {
						console.log(totalTA);
						$('#totalTA').text('');
						$('#totalTA').append(totalTA);
					}
				});
				//있으면 true, 없으면 false
				if(data==true){
					alert('출근 등록되었습니다.');	
					$('#endWork').removeAttr('disabled');	
					$('#startWork').attr('disabled', 'disabled');
				}else{
					alert('출근 등록에 실패하였습니다.');
				}
			}
		})
	})
	$('#endWork').click(function() {
		   //형남 0112 퇴근기능
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/endWork.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
			//있으면 true, 없으면 false
				if(data==true){
					alert('퇴근 등록되었습니다.');
					$('#endWork').attr('disabled', 'disabled');
					$('#startWork').attr('disabled', 'disabled');
				}else{
					alert('퇴근 등록에 실패하였습니다.');
				}
			}
		})
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/getDataDate.hari",
			type: "post",
			dataType: "text",
			success: function(dataDate) {
				var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
				for(var i=0;i<itemArray.length;i++){
					console.log($(itemArray[i]).attr('data-date'));
					if($(itemArray[i]).attr('data-date') == dataDate.trim()){
						console.log($(itemArray[i]).attr('data-date') + ' ==> 이 친구');
						$(itemArray[i]).removeAttr("td");
						$(itemArray[i]).append('<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-success fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">퇴근</span></div><div class="fc-resizer fc-end-resizer"></div></a>');
					}
					
		        }
			}
		});
	})
	
	//이번주 총 근무
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getWeekTotalTime.hari",
		type: "post",
		dataType: "text",
		success: function(getWeekTotalTime) {
			if(getWeekTotalTime.trim() != "empty" ){
				$('#getWeekTotalTime').text('');
				$('#getWeekTotalTime').append(getWeekTotalTime);
			} else{
				$('#getWeekTotalTime').text('');
				$('#getWeekTotalTime').append('00:00');
			}
		}
	});
	
	//총 근무
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTotalTime.hari",
		type: "post",
		dataType: "text",
		success: function(getTotalTime) {
			if(getTotalTime.trim() != "empty" ){
				$('#getTotalTime').text('');
				$('#getTotalTime').append(getTotalTime);
			} else{
				$('#getTotalTime').text('');
				$('#getTotalTime').append('00:00');
			}
		}
	});
	
	$('#test').click(function(){
		if (navigator.geolocation) {
// 			var apiGeolocationSuccess = function(position) {
// 				alert("API geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
// 			};

// 			var tryAPIGeolocation = function() {
// 				jQuery.post( "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyDCa1LUe1vOczX1hO_iGYgyo8p_jYuGOPU", function(success) {
// 					apiGeolocationSuccess({coords: {latitude: success.location.lat, longitude: success.location.lng}});
// 			  })
// 			  .fail(function(err) {
// 			    alert("API Geolocation error! \n\n"+err);
// 			  });
// 			};

// 			var browserGeolocationSuccess = function(position) {
// 				alert("Browser geolocation success!\n\nlat = " + position.coords.latitude + "\nlng = " + position.coords.longitude);
// 			};

// 			var browserGeolocationFail = function(error) {
// 			  switch (error.code) {
// 			    case error.TIMEOUT:
// 			      alert("Browser geolocation error !\n\nTimeout.");
// 			      break;
// 			    case error.PERMISSION_DENIED:
// 			      if(error.message.indexOf("Only secure origins are allowed") == 0) {
// 			        tryAPIGeolocation();
// 			      }
// 			      break;
// 			    case error.POSITION_UNAVAILABLE:
// 			      alert("Browser geolocation error !\n\nPosition unavailable.");
// 			      break;
// 			  }
// 			};
// 			var tryGeolocation = function() {
// 				  if (navigator.geolocation) {
// 				    navigator.geolocation.getCurrentPosition(
// 				    	browserGeolocationSuccess,
// 				      browserGeolocationFail,
// 				      {maximumAge: 50000, timeout: 20000, enableHighAccuracy: true});
// 				  }
// 				};

// 			tryGeolocation();
			navigator.geolocation.getCurrentPosition(function(position) {
				myLatitude=position.coords.latitude; //위도
				myLongitude=position.coords.longitude;//경도
				
				if(Math.abs(fixLatitude - myLatitude) >0.001 || Math.abs(fixLongitude - myLongitude) > 0.001){
					console.log('실패');
					return;
				} else{
					console.log('성공');
				}
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getDataDate.hari",
					type: "post",
					dataType: "text",
					success: function(dataDate) {
						var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
						for(var i=0;i<itemArray.length;i++){
							console.log($(itemArray[i]).attr('data-date'));
							if($(itemArray[i]).attr('data-date') == dataDate.trim()){
								console.log($(itemArray[i]).attr('data-date') + ' ==> 이 친구');
								$(itemArray[i]).removeAttr("td");
								$(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">Event Four</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
							}
				        }
					}
				});
			});
		}else { 
			alert('현재 브라우저에서 지원하지 않는 기능입니다.');
		}
	})
	var item=document.querySelectorAll('.fc-prev-button');
	console.log(item);
	
	//이번달 출근기록 yyyy-mm-dd
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getStartList.hari",
		type: "post",
		dataType: "json",
		success: function(getStartList) {
			var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
			for(var i=0; i<itemArray.length; i++){
				for(var j=0; j<getStartList.length; j++){
					if($(itemArray[i]).attr('data-date') == getStartList[j]){
						$(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">출근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
					}
				}
			}
			//이번달 출근기록 yyyy-mm-dd
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getEndList.hari",
				type: "post",
				dataType: "json",
				success: function(getEndList) {
					var itemArray2=document.querySelectorAll('.fc-day.fc-widget-content');
					for(var i=0; i<itemArray2.length; i++){
						for(var j=0; j<getEndList.length; j++){
							if($(itemArray2[i]).attr('data-date') == getEndList[j]){
								$(itemArray2[i]).append('<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-success fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">퇴근</span></div><div class="fc-resizer fc-end-resizer"></div></a>');
							}
						}
					}
				}
			});
		}
	});
});





</script>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
	<div class="lds-ripple">
		<div class="lds-pos"></div>
		<div class="lds-pos"></div>
	</div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
	<!-- ============================================================== -->
	<!-- Topbar header - style you can find in pages.scss -->

<!-- 원래 inc 헤더 임 !!!!!  -->

	<!--상단 topnavbar 시작 -->
	<header class="topbar" data-navbarbg="skin5"> 

		<nav class="navbar top-navbar navbar-expand-md navbar-dark">
			<div class="navbar-header" data-logobg="skin5"> 
				<!-- 모바일용 토글러-->
				<a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
					<i class="ti-menu ti-close"></i>
				</a>
				<!-- ============================================================== -->
				<!-- Logo -->
				<!-- ============================================================== -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/main.hari"> <!-- 로고 아이콘 시작 -->
					<b class="logo-icon p-l-10"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
						<!-- 로고 아이콘 png-->
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-img-final.png" alt="homepage" class="light-logo" style="width: 30%; height: 20%; color:#2ab2aa;" />
					</b><!--로고 아이콘 끝  -->
					<!-- 로고 글씨 시작 -->
					<span class="logo-text">
						<!-- 로고 글씨 png-->
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-152.png" alt="homepage" class="light-logo" style="width: 200%; height: 20%; margin-left: -120%;" />
					</span> <!-- Logo icon --> <!-- <b class="logo-icon"> --> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
					<!-- </b> --> <!--End Logo icon -->
				</a>
				<!-- 로고 전체 끝 !! -->

				<a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<i class="ti-more"></i>
				</a>
			</div>
			<!-- ============================================================== -->
			<!-- navbar 로고 전체 끝 !!  -->
			<!-- ============================================================== -->


			<!--top navbar 더보기 & 검색 -->
			<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5"> 
				<!-- ============================================================== -->
				<!-- toggle and nav items -->
				<!-- ============================================================== -->
				<ul class="navbar-nav float-left mr-auto" style = "color:#2ab2aa;">
					<!--더보기 메뉴 버튼 left bar 이용가능 -->
					<li class="nav-item d-none d-md-block">
						<a class="nav-link sidebartoggler waves-effect waves-light" style = "font-color:#2ab2aa;" href="javascript:void(0)" data-sidebartype="mini-sidebar">
							<i class="mdi mdi-menu font-24"></i>
						</a>
					</li>

					<!-- ============================================================== -->
					<!-- 검색 기능  -->
					<!-- ============================================================== -->
					<li class="nav-item search-box">
						<a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
							<i class="ti-search"></i>
						</a>
						<form class="app-search position-absolute">
							<input type="text" class="form-control" placeholder="Search &amp; enter">
								<a class="srh-btn"><i class="ti-close"></i></a>
						</form>
					</li>
				</ul>
				<!--top navbar 더보기 & 검색  끝 -->

				<!--top navbar 에서 오른쪽 기능 담당 (출/퇴근과 프로필)-->
				<ul class="navbar-nav float-right">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle waves-effect waves-dark" style = "color:#2ab2aa;" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="mdi mdi-bell font-24"></i>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<button class="dropdown-item" id="startWork" disabled="disabled">출근하기</button>
							<button class="dropdown-item" id="endWork" disabled="disabled">퇴근하기</button>
							<button class="dropdown-item" id="test" >퇴근하기</button>
						</div>
					</li>
					<!--top navbar 에서 오른쪽 기능 담당 (출/퇴근과 프로필) 끝 -->
					
					<!-- 2020.1.7.19:50 김수연  -->
					
					<!--내 프로필 시작-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="${pageContext.request.contextPath}/resources/hari/assets/images/users/profile-02.png" alt="user" class="rounded-circle" width="31">
						</a>
						<div class="dropdown-menu dropdown-menu-right user-dd animated">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/1hariMy/myInfo.hari">
								<i class="ti-user m-r-5 m-l-5"></i>내 프로필</a> <!--경로 1hariMy 폴더안에 myInfo.jsp (controller myInfo.hari를) -->
								<a class="dropdown-item" href="javascript:void(0)">
									<i class="ti-wallet m-r-5 m-l-5"></i>내 업무
								</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="javascript:void(0)">
								<i class="ti-settings m-r-5 m-l-5"></i>계정관리
							</a>
							<div class="dropdown-divider"></div>
							<!-- 로그아웃 -->
							<a href="#" onclick="document.getElementById('logout-form').submit();"><i class="fa fa-power-off m-r-5 m-l-5"></i>로그아웃</a>
							<form id="logout-form" action="${pageContext.request.contextPath}/logout" method="POST">
							   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
							</form>
						</div>
					</li>
					<!--내 프로필 끝 -->
				</ul>
				<!--top navbar 오른 쪽 끝 -->
			</div>
		</nav>
	</header>
	<!-- ============================================================== -->
	<!-- top navbar 전체 끝 !! -->