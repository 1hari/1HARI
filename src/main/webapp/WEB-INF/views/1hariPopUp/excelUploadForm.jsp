<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- 다채 사랑 폰트  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/stylesheetlove.css">
<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css" rel="stylesheet">


<!-- 초기페이지 설정 -->

<div id="main-wrapper">
	<!-- Page wrapper  -->
	<!-- ============================================================== -->
	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<h5 class="card-title" style="float: left; font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:x-large; font-weight:bold;">Excel Upload</h5>
				<div class="table-responsive">
					<form id="excelUploadForm" name="insertExcelEmp" method="post" enctype="multipart/form-data"
							action="${pageContext.request.contextPath}/util/personnel/insertExcelEmp.hari">
						<div class="form-group row">
							<div class="col-md-12">
								<div class="custom-file" >
									<input type="file" class="custom-file-input" id="fileInput" name="fileInput" required  style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:#807266; border: 2px solid #807266;" >
									<label class="custom-file-label" for="validatedCustomFile" style = " background-color:white; color:black; font-family: 'Nanum DaCaeSaRang'; border: 2px solid #807266;">파일을 선택하세요.</label>
								</div>
							</div>
						</div>
						<button type="button" id="excelInsert" class="btn btn-success" style= "width: 10%; background-color: white; margin-left: 75%; color:#000000;font-family: 'Nanum DaCaeSaRang';">
	    					저장하기
	    				</button>
						<button type="button" class="btn btn-success" style="width: 10%; background-color: white; color:#000000;font-family: 'Nanum DaCaeSaRang'; " onclick="doExcelUploadProcess()">
							올리기
						</button> <!-- "btn m-t-5 btn-info btn-block waves-effect waves-light -->
	    			
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
	<!-- 											<th>사번</th> -->
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">이름</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">소속</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">직급</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">직책</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">재직구분</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">생년월일</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">주민등록번호</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">핸드폰번호</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">이메일</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">입사일</th>
									<th style = "font-family: 'Nanum DaCaeSaRang'; color:black; background-color:white; font-size:medium; font-weight:bold;">퇴사일</th>
								</tr>
							</thead>
							<tbody id="excelForm">
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
</div>
<script src="${pageContext.request.contextPath}/resources/hari/customjs/1hariPay/excelUploadForm.js"></script>
<!-- datepicker script -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
