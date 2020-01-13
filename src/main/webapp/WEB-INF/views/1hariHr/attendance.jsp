<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//잠깐 스탑...//////////////////////////////////////////////////////////////////////////////////////
// 	//javascript new Date() 를 mysql 형식으로 바꾸기
// 	function date_to_str(format)
// 	{
// 	    var year = format.getFullYear();
// 	    var month = format.getMonth() + 1;
// 	    if(month<10) month = '0' + month;
// 	    var date = format.getDate();
// 	    if(date<10) date = '0' + date;
// 	    var hour = format.getHours();
// 	    if(hour<10) hour = '0' + hour;
// 	    var min = format.getMinutes();
// 	    if(min<10) min = '0' + min;
// 	    var sec = format.getSeconds();
// 	    if(sec<10) sec = '0' + sec;
// 	    return hour + ":" + min + ":" + sec;
// 	}
	
// 	var todayWorkTime;
// 	var currTime;
// 	console.log(currTime);

// 	//오늘 일한시간 구하기
// 	$.ajax({
// 		url: "${pageContext.request.contextPath}/ajax/getStartWorkTime.hari",
// 		type: "post",
// 		dataType: "json",
// 		success: function(startWorkTime) {
// 			//퇴근근기록이 있으면 true, 없으면 false
// 			startWorkTime = new Date(startWorkTime);
// 			console.log(startWorkTime);
// 			startWorkTime = date_to_str(startWorkTime);
// 			console.log(startWorkTime);
// 			console.log(date_to_str(new Date()));
// 			console.log(date_to_str(new Date()) - startWorkTime);
// 		}
// 	})
	//오늘 퇴근기록 체크
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTotalTA.hari",
		type: "post",
		dataType: "json",
		success: function(totalTA) {
			$('#totalTA').append(totalTA);
		}
	})
	
// 	$.ajax({
// 		url: "${pageContext.request.contextPath}/ajax/getWeekTotalTime.hari",
// 		type: "post",
// 		dataType: "json",
// 		success: function(weekTotalTime) {
// 			$('#weekTotalTime').append(weekTotalTime);
// 			console.log(weekTotalTime);
// 		}
// 	})
	
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax/getTodayTotalTime.hari",
		type: "post",
		dataType: "json",
		success: function(todayTotalTime) {
			$('#todayTotalTime').append(todayTotalTime);
			console.log(todayTotalTime);
		}
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
				<h4 class="page-title">근태 관리</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- 컨텐츠 제목 끝 -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- <div class="card">
					<table style="text-align: center;">
						<th>
							<tr>
								<th>총 근무일수</th>
								<th>총 근무 시간</th>
								<th>총 근무 시간</th>
								<th>총 근무 시간</th>
	
							</tr>
							<tr>
								<td>dd</td>
								<td>dd</td>
								<td>dd</td>
								<td>dd</td>
							</tr>
						</th>
					</table>
				</div>
	 -->
				<div class="row row-card-no-pd">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="flaticon-graph"></i>
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
							<div class="card card-stats card-round">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="flaticon-coins text-success"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 근무시간</p>
												<h4 class="card-title">1,345</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="flaticon-error text-danger"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">이번주 근무시간</p>
												<h4 class="card-title" id="weekTotalTime">23</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="flaticon-twitter text-primary"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">오늘 근무시간</p>
												<h4 class="card-title">45</h4>
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
	<div class="container-fluid">

		<!-- ============================================================== -->
		<!-- 컨텐츠 로우 -->
		<!-- ============================================================== -->

		<div class="row">
			<div class="col-md-11">
				<div class="card">


					<div class="">
						<div class="row">
							<div class="col-lg-3 border-right p-r-0">
								<div class="card-body border-bottom">
									<h4 class="card-title m-t-10">Drag & Drop Event</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-12">
											<div id="calendar-events" class="">
												<div class="calendar-events m-b-20" data-class="bg-info">
													<i class="fa fa-circle text-info m-r-10"></i>Event One
												</div>
												<div class="calendar-events m-b-20" data-class="bg-success">
													<i class="fa fa-circle text-success m-r-10"></i> Event Two
												</div>
												<div class="calendar-events m-b-20" data-class="bg-danger">
													<i class="fa fa-circle text-danger m-r-10"></i>Event Three
												</div>
												<div class="calendar-events m-b-20" data-class="bg-warning">
													<i class="fa fa-circle text-warning m-r-10"></i>Event Four
												</div>
											</div>
											
											<!-- checkbox -->
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="drop-remove">
													<label class="custom-control-label" for="drop-remove">Remove after drop</label>
											</div>
											<a href="javascript:void(0)" data-toggle="modal" data-target="#add-new-event" class="btn m-t-20 btn-info btn-block waves-effect waves-light">
												<i class="ti-plus"></i> Add New Event
											</a>
										</div>
									</div>
								</div>
							</div>

							<!--캘린더 -->
							<div class="col-lg-9">
								<div class="card-body b-l calender-sidebar" style="width: 100%; height: 50%;">
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