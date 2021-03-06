<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">양식 관리</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	
	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid" style ="margin-top: 3%;">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!--양식 관리  테이블 -->

				<div class="card"  style=" border-radius:10px; box-shadow :7px 7px #505050;">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<div style="text-align: right; margin-bottom: 2%;">
								<a href="formInsert.hari" style="color: white;">
									<button type="button" class="btn-success" style="width: 10%; background-color: #20B2AA; margin-right: 1%;  box-shadow :0 0 12px #999999; border-radius:10px; font-weight: bold; font-size:medium; color: #000000; background-color:white;">
									양식 등록&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-lead-pencil"></i>
									</button>
								</a>
							</div>
							<table id="zero_config" class="table table-striped table-bordered">
								<thead>
									<tr>										
										<th>양식명</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${requestScope.formList != '[]'}">
											<c:forEach var="form" items="${requestScope.formList}">
												<tr>
													<td>${form.signFormFormName}</td>
													<td>
														<c:if test="${form.signFormCode != 0}"> <!-- 연차신청서 삭제불가 -->
															<a href="formDelete.hari?signFormCode=${form.signFormCode}" style="color: white;">
																<button type="button" class="btn-success" style="width:20%; background-color: #20B2AA; margin-right: 1%;   box-shadow :0 0 12px #999999; border-radius:8px; font-weight: bold; font-size:small; color: #000000; background-color:white;">
																	삭제&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-delete"></i>
																</button>
															</a>
														</c:if>
													</td>
												</tr>
											</c:forEach> 
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3" style="text-align: center">양식이 없습니다.</td>
											</tr>
										</c:otherwise>									
									</c:choose>
									
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
	<!-- ============================================================== -->

	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>

<script>
	$(function(){
		var icon;
		if('${reqiestScope.isOk}' == 'true'){
			icon = 'success';
		}else {
			icon = 'warning';
		}

		if('${requestScope.msg}' != ''){
			swal({
				text: "${requestScope.msg}",
				icon: icon,
				button: "닫기"
			});
		}
		
		/****************************************
		*       Basic Table                   *
		****************************************/
		$('#zero_config').DataTable();	
	});
</script>