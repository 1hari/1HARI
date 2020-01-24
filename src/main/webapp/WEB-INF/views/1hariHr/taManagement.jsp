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
				<h4 class="page-title"> 근태관리 </h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	
	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!-- 사원 근태관리 테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<form id="taTable" name="taTable" method="post" enctype="multipart/form-data">
								<table id="zero_config" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>사원</th>
											<th>부서</th>
											<th>월요일</th>
											<th>화요일</th>
											<th>수요일</th>
											<th>목요일</th>
											<th>금요일</th>
											<th>토요일</th>
											<th>일요일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div>
													<p> 유재석 회장님 </p>
													<p> 주간근무시간 </p>
												</div>
											</td>
										</tr>
									</tbody>
									<tfoot>
									</tfoot>
								</table>
							</form>
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
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	/****************************************
	*       Basic Table                   *
	****************************************/
	$('#zero_config').DataTable();

	/* Excel Upload / Download를 위한 script */
	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}
	
	function excelUpload() {
		var popupUrl = "${pageContext.request.contextPath}/util/personnel/excelUpload.hari";
		var popupName = "Excel Upload";
		var popupOption = "statusber=no, scrollbar=no, menuber=no, width=900, height=500 top=270 left=530";
		
		window.open(popupUrl, popupName, popupOption);
	}
	
	function excelDownload() {
		var form = document.empTable;
		form.action = "${pageContext.request.contextPath}/util/personnel/excelDownload.hari";
		form.submit();
	}

	function excelFormDownload() {
		var form = document.empTable;
		form.action = "${pageContext.request.contextPath}/util/personnel/excelFormDownload.hari";
		form.submit();
	}

	function reload() {
		window.location.reload();
	}
</script>