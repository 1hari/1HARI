<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">

$(function(){
	var isStart=false; //오늘 출근했는지
	var isEnd=false;//오늘 퇴근했는지
	var isAbsent=false;//오늘 결근인지
	var currYear;
	var currMonth;
	var fixLatitude=parseFloat(37.525913599999996);
	var fixLongitude=parseFloat(126.83591679999999);
	var myLatitude; //사용자 위도
	var myLongitude;////사용자 경도
	var currTime;
	var integerTime;
	
	//현재시간 예쁘게 출력
	function getTimeStamp() {
	  var d = new Date();
	  var s =
	    leadingZeros(d.getHours(), 2) +
	    leadingZeros(d.getMinutes(), 2) +
		leadingZeros(d.getSeconds(), 2);
	  return s;
	}
	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	//toastr 옵션설정
	toastr.options.escapeHtml = true;	
	toastr.options.closeButton = true;	
	toastr.options.newestOnTop = true;	
	toastr.options.progressBar = true;	

	//현재시간 정수로 비교해 알람창 띄어주기
	var timeCheck=setInterval(function(){
		integerTime=parseInt(getTimeStamp());
		if(integerTime == 105000 && isStart == false){
			clearInterval(timeCheck);
			notify();
		}else if(integerTime > 105000 || isStart == true){
			clearInterval(timeCheck);
		}
	},1000);

	//테마 색 바꾸기 ** 함수위치 고정!! 바꾸면 안됨**
    $('.demo').each(function() {
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        //console.log(value);
						var itemArray5=document.querySelectorAll('#theme');
    					$.ajax({
    			    		url: "${pageContext.request.contextPath}/ajax/setThemeColor.hari",
    			    		type: "post",
    			    		data: {"color": value},
    			    		dataType: "text",
    			    		success: function(setThemeColor) {
    			    			if(setThemeColor >0){
    			    		 		$.ajax({
	    			    	 			url: "${pageContext.request.contextPath}/ajax/getThemeColor.hari",
	    			    	 			type: "post",
	    			    	 			dataType: "text",
	    			    	 			success: function(getThemeColor) {
	    			    	 				for(var i=0;i<itemArray5.length;i++){
	    	 			    					$(itemArray5[i]).css('background', getThemeColor);
	    	 			    					$('#navbarSupportedContent').css('background', getThemeColor);
	    	 			    					$('#sidebarnav').css('background', getThemeColor);
    			    	 		     	   }
    			    	 				}
    			    	 			});
        		        		}
							}
						});
                    }
                },
			theme: 'bootstrap'
         });
	});
	
	//총 근무일
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTotalTA.hari",
		type: "post",
		dataType: "json",
		success: function(totalTA) {
			$('#totalTA').append(totalTA);
		}
	});

	//출근버튼 + 캘린더
	$('#startWork').click(function() {
		//테스트 주석
// 		if (navigator.geolocation) {
// 			navigator.geolocation.getCurrentPosition(function(position) {
// 				myLatitude=position.coords.latitude; //위도
// 				myLongitude=position.coords.longitude;//경도
				
// 				if(Math.abs(fixLatitude - myLatitude) >0.001 || Math.abs(fixLongitude - myLongitude) > 0.001){
// 					alert('위치정보가 다릅니다. 로그인 실패');
// 					return;
// 				}
				//캘린더
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
                        $('#totalTA').text('');
                        $('#totalTA').append(totalTA);
                     }
                  });
                  //있으면 true, 없으면 false
                  if(data==true){
                	 var integerDate= parseInt(getTimeStamp());
                	 
                     swal("success", "출근 등록되었습니다.", "success")
                     $('#endWork').removeAttr('disabled');   
                     $('#startWork').attr('disabled', 'disabled');
                     $.ajax({
                        url: "${pageContext.request.contextPath}/ajax/getDataDate.hari",
                        type: "post",
                        dataType: "text",
                        success: function(dataDate) {
                           var itemArray2=document.querySelectorAll('.fc-day.fc-widget-content');
                           if(integerDate < 110000){
                        	   console.log(integerDate + '1');
                               for(var i=0;i<itemArray2.length;i++){
                                   if($(itemArray2[i]).attr('data-date') == dataDate.trim()){
                                      $(itemArray2[i]).removeAttr("td");
                                      $(itemArray2[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">출근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
                                   }
								}
							}else{
								console.log(integerDate + '2');
                               for(var i=0;i<itemArray2.length;i++){
                                   if($(itemArray2[i]).attr('data-date') == dataDate.trim()){
                                      $(itemArray2[i]).removeAttr("td");
                                      $(itemArray2[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">지각</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
                                   }
								}
							}

                        }
                     });
                  }else{
                     swal("warning", "출근등록 실패, 관리자에게 문의해주세요.", "warning")
                  }
               }
            })
// 			});
// 		}else { 
// 			alert('현재 브라우저에서 지원하지 않는 기능입니다.');
// 			return;
// 		}
	})
	$('#endWork').click(function() {
// 		if (navigator.geolocation) {
// 			navigator.geolocation.getCurrentPosition(function(position) {
// 				myLatitude=position.coords.latitude; //위도
// 				myLongitude=position.coords.longitude;//경도
			
// 				if(Math.abs(fixLatitude - myLatitude) >0.001 || Math.abs(fixLongitude - myLongitude) > 0.001){
// 					alert('위치정보가 다릅니다. 퇴근 실패');
// 					return;
// 				}
		   //형남 0112 퇴근기능
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/endWork.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
			//있으면 true, 없으면 false
				if(data==true){
					swal("success", "퇴근 등록되었습니다.", "success")
					$('#endWork').attr('disabled', 'disabled');
					$('#startWork').attr('disabled', 'disabled');
					$.ajax({
						url: "${pageContext.request.contextPath}/ajax/getDataDate.hari",
						type: "post",
						dataType: "text",
						success: function(dataDate) {
							var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
							for(var i=0;i<itemArray.length;i++){
								if($(itemArray[i]).attr('data-date') == dataDate.trim()){
									$(itemArray[i]).removeAttr("td");
									$(itemArray[i]).append('<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-success fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">퇴근</span></div><div class="fc-resizer fc-end-resizer"></div></a>');
								}
								
					        }
						}
					});
				}else{
					swal("warning", "퇴근 등록에 실패하였습니다. 관리자에게 문의해주세요.", "warning")
					return;
				}
			}
		})

// 			});
// 		}else { 
// 			alert('현재 브라우저에서 지원하지 않는 기능입니다.');
// 			return;
// 		}
	})


	//오늘 출근기록 체크
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/todayStartWorkCheck.hari",
		type: "post",
		dataType: "json",
		success: function(todayStartWorkCheck) {
			isStart=todayStartWorkCheck;
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/todayAbsentCheck.hari",
				type: "post",
				dataType: "json",
				success: function(todayAbsentCheck) {
					//퇴근근기록이 있으면 true, 없으면 false
					isAbsent=todayAbsentCheck;
					
					console.log(isStart);
					console.log(isEnd);
					console.log(isAbsent);
// 					console.log(typeof(isStart));
// 					console.log(typeof(isAbsent));
// 					console.log(typeof(isEnd));
					if(isStart == false && isEnd==false && isAbsent==false){
						$('#startWork').removeAttr('disabled');	
						$('#endWork').attr('disabled', 'disabled');
						//출근 미등록 알림 (페이지 이동마다 출근 안찍혀있으면 알림)
						toastr.error('출근등록 여부를 확인해 주세요', '출근알림', {timeOut: 5000});
					}else if(isStart == true && isEnd==false && isAbsent==false){
						$('#startWork').attr('disabled', 'disabled');
						$('#endWork').removeAttr('disabled');	
					} else if((isStart == true && isEnd==true && isAbsent==false) || (isStart == true && isEnd==true && isAbsent==true) || (isStart == false && isEnd==false && isAbsent==true) || (isStart == true && isEnd==true && isAbsent==true) || (isStart == true && isEnd==false && isAbsent==true)) {
						$('#endWork').attr('disabled', 'disabled');
						$('#startWork').attr('disabled', 'disabled');
// 					} else if(isStart == true && isEnd==true && isAbsent==true) {
						
// 					} else if(isStart == false && isEnd==false && isAbsent==true) {
// 						$('#endWork').attr('disabled', 'disabled');
// 						$('#startWork').attr('disabled', 'disabled');
// 					} else if(isStart == true && isEnd==true && isAbsent==true) {
// 						$('#endWork').attr('disabled', 'disabled');
// 						$('#startWork').attr('disabled', 'disabled');
					} else if(isStart == false && isEnd==true) {
						swal("warning", "근태오류, 관리자에게 문의해주세요.", "warning")
					} else{
						console.log('아무것도 못탐');
					}
				}
			});
		}
	})
	
	//오늘 퇴근기록 체크
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/todayEndWorkCheck.hari",
		type: "post",
		dataType: "json",
		success: function(data) {
			//퇴근근기록이 있으면 true, 없으면 false
			isEnd=data;

			if(isEnd==false && isStart==true){
				//false 면 현재시간 - 출근시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getWorkTime.hari",
					type: "post",
					dataType: "text",
					success: function(getWorkTime) {
						if($.trim(getWorkTime) != "empty" ){
							$('#getWorkTime').text('');
							$('#getWorkTime').append(getWorkTime);
						} else{
							$('#getWorkTime').text('');
							$('#getWorkTime').append('00:00');
						}
					}
				});

				//퇴근전 이번주 현재까지 근무시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getWeekTotalTime.hari",
					type: "post",
					dataType: "text",
					success: function(getWeekTotalTime) {
						if($.trim(getWeekTotalTime) != "empty" ){
							$('#getWeekTotalTime').text('');
							$('#getWeekTotalTime').append(getWeekTotalTime);
						} else{
							$('#getWeekTotalTime').text('');
							$('#getWeekTotalTime').append('00:00');
						}
					}
				});
				
				//총 현재까지 근무시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTotalTime.hari",
					type: "post",
					dataType: "text",
					success: function(getTotalTime) {
						var splitTime2=getTotalTime.split(':');
						if($.trim(getTotalTime) != "empty" ){
							$('#getTotalTime').text('');
							$('#getTotalTime').append(splitTime2[0] + ":"+splitTime2[1]);
						} else{
							$('#getTotalTime').text('');
							$('#getTotalTime').append('00:00');
						}
					}
				});
			} else{
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTodayTotalTime.hari",
					type: "post",
					dataType: "text",
					success: function(getTodayTotalTime) {
						if($.trim(getTodayTotalTime) != "empty" ){
							$('#getWorkTime').text('');
							$('#getWorkTime').append(getTodayTotalTime);
						} else{
							$('#getWorkTime').text('');
							$('#getWorkTime').append('00:00');
						}
					}
				});
				
				//퇴근 후 이번주 총 근무시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getWeekWorkTime.hari",
					type: "post",
					dataType: "text",
					success: function(getWeekWorkTime) {
						if($.trim(getWeekWorkTime) != "empty" ){
							$('#getWeekTotalTime').text('');
							$('#getWeekTotalTime').append(getWeekWorkTime);
						} else{
							$('#getWeekTotalTime').text('');
							$('#getWeekTotalTime').append('00:00');
						}
					}
				});
				
				//총 근무시간
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTotalWorkTime.hari",
					type: "post",
					dataType: "text",
					success: function(getTotalWorkTime) {
						var splitTime=getTotalWorkTime.split(':');
						if(getTotalWorkTime != "empty" ){
							$('#getTotalTime').text('');
							$('#getTotalTime').append(splitTime[0] + ':' + splitTime[1]);
						} else{
							$('#getTotalTime').text('');
							$('#getTotalTime').append('00:00');
						}
					}
				});
			}
		}
	})

	

	//페이지 이동시마다 사용자 설정 테마색으로 변경
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getThemeColor.hari",
		type: "post",
		dataType: "text",
		success: function(getThemeColor) {
			var itemArray=document.querySelectorAll('#theme');
			for(var i=0;i<itemArray.length;i++){
				$(itemArray[i]).attr('style', 'background:' + getThemeColor);
				$('#navbarSupportedContent').attr('style', 'background:' + getThemeColor);
				$('#sidebarnav').attr('style', 'background:' + getThemeColor);
				$('.minicolors-swatch-color').attr('style', 'background-color:' + getThemeColor);
	        }
		}
	});

	
	$('#test').click(function(){
		$('#theme').css('background', 'red');
	})

    if (window.Notification) {
        Notification.requestPermission();
    }

    function notify() {
        if (Notification.permission !== 'granted') {
            swal("warning", "notification is disabled", "warning")
        }
        else {
            var notification = new Notification('Notification title', {
                icon: '${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png',
                body: '출근 미등록 상태입니다. 확인해주세요.',
            });

            notification.onclick = function () {
                location.href='${pageContext.request.contextPath}/1hariHr/attendance.hari';
            };
        }
    }

	//이번달 출근기록 yyyy-mm-dd
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getStartList.hari",
		type: "post",
		dataType: "json",
		success: function(getStartList) {
			var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
	         
   		     setTimeout(function(){
   		    	for(var i=0; i<itemArray.length; i++){
   		            for(var j=0; j<getStartList.startList.length; j++){
   		               if($(itemArray[i]).attr('data-date') == getStartList.startList[j]){
   		                  $(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">출근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
   		               }
   		            }
   					for(var j=0; j<getStartList.tardyList.length; j++){
   		               if($(itemArray[i]).attr('data-date') == getStartList.tardyList[j]){
   	   		                  $(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">지각</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
						}
   					}
   		         }
   		 	 },100);
   		     setTimeout(function(){
   				//이번달 퇴근기록 yyyy-mm-dd
   				$.ajax({
   					url: "${pageContext.request.contextPath}/ajax/getEndList.hari",
   					type: "post",
   					dataType: "json",
   					success: function(getEndList) {
   						var itemArray2=document.querySelectorAll('.fc-day.fc-widget-content');
   						for(var i=0; i<itemArray2.length; i++){
   							for(var j=0; j<getEndList.endList.length; j++){
   								if($(itemArray2[i]).attr('data-date') == getEndList.endList[j]){
   									$(itemArray2[i]).append('<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-success fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">퇴근</span></div><div class="fc-resizer fc-end-resizer"></div></a>');
   								}
   							}
   							for(var j=0; j<getEndList.absentList.length; j++){
   								if($(itemArray2[i]).attr('data-date') == getEndList.absentList[j]){
   									$(itemArray2[i]).empty();
   									$(itemArray2[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-danger fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">결근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
   								}
   							}
   						}
   					}
   				});
   		 	 },200);
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

		<nav class="navbar top-navbar navbar-expand-md navbar-dark" >
              <div class="navbar-header" id="theme" data-logobg="skin5" style="background: white;">  
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
						                        <img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-text-30-23.png" alt="homepage" class="light-logo" /><!-- style="width: 30%; height: 20%; color:#2ab2aa;" -->
					</b><!--로고 아이콘 끝  -->
					<!-- 로고 글씨 시작 -->
					<span class="logo-text" >
						<!-- 로고 글씨 png-->
						                        <img src="${pageContext.request.contextPath}/resources/hari/assets/images/logo-text-152-28.png" alt="homepage" class="light-logo" />
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
				<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5" style="background: white"> 
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
				</ul>
				<!--top navbar 더보기 & 검색  끝 -->

				<!--top navbar 에서 오른쪽 기능 담당 (출/퇴근과 프로필)-->
<!-- 				<div> -->
<!-- 					<input type="text" id="hue-demo" class="form-control demo" data-control="hue" value="#ff6161"> -->
<!-- 				</div> -->

				<ul class="navbar-nav float-right">
					
					<!-- 개인셋팅 -->
					<li class="nav-item" >
						<a class="nav-link waves-effect waves-dark" id="theme" style = "color:white;" href="" data-toggle="modal" data-target="#themeModal" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-cog font-24"  style="padding-top: 20px;"></i>
						</a>
					</li>
					
					<!-- 출퇴근 -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle waves-effect waves-dark" id="work" style = "color:white;" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-calendar-check font-24" style="padding-top: 20px;"></i>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" >
							<button class="dropdown-item" id="startWork" disabled="disabled" >출근하기</button>
							<button class="dropdown-item" id="endWork" disabled="disabled" >퇴근하기</button>
							<button class="dropdown-item" id="test" >test</button>
						</div>
					</li>
					<!--top navbar 에서 오른쪽 기능 담당 (출/퇴근과 프로필) 끝 -->
					
					<!-- 2020.1.7.19:50 김수연  -->
					
					<!--내 프로필 시작-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="${pageContext.request.contextPath}/resources/hari/assets/images/users/profile-02.png" alt="user" class="rounded-circle" width="31">
						</a>
						<div class="dropdown-menu dropdown-menu-right animated">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/1hariMy/myInfo.hari">
								<i class="ti-user m-r-5 m-l-5"></i> 내 프로필
							</a> <!--경로 1hariMy 폴더안에 myInfo.jsp (controller myInfo.hari를) -->
								
							<div class="dropdown-divider"></div>
							
							<!-- 로그아웃 -->
							<a href="#" class="dropdown-item" onclick="document.getElementById('logout-form').submit();">
								<i class="fa fa-power-off m-r-5 m-l-5"></i> 로그아웃
							</a>
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
	
<!-- DRAFT Modal -->
<div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width: 250px;">
			<form action="/"  enctype="multipart/form-data" method="post">			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">개인설정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div><!-- modal-header 끝 -->
					
				<div class="modal-body" style="height: 250px;">		
					<div class="form-group row">
						<div class="col-md-12">
							<input type="text" id="hue-demo" class="form-control demo" data-control="hue" value="#ff6161">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-12">
							<div class="fileDrop"></div>
							<div id="uploadedList"></div>
						</div>
					</div>
				</div><!-- modal-body 끝 -->
			
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type=button class="btn btn-primary" id="themeChoice">선택완료</button>
				</div><!-- modal-footer 끝 -->
			</form>	
		</div><!-- modal-content 끝 -->
	</div><!-- modal-dialog 끝 -->
</div><!--  draftModal 끝 -->

<script type="text/javascript">
// //이미지 파일 여부 판단
// function checkImageType(fileName){
//     var pattern = /jpg|gif|png|jpeg/i;
//     return fileName.match(pattern);
// }

// // 업로드 파일 정보
// function getFileInfo(fullName){
//     var fileName, imgsrc, getLink, fileLink;
//     // 이미지 파일일 경우
//     if(checkImageType(fullName)){
//         // 이미지 파일 경로(썸네일)
//         imgsrc = "/WEB-INF/views/1hariMy/upload/displayFile?fileName="+fullName;
//         console.log(imgsrc);
//         // 업로드 파일명
//         fileLink = fullName.substr(14);
//         console.log(fileLink);
//         // 날짜별 디렉토리 추출
// //         var front = fullName.substr(0, 12);
// //         console.log(front);
//         // s_를 제거한 업로드이미지파일명
//         var end = fullName.substr(14);
//         console.log(end);
//         // 원본이미지 파일 디렉토리
//         getLink = "/WEB-INF/views/1hariMy/upload/displayFile?fileName="+front+end;
//         console.log(getLink);
//     // 이미지 파일이 아닐경우
//     } else {
//         alert("이미지 파일만 업로드 가능합니다.");
//     }
//     // 목록에 출력할 원본파일명
//     fileName = fileLink.substr(fileLink.indexOf("_")+1);
//     console.log(fileName);
//     // { 변수:값 } json 객체 리턴
//     return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
// }

// //파일 업로드 영역에서 기본효과를 제한
// $(".fileDrop").on("dragenter dragover", function(e){
//     e.preventDefault(); // 기본효과 제한
// });
// // 드래그해서 드롭한 파일들 ajax 업로드 요청
// $(".fileDrop").on("drop", function(e){
//     e.preventDefault(); // 기본효과 제한
//     var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
//     var file = files[0]; // 첫번째 첨부파일
//     var formData = new FormData(); // 폼데이터 객체
//     formData.append("file", file); // 첨부파일 추가
//     $.ajax({
//         url: "${path}/upload/uploadAjax",
//         type: "post",
//         data: formData,
//         dataType: "text",
//         processData: false, // processType: false - header가 아닌 body로 전달
//         contentType: false,
//         // ajax 업로드 요청이 성공적으로 처리되면
//         success: function(data){
//             console.log(data);
//             // 첨부 파일의 정보
//             var fileInfo = getFileInfo(data);
//             // 하이퍼링크
//             var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
//             // hidden 태그 추가
//             html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
//             // div에 추가
//             $("#uploadedList").append(html);
//     }
// });
</script>
