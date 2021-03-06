<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

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
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logoimg.png" alt="homepage" class="light-logo" /><!-- style="width: 30%; height: 20%; color:#2ab2aa;" -->
					</b><!--로고 아이콘 끝  -->
					<!-- 로고 글씨 시작 -->
					<span class="logo-text" >
						<!-- 로고 글씨 png-->
						<img src="${pageContext.request.contextPath}/resources/hari/assets/images/logotext.png" alt="homepage" class="light-logo" />
					</span>
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
			<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5" style="background: white; box-shadow: 6px 6px 6px #f7f7f7; "> 
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
				<ul class="navbar-nav float-right">
					<li class="nav-item" style="padding-top: 6%; color: white;" id="todayDate">
					</li>
					<!-- 개인셋팅 -->
					<li class="nav-item" >
						<a class="nav-link waves-effect waves-dark" id="theme" style = "color:white;" href="" data-toggle="modal" data-target="#themeModal" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-cog fa-fw font-29"  style="padding-top: 20px; "></i>
						</a>
					</li>
					<!-- 출퇴근 -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle waves-effect waves-dark" id="work" style = "color:white;" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-calendar-check font-29" style="padding-top: 18px;"></i>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown" >
							<button class="dropdown-item" id="startWork" style="display: none;"><i class="m-r-10 mdi mdi-treasure-chest"></i>&nbsp;출근하기</button>
							<button class="dropdown-item" id="endWork" style="display: none;"><i class="m-r-10 mdi mdi-wallet-travel"></i>&nbsp;퇴근하기</button>
							<button class="dropdown-item" id="taComplete"  style="display: none;">&nbsp;출퇴근 완료</button>
						</div>
					</li>
					<!--top navbar 에서 오른쪽 기능 담당 (출/퇴근과 프로필) 끝 -->
					<!-- 2020.1.7.19:50 김수연  -->
					<!--내 프로필 시작-->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="" alt="user" id="profileFileName" style= "padding-bottom:5px;" class="rounded-circle" width="40">
						</a>
						<div class="dropdown-menu dropdown-menu-right animated">
							<se:authentication property="name" var="LoginUser" />
							<p class="dropdown-item">
								${LoginUser} 님 반갑습니다.
							</p>
							<div class="dropdown-divider"></div>
	                           <a class="dropdown-item" href="${pageContext.request.contextPath}/1hariMy/myInfo.hari">
								<i class="ti-user m-r-5 m-l-5"></i> 내 프로필
							</a>
							<div class="dropdown-divider"></div>
							<!-- 로그아웃 -->
							<a href="#" class="dropdown-item" id="aLogout">
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
	<div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 250px;">
				<form action="/"  enctype="multipart/form-data" method="post">			
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">개인설정</h5>
						<button type="button" class="modelClose" aria-label="Close" style ="border:0">
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
								<div class="fileDrop">
									이미지 파일을 Drag & Drop 하세요.
									<input type="text" id="filename" class="form-control" value="" readonly>
								</div>
							</div>
						</div>
					</div><!-- modal-body 끝 -->
				
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary modelClose">취소</button>
						<button type=button class="btn btn-info" id="themeSetup" style= "border:2px solid #999999; background-color: white; color:black; font-weight:bold;">초기화</button>
						<button type=button class="btn btn-success" id="themeChoice">선택완료</button>
					</div><!-- modal-footer 끝 -->
				</form>	
			</div><!-- modal-content 끝 -->
		</div><!-- modal-dialog 끝 -->
	</div><!--  draftModal 끝 -->
	
<script type="text/javascript">
	var d = new Date();
	$(function(){
		getMyTheme();
		var imgfile = null; //첨부파일
		var formData; //DB 로보낼 첨부파일과 색상코드를 담기 위한 변수
	
		//색상 선택시 테마색 변경 적용
		$('.demo').each(function() {
	        $(this).minicolors({
				control: $(this).attr('data-control') || 'hue',
				change: function(value, opacity) {
					if (!value) return;
					if (opacity) value += ', ' + opacity;
					if (typeof console === 'object') {
						var itemArray5=document.querySelectorAll('#theme');
							
						for(var i=0;i<itemArray5.length;i++){
							$(itemArray5[i]).css('background', value.split(",")[0]);
							$('#navbarSupportedContent').css('background', value.split(",")[0]);
							$('#sidebarnav').css('background', value.split(",")[0]);
						}
					}
				},
				theme: 'bootstrap'
	         });
		});
		
		//이미지 파일 여부 판단
		function checkImageType(fileName){
		    var pattern = /jpg|gif|png|jpeg/gi;
		    return fileName.match(pattern);
		}
		
		//파일 업로드 영역에서 기본효과를 제한
		$(".fileDrop").on("dragenter dragover", function(e){
		    e.preventDefault(); // 기본효과 제한
		});
		
		// 드래그해서 드롭한 파일명 가져오기
		$(".fileDrop").on("drop", function(e){
		    e.preventDefault(); // 기본효과 제한
		    
		    var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
		    imgfile = files[0]; // 첫번째 첨부파일
		    formData = new FormData(); // 폼데이터 객체    
		    formData.append("file", imgfile); // 첨부파일 추가
		    
		    $.ajax({
		        url: "${pageContext.request.contextPath}/ajax/filename.hari",
		        type: "post",
		        data: formData,
		        dataType: "json",
		        processData: false, // processType: false - header가 아닌 body로 전달
		        contentType: false,
		        // ajax  요청이 성공적으로 처리되면
		        success: function(filenamejson){
		            if(checkImageType(filenamejson.fileName)){
		            	$('#filename').val(filenamejson.fileName);
			        }else {
			        	swal({
							text: "이미지 파일만 등록 가능합니다.",
							icon: "warning",
							button: "닫기"
						});
					}
		        }
		    });
		});
	
		//선택완료 클릭
		$('#themeChoice').click(function(){
			formData = new FormData();
			if(imgfile != null){
				formData.append("file",imgfile);
			}
			formData.append("themeColor", $('#hue-demo').val()); //선택한 색상 추가
			themeChange(formData);
			imgfile = null;
		});
	
		//개인테마설정 모달 close 클릭시
		$('.modelClose').click(function(){
			getMyTheme();
			$('#filename').val("");
	        $('#themeModal').modal('toggle');
		});//개인테마설정 모달 close 클릭시 끝
	
		//개인테마설정 모달 초기화 클릭시
		$('#themeSetup').click(function(){
			formData = new FormData();
			formData.append("profileFileName","defaultprofile.png");
			formData.append("themeColor","#807266");
			themeChange(formData)
		});
		
		var isStart=false; //오늘 출근했는지
		var isEnd=false;//오늘 퇴근했는지
		var isAbsent=false;//오늘 결근인지
		var fixLatitude=parseFloat(37.525913599999996); //회사의 위도 고정
		var fixLongitude=parseFloat(126.83591679999999);//회사의 경도 고정
		var myLatitude; //사용자 위도
		var myLongitude;//사용자 경도
		const date = new Date();
		const year = date.getFullYear();
		let month = date.getMonth()+1;
		let day = date.getDate();
		let hour = date.getHours();
		let minutes = date.getMinutes();
		let week = ['일', '월', '화', '수', '목', '금', '토'];
	
		
		//현재시간 예쁘게 출력
		function getTimeStamp() {
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
		
		var integerTime; //출근 경고 알림 띄어 줄 시간 정수형
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

		//헤더 오늘 날짜
		$('#todayDate').text(year + "년 " + month + "월 " + day + "일 " + week[date.getDay()]+ "요일")
		
		//출근버튼 + 캘린더 출력
		$('#startWork').click(function() {
			if(date.getDay() == 0 || date.getDay() == 6){
				swal("근태알림", "오늘은 주말입니다. 주말은 근태등록이 불가능합니다.", "warning")
				return
			}
			//테스트 주석
	// 		if (navigator.geolocation) {
	// 			navigator.geolocation.getCurrentPosition(function(position) {
	// 				myLatitude=position.coords.latitude; //위도
	// 				myLongitude=position.coords.longitude;//경도
					
	// 				if(Math.abs(fixLatitude - myLatitude) >0.001 || Math.abs(fixLongitude - myLongitude) > 0.001){
	// 					alert('위치정보가 다릅니다. 로그인 실패');
	// 					return;
	// 				}
			//형남 0112 출근기능
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/startWork.hari",
				type: "post",
				dataType: "json",
				success: function(data) {
					isStart=data
				}
			}).then((data) => {
				//있으면 true, 없으면 false
				if(isStart==true){
					var integerDate= parseInt(getTimeStamp());
					//출근기록 성공하면 출근버튼 숨기고 퇴근버튼 표시
					$('#endWork').removeAttr('style', 'display: none');
					$('#startWork').attr('style', 'display: none');
						
					swal("success", "출근 등록되었습니다.", "success").then((logout) => {
						if (logout) {
							location.reload();
						}
					})
				}else{
					swal("근태알림", "출근등록 실패, 관리자에게 문의해주세요.", "warning")
				}
			})
		})
		
		//퇴근버튼
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
					isEnd=data
				}
			}).then(() => {
				//퇴근 성공하면
				if(isEnd==true){
					swal("근태알림", "퇴근 등록되었습니다.", "success")
					//버튼 감추기
					$('#endWork').attr('style', 'display: none');
					$('#startWork').attr('style', 'display: none');
					
					swal("근태알림", "퇴근 등록되었습니다.", "success").then((logout) => {
	                    if (logout) {
	                    	location.reload();
	                 	 }
					})
				}else{
					swal("근태알림", "퇴근 등록에 실패하였습니다. 관리자에게 문의해주세요.", "warning")
					return;
				}
			})
		})
	
		//오늘 출근기록 체크
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/todayStartWorkCheck.hari",
			type: "post",
			dataType: "json",
			success: function(todayStartWorkCheck) {
				isStart=todayStartWorkCheck;
			}
		}).then((isStart) => {
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/todayAbsentCheck.hari",
				type: "post",
				dataType: "json",
				success: function(todayAbsentCheck) {
					//퇴근근기록이 있으면 true, 없으면 false
					isAbsent=todayAbsentCheck;
					//오늘 출근, 퇴근, 결근이 없으면 출근버튼 활성화
					if(isStart == false && isEnd==false && isAbsent==false){
						$('#startWork').removeAttr('style', 'display: none');
						$('#endWork').attr('style', 'display: none');
						//평일 체크
						if(d.getDay() != 0 && d.getDay() != 6){
							//출근 미등록 알림 (페이지 이동마다 출근 안찍혀있으면 알림)
							toastr.error('출근등록 여부를 확인해 주세요', '출근알림', {timeOut: 5000});
						}
						//오늘 출근만 있으면 퇴근버튼 활성화
					}else if(isStart == true && isEnd==false && isAbsent==false){
						$('#startWork').attr('style', 'display: none');
						$('#endWork').removeAttr('style', 'display: none');
						//그 외에 사항 버튼 감추고 출퇴근 완료 버튼 활성화
					} else if((isStart == true && isEnd==true && isAbsent==false) || (isStart == true && isEnd==true && isAbsent==true) || (isStart == false && isEnd==false && isAbsent==true) || (isStart == true && isEnd==true && isAbsent==true) || (isStart == true && isEnd==false && isAbsent==true)) {
						$('#startWork').attr('style', 'display: none');
						$('#endWork').attr('style', 'display: none');
						$('#taComplete').removeAttr('style', 'display: none');
						//오류사항
					} else if(isStart == false && isEnd==true) {
						swal("근태알림", "근태오류, 관리자에게 문의해주세요.", "warning")
					} else{
						swal("근태알림", "근태오류, 관리자에게 문의해주세요.", "warning")
					}
				}
			});
		})
		
		//오늘 퇴근기록 체크
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/todayEndWorkCheck.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
				//퇴근근기록이 있으면 true, 없으면 false
				isEnd=data;
			}
		})
		
		//Notification
	    if (window.Notification) {
	        Notification.requestPermission();
	    }
		
	    function notify() {
	        if (Notification.permission == 'granted') {
	            var notification = new Notification('Notification title', {
	                icon: '${pageContext.request.contextPath}/resources/hari/assets/images/favicon.png',
	                body: '출근 미등록 상태입니다. 확인해주세요.',
	            });
	
	            notification.onclick = function () {
	                location.href='${pageContext.request.contextPath}/1hariHr/attendance.hari';
	            };
	        }
	    }
	
	    //로그아웃 클릭
	    $('#aLogout').on('click', function(e){
	        //출근만 찍혀있고 퇴근이 안찍혀 있을 경우 경고창 띄어줌
	        if(isEnd==false && isStart==true){
	            e.preventDefault(); //cancel default action
	            swal({
	                title: "로그아웃 경고",
	                text: "퇴근시간이 기록되지 않았습니다. 정말 로그아웃 하시겠습니까?", 
	                icon: "warning",
	                buttons: true,
	                dangerMode: true,
	            }).then((logout) => {
	              if (logout) {
	                $('#logout-form').submit()
	              }else{
	                  return
	              }
	            });
	        }else{
	            $('#logout-form').submit()
	        }
	    });
	});// $(function() 종료

	//사용자 설정 테마색으로 변경
	function getMyTheme(){
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/getMyTheme.hari",
			type: "post",
			dataType: "json",
			success: function(theme) {
				//테마색 변경
				
				var itemArray=document.querySelectorAll('#theme');
				
				for(var i=0;i<itemArray.length;i++){
					$(itemArray[i]).attr('style', 'background:' + theme.themeColor);
					$('#navbarSupportedContent').attr('style', 'background:' + theme.themeColor);
					$('#sidebarnav').attr('style', 'background:' + theme.themeColor);
					$('.minicolors-swatch-color').attr('style', 'background-color:' + theme.themeColor);
		        }
	
		        //프로필사진 변경
		        $('#profileFileName').attr("src","${pageContext.request.contextPath}/resources/hari/profileFileUpload/"+theme.profileFileName);
			}
		});
	}
	function themeChange(formData){
		$.ajax({
	        url: "${pageContext.request.contextPath}/ajax/setMyTheme.hari",
	        type: "post",
	        data: formData,
	        dataType: "text",
	        processData: false, // processType: false - header가 아닌 body로 전달
	        contentType: false,
	        // ajax 업로드 요청이 성공적으로 처리되면
	        success: function(resultString){
	            if(resultString.trim() == "true"){
	            	swal({
						text: "변경이 완료되었습니다.",
						icon: "success",
						button: "닫기" 
					}).then((value) => {
						getMyTheme();
						formData.delete("file");
						
						$('#filename').val("");
						$('#themeModal').modal('toggle');	
	 				})
		        }else {
		        	swal({
						text: "변경되지 않았습니다. 다시 확인 바랍니다.",
						icon: "warning",
						button: "닫기"
					});
				}
	        }
	    });
	}
</script>