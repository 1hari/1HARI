<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- 캘린더 CSS 추가함  -->
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/calendar/calendar.css" rel="stylesheet" />

<!-- 컨텐츠 제목 시작  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">근태 현황</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- 컨텐츠 제목 끝 -->

	<div class="container" style ="margin-top: 3%;">
		<div class="row">
			<div class="col-md-12">
					<div class="row row-card-no-pd">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow: 7px 7px #505050;">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-calendar-alt fa-3x" style ="padding-top:10px;"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 근무일</p>
												<h4 class="card-title" id="totalTA"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow: 7px 7px #505050; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-history fa-3x" style ="padding-top:10px;"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 근무시간</p>
												<h4 class="card-title" id="getTotalTime"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow: 7px 7px #505050;">
								<div class="card-body" >
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-sync fa-3x" style ="padding-top:10px;"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">이번주 근무시간</p>
												<h4 class="card-title" id=getWeekTotalTime></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow: 7px 7px #505050; ">
								<div class="card-body" >
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-suitcase fa-3x" style ="padding-top:10px;"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">오늘 근무시간</p>
												<h4 class="card-title" id="getWorkTime"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 끝 -->
			</div>
		</div>
	</div>

	<!--컨텐츠 내용 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid" style ="width:80%; height: 83%; marign-left:15%; marign-right:-10%;">

		<!-- ============================================================== -->
		<!-- 컨텐츠 로우 -->
		<!-- ============================================================== -->

		<div class="row" style ="width:100%; height:80%;">
			<div class="col-md-12">
				<div class="card"  style ="border-radius:10px;">


					<div class="">
						<div class="row">

							<!--캘린더 -->
							<div class="col-lg-12">
								<div class="card-body b-l calender-sidebar" style ="height:100%; border-radius:10px;  box-shadow: 7px 7px #505050;">
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
</div>

<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>

<!-- this 캘린더  js 추가하기  필수!!! -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/calendar/cal-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/jquery.ui.touch-punch-improved.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function() {
	    //총 근무일
	    $.ajax({
	        url: "${pageContext.request.contextPath}/ajax/getTotalTA.hari",
	        type: "post",
	        dataType: "json",
	        success: function(totalTA) {
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
			}
		}).then((value) => { 
			$.ajax({ //오늘 출근등록 했는지 구분
				url: "${pageContext.request.contextPath}/ajax/todayStartWorkCheck.hari",
				type: "post",
				dataType: "json",
				success: function(todayStartWorkCheck) {
					isStart=todayStartWorkCheck;
				}
			}).then((value) => {
			if(isEnd==false && isStart==true){
				//아직 퇴근등록하지 않았으면 계속 근무시간이 늘어야하기때문에 현재시간 - 출근시간 으로 계산
				$.ajax({ //해당 사원 근무시간 가져오기 - 근무시간이 없으면 'empty' 로 리턴함
					url: "${pageContext.request.contextPath}/ajax/getWorkTime.hari", //오늘 현재까지 근무시간
					type: "post",
					dataType: "text",
					success: function(getWorkTime) {
						if($.trim(getWorkTime) != "empty" ){ //근무시간이 있으면
							$('#getWorkTime').text('');
							$('#getWorkTime').append(getWorkTime);
						} else{  //근무시간이 없으면
							$('#getWorkTime').text('');
							$('#getWorkTime').append('00:00');
						}
					}
				}).then((value) => {
					//아직 퇴근등록하지 않았으면 계속 근무시간이 늘어야하기때문에 현재시간 - 출근시간 + 이번주 누적 근무시간 으로 계산
					$.ajax({ //해당 사원 근무시간 가져오기 - 근무시간이 없으면 'empty' 로 리턴함
						url: "${pageContext.request.contextPath}/ajax/getWeekTotalTime.hari", //이번주 현재까지 근무시간
						type: "post",
						dataType: "text",
						success: function(getWeekTotalTime) {
							if($.trim(getWeekTotalTime) != "empty" ){//근무시간이 있으면
								$('#getWeekTotalTime').text('');
								$('#getWeekTotalTime').append(getWeekTotalTime);
							} else{//근무시간이 없으면
								$('#getWeekTotalTime').text('');
								$('#getWeekTotalTime').append('00:00');
							}
						}
					});
				}).then((value) => {
					//아직 퇴근등록하지 않았으면 계속 근무시간이 늘어야하기때문에 현재시간 - 출근시간 + 이번달 누적 근무시간 으로 계산
					$.ajax({ //해당 사원 근무시간 가져오기 - 근무시간이 없으면 'empty' 로 리턴함
						url: "${pageContext.request.contextPath}/ajax/getTotalTime.hari",
						type: "post",
						dataType: "text",
						success: function(getTotalTime) {
							var splitTime2=getTotalTime.split(':');
							if($.trim(getTotalTime) != "empty" ){//근무시간이 있으면
								$('#getTotalTime').text('');
								$('#getTotalTime').append(splitTime2[0] + ":"+splitTime2[1]);
							} else{//근무시간이 없으면
								$('#getTotalTime').text('');
								$('#getTotalTime').append('00:00');
							}
						}
					})
				})
			} else{
				// 퇴근등록 했으면
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getTodayTotalTime.hari", // 오늘 근무시간
					type: "post",
					dataType: "text",
					success: function(getTodayTotalTime) {
						if($.trim(getTodayTotalTime) != "empty" ){//근무시간이 있으면
							$('#getWorkTime').text('');
							$('#getWorkTime').append(getTodayTotalTime);
						} else{//근무시간이 없으면
							$('#getWorkTime').text('');
							$('#getWorkTime').append('00:00');
						}
					}
				}).then((value) => {
					//퇴근 등록 후 이번주 총 근무시간
					$.ajax({
						url: "${pageContext.request.contextPath}/ajax/getWeekWorkTime.hari",
						type: "post",
						dataType: "text",
						success: function(getWeekWorkTime) {
							if($.trim(getWeekWorkTime) != "empty" ){//근무시간이 있으면
								$('#getWeekTotalTime').text('');
								$('#getWeekTotalTime').append(getWeekWorkTime);
							} else{//근무시간이 없으면
								$('#getWeekTotalTime').text('');
								$('#getWeekTotalTime').append('00:00');
							}
						}
					})
				}).then((value) => {
					//퇴근 등록 후 총 근무시간
					$.ajax({
						url: "${pageContext.request.contextPath}/ajax/getTotalWorkTime.hari",
						type: "post",
						dataType: "text",
						success: function(getTotalWorkTime) {
							var splitTime=getTotalWorkTime.split(':');
							if(getTotalWorkTime != "empty" ){//근무시간이 있으면
								$('#getTotalTime').text('');
								$('#getTotalTime').append(splitTime[0] + ':' + splitTime[1]);
							} else{//근무시간이 없으면
								$('#getTotalTime').text('');
								$('#getTotalTime').append('00:00');
							}
						}
					})
				})
			}
		}).then((value) => {
			var getStartList;
			//이번달 출근기록 yyyy-mm-dd
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getStartList.hari",//이번달 출근 및 지각 데이터
				type: "post",
				dataType: "json",
				success: function(data) {
					getStartList=data //출근한 날짜 yyyy-mm-dd 배열
					var itemArray=document.querySelectorAll('.fc-day.fc-widget-content'); //.fc-day.fc-widget-content 클래스를 가진 요소를 전부 가져와 배열로 리턴해줌 => 풀캘린더 한칸 한칸의 날짜값들
					for(var i=0; i<itemArray.length; i++){ //ex 1월 => '2020-01-01',  '2020-01-02', '2020-01-03', '2020-01-04', '2020-01-05', ....'2020-01-31',
						for(var j=0; j<getStartList.startList.length; j++){ //출근한 날짜 yyyy-mm-dd 배열
							if($(itemArray[i]).attr('data-date') == getStartList.startList[j]){ //itemArray 와 startList 날짜를 서로 비교하며 같은 날짜가 있으면 출근 스티커 부착
								$(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">출근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
							}
						}
						for(var j=0; j<getStartList.tardyList.length; j++){//지각한 날짜 yyyy-mm-dd 배열
							if($(itemArray[i]).attr('data-date') == getStartList.tardyList[j]){//itemArray 와 tardyList 날짜를 서로 비교하며 같은 날짜가 있으면 지각 스티커 부착
								$(itemArray[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-warning fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">지각</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
							}
						}
					}
				}
			}).then((value) => {
				//이번달 퇴근기록 yyyy-mm-dd
				var itemArray2=document.querySelectorAll('.fc-day.fc-widget-content'); //.fc-day.fc-widget-content 클래스를 가진 요소를 전부 가져와 배열로 리턴해줌 => 풀캘린더 한칸 한칸의 날짜값들
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getEndList.hari", //이번달 퇴근 및 결근, 연차 데이터
					type: "post",
					dataType: "json",
					success: function(getEndList) {
						for(var i=0; i<itemArray2.length; i++){
							for(var j=0; j<getEndList.endList.length; j++){
								if($(itemArray2[i]).attr('data-date') == getEndList.endList[j]){//itemArray 와 endList 날짜를 서로 비교하며 같은 날짜가 있으면 퇴근 스티커 부착
									$(itemArray2[i]).append('<a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-success fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">퇴근</span></div><div class="fc-resizer fc-end-resizer"></div></a>');
								}
							}
							for(var j=0; j<getEndList.absentList.length; j++){
								if($(itemArray2[i]).attr('data-date') == getEndList.absentList[j]){//itemArray 와 absentList 날짜를 서로 비교하며 같은 날짜가 있으면 결근 스티커 부착
									$(itemArray2[i]).empty();
									$(itemArray2[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-danger fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">결근</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
								}
							}
							for(var j=0; j<getEndList.annList.length; j++){
								if($(itemArray2[i]).attr('data-date') == getEndList.annList[j]){//itemArray 와 annList 날짜를 서로 비교하며 같은 날짜가 있으면 연차 스티커 부착
									$(itemArray2[i]).empty();
									$(itemArray2[i]).append('<br><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end bg-info fc-draggable fc-resizable"><div class="fc-content"> <span class="fc-title">연차</span></div><div class="fc-resizer fc-end-resizer"></div></a></td>');
								}
							}
						}
					}
				});
			})
		})
		})
	});
</script>

