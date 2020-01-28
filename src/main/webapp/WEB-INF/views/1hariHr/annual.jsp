<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">연차 관리 </h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 3%;">
		<div class="row">
			<div class="col-md-12">
					<div class="row row-card-no-pd">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999;  ">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-calendar-alt fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">입사일</p>
												<h4 class="card-title" id="totalTA"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-history fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 연차</p>
												<h4 class="card-title" id="getTotalTime">:undefined</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-sync fa-4x" style=""></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">사용 연차</p>
												<h4 class="card-title" id="getWeekTotalTime"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px; box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-suitcase fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">남은 연차</p>
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
	
	
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
	
				<!--연차 관리  테이블 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px dashed #bcbcbc;">
					<div class="card-body">
						<h5 class="card-title">연차 사용 목록</h5>
						<div class="table-responsive">
							<table id="zero_config" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>문서번호</th>
										<th>연차시작일</th>
										<th>연차종료일</th>
										<th>사용연차</th>
										<th>승인여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>										
										<td>1</td>
										<td>2020-01-31</td>
										<td>2020-02-03</td>
										<td>2</td>
										<td>승인완료</td>
									</tr>
								</tbody>
							</table>
						</div>
	
					</div>
				</div>
				<!--데이터 테이블 끝 -->
	
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
</div>
<!-- ============================================================== -->
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