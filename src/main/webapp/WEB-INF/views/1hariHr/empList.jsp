<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Page wrapper -->
<!-- ============================================================== -->
<div class="page-wrapper" >
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">입사/ 퇴사 관리</h4>
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

				<!--사원 관리  테이블 -->

				<div class="card" style ="border-radius:10px; box-shadow :7px 7px #505050; ">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<div class="table-responsive">

							<div style="text-align: right; margin-bottom: 3%;">
								<a href="empJoin.hari" style="color: white;">
									<button type="button" class="btn-success" 
											style="width: 12%; margin-right: 1%; border-radius:8px; box-shadow :0 0 12px #807266; font-weight: bold; font-size:medium; color: #000000; background-color:white; ">										사원등록&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-lead-pencil"></i>
									</button>
								</a>
								<a href="javascript:excelDownload()" style="color: white;">
									<button type="button" class="btn-success" 
											style="width: 12%; background-color: #20B2AA; margin-right: 1%; box-shadow :0 0 12px #999999; border-radius:8px;  font-weight: bold; font-size:medium; color: #000000; background-color:white; ">
										Excel 다운로드&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-briefcase-download"></i>
									</button>
								</a>
								<a href="javascript:excelUpload()" style="color: white;">
									<button type="button" class="btn-success" 
											style="width: 12%; background-color: #20B2AA; margin-right: 1%;  box-shadow :0 0 12px #999999; border-radius:8px;  font-weight: bold; font-size:medium; color: #000000; background-color:white; ">
										Excel 업로드&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-briefcase-upload"></i>
									</button>
								</a>
								<a href="javascript:excelFormDownload()" style="color: white;">
									<button type="button" class="btn-success" 
											style="width: 12%; background-color: #20B2AA; margin-right: 1%; box-shadow :0 0 12px #999999; border-radius:8px; font-weight: bold; font-size:medium; color: #000000; background-color:white; ">
										양식 받기&nbsp;&nbsp;&nbsp;<i class="m-r-10 mdi mdi-camera-party-mode"></i>
									</button>
								</a>
							</div>
<!-- 							<div style="text-align: right; margin-bottom: 1%;"> -->
<!-- 								<input type="file" id="excelFile" name="excelFile" style="width: 300px;"> -->
<!-- 								<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light"  -->
<!-- 										id="uploadExcel" style="width: 20%; background-color: #20B2AA; margin-right: 1%;" onclick="excelUpload()">Excel 업로드 -->
<!-- 								</button> -->
<!-- 							</div> -->
							<form id="empTable" name="empTable" method="post" enctype="multipart/form-data">
								<table id="zero_config" class="table table-striped table-bordered">
									<thead>
										<tr>
	<!-- 										<th> -->
	<!-- 											<label class="customcheckbox m-b-20"> -->
	<!-- 												<input type="checkbox" class="listCheckbox"> -->
	<!-- 												<span class="checkmark"></span> -->
	<!-- 											</label> -->
	<!-- 										</th> -->
											<th>사번</th>
											<th>이름</th>
											<th>소속</th>
											<th>직급</th>
											<th>직책</th>
											<th>재직구분</th>
	<!-- 										<th>권한</th> -->
											<th>입사일</th>
											<th>퇴사일</th>
											<th>정보수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="emp" items="${requestScope.emplist}">
											<tr>
	<!-- 											<th> -->
	<!-- 												<label class="customcheckbox m-b-20"> -->
	<!-- 													<input type="checkbox" class="listCheckbox"> -->
	<!-- 													<span class="checkmark"></span> -->
	<!-- 												</label> -->
	<!-- 											</th> -->
												<td>${emp.empNum}</td>
												<td>${emp.empName}</td>
												<td>${emp.teamName}</td>
												<td>${emp.rankName}</td>
												<td>${emp.positionName}</td>
												<td>${emp.employmentName}</td>
	<%-- 											<td>${emp.roleDSCR}</td> --%>
												<td>${emp.hireDate}</td>
												<td>${emp.leaveDate}</td>
												<td style="text-align: center;">
													<a href="empModify.hari?empNum=${emp.empNum}" style="color: white;">
														<button type="button" class="btn-success" 
																style="width: 50%; height:20%; background-color: #20B2AA; margin-right: 1%; box-shadow :0 0 12px #999999; border-radius:10px;  font-weight: bold; font-size:medium; color: #000000; background-color:white; ">
															수정
														<i class="m-r-10 mdi mdi-eraser-variant"></i></button>
													</a>
												</td>
												<!-- <td>
													<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" style="width: 80%; background-color: #20B2AA">
														<a href="#" style="color: white;">삭제</a>
													</button>
												</td> -->
											</tr>
										</c:forEach>
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

<script type="text/javascript">
	/* DataTables */
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
		var popupOption = "statusber=no, scrollbar=no, menuber=no, width=900, height=750 top=10 left=530";
		
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