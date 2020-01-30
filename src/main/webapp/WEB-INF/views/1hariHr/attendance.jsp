<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
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
			}).then((value) => {
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
			}).then((value) => {
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
				})
			})
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
			}).then((value) => {
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
				})
			}).then((value) => {
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
				})
			})
		}
	}).then((value) => {
		var getStartList;
		//이번달 출근기록 yyyy-mm-dd
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/getStartList.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
				getStartList=data
				var itemArray=document.querySelectorAll('.fc-day.fc-widget-content');
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
			}
		}).then((value) => {
			//이번달 퇴근기록 yyyy-mm-dd
			var itemArray2=document.querySelectorAll('.fc-day.fc-widget-content');
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getEndList.hari",
				type: "post",
				dataType: "json",
				success: function(getEndList) {
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
				} else if(isStart == false && isEnd==true) {
					swal("warning", "근태오류, 관리자에게 문의해주세요.", "warning")
				} else{
					swal("warning", "근태오류, 관리자에게 문의해주세요.", "warning")
				}
			}
		});
	})


});
</script>
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
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow :5px 5px #999999; border: 2px groove #999999; ">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<!-- <i class="fas fa-calendar-alt fa-3x" style ="padding-top:10px;"></i> -->
												<img src="${pageContext.request.contextPath}/resources/hari/assets/images/weather_snow.png" alt="user" class="rounded-circle" width="31">
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
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow :5px 5px #999999;  border: 2px groove #999999;">
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
							<div class="card card-stats card-round" style ="border-radius:10px;  box-shadow :5px 5px #999999; border: 2px groove #999999; ">
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
							<div class="card card-stats card-round" style ="border-radius:10px; box-shadow :5px 5px #999999;  border: 2px groove #999999;">
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
								<div class="card-body b-l calender-sidebar" style ="height:100%; border-radius:10px; box-shadow :3px 3px #999999;  border: 2px groove #999999;">
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BEGIN MODAL -->
		<div class="modal none-border" id="my-event">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							<strong>Add Event</strong>
						</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
						<button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal Add Category -->
		<div class="modal fade none-border" id="add-new-event">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							<strong>Add</strong> a category
						</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					
					<div class="modal-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<label class="control-label">Category Name</label>
									<input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
								</div>
								
								<div class="col-md-6">
									<label class="control-label">Choose Category Color</label>
									<select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
										<option value="success">Success</option>
										<option value="danger">Danger</option>
										<option value="info">Info</option>
										<option value="primary">Primary</option>
										<option value="warning">Warning</option>
										<option value="inverse">Inverse</option>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
						<button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
					</div>
					
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right sidebar -->
		<!-- ============================================================== -->
		<!-- .right-sidebar -->
		<!-- ============================================================== -->
		<!-- End Right sidebar -->
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
<script>
	/****************************************
	*       Basic Table                   *
	****************************************/
	$('#zero_config').DataTable();
</script>
<!-- this 캘린더  js 추가하기  필수!!! -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/calendar/cal-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/jquery.ui.touch-punch-improved.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/jquery-ui.min.js"></script>
