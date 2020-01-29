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
