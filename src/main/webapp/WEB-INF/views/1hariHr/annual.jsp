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
	<c:set var="empAnn" value="${requestScope.empAnn}" />
	<div class="container" style="margin-top: 3%;">
		<div class="row">
			<div class="col-md-12">
					<div class="row row-card-no-pd">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px; box-shadow :0 0 12px #999999; ">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center" style = "padding-top:10%;">
												<i class="m-r-10 mdi mdi-calendar-check fa-3x"  style = "padding-top:15px;"></i>
											
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">입사일</p>
												<h4 class="card-title">${empAnn.hireDate}</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px;box-shadow :0 0 12px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center" style = "padding-top:10%;">
												<i class="m-r-10 mdi mdi-calendar-clock fa-3x" style = "padding-top:10px;"></i>
											
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 연차</p>
												<h4 class="card-title">${empAnn.totalAnn}</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px; box-shadow :0 0 12px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center" style = "padding-top:10%;">
												<i class="m-r-10 mdi mdi-chart-arc fa-3x" style = "padding-top:10px;"></i>
											
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">사용 연차</p>
												<h4 class="card-title">${empAnn.useAnn}</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style ="border-radius:10px; box-shadow :0 0 12px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center" style = "padding-top:10%;">
												<i class="m-r-10 mdi mdi-chemical-weapon fa-3x" style = "padding-top:20px;"></i>
										
											</div>
										</div> 
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">남은 연차</p>
												<h4 class="card-title">${empAnn.totalAnn - empAnn.useAnn}</h4>
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
<!-- Container fluid  -->
<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
	
				<!--연차 관리  테이블 -->
				<div class="card" style ="border-radius:10px; box-shadow :0 0 12px #999999; "> <!-- border : 4px groove #bcbcbc; box-shadow :4px 4px #999999; -->
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
									<c:forEach var="annUse" items="${requestScope.annUseList}">
										<tr class="signDocu" signNum="${annUse.signNum}">										
											<td>${annUse.signNum}</td>
											<td>${annUse.startDate}</td>
											<td>${annUse.endDate}</td>
											<td>${annUse.useAnn} 일</td>
											<td>
												<c:choose>
													<c:when test="${annUse.isSign == 0}">
														미승인
													</c:when>
													<c:when test="${annUse.isSign == 1}">
														승인완료
													</c:when>												
												</c:choose>
											</td>
										</tr>
									</c:forEach>
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

<script type="text/javascript">
	/* DataTables */
	$('#zero_config').DataTable();
	
	//문서 클릭
	$(".signDocu").click(function(){
		//console.log($(this).attr("signNum"));
		let openUrl = root + "/1hariSign/signDocuView.hari?signNum="+$(this).attr("signNum");
		//console.log(openUrl);
		open(openUrl,"전자결재","statusber=no,menuber=no, width=850, height=800");
	});//문서 클릭
</script>

