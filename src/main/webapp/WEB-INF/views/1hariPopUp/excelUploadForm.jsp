<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css" rel="stylesheet">
<!-- datepicker script -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	/* Excel Upload / Download를 위한 script */
	$(function() {
		$('#excelInsert').click(function() {
			$('#excelUploadForm').submit();
		})
		var icon;
		if('${requestScope.isOk}' == 'true'){
			icon = 'success';
		}else {
			icon = 'warning';
		}
		
		if('${requestScope.msg}' != ''){
			swal({
				text: "${requestScope.msg}",
				icon: icon,
				button: "닫기"
			}).then((value) => {
				window.opener.reload();		
				window.close();		
			});
		}
		
	})
	
	function doExcelUploadProcess() {
		var f = new FormData(document.getElementById('excelUploadForm'));
		$.ajax({
			url: "uploadExcelFile.hari",
			data: f,
			processData: false,
			contentType: false,
			type: "POST",
			success: function(excelData){
				let formdata = "";
				$.each(excelData, function(index, data) {
					$.each(data, function(index, element){
						
					/* document.getElementById('excelForm').innerHTML = JSON.stringify(emp.empNum); */
					formdata += '<tr><td><input type="text" name="empdto[' + index + '].empName" value="' + element.empName + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].teamCode" value="' + element.teamCode + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].rankCode" value="' + element.rankCode + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].positionCode" value="' + element.positionCode + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].employmentCode" value="' + element.employmentCode + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].birth" class="datepicker-autoclose" value="' + element.birth + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].resNum" value="' + element.resNum + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].phoneNum" value="' + element.phoneNum + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].email" value="' + element.email + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].hireDate" value="' + element.hireDate + '"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].leaveDate" value="' + element.leaveDate + '"></td>'
					})
				})
				$('#excelForm').append(formdata);
				$('.datepicker-autoclose').datepicker(
					{
						format: "yymmdd", // 생년월일 Date 형식
						autoclose: true,
						todayHighlight: true
					}
				);
				/* document.getElementById('excelForm').innerHTML = JSON.stringify(data); */
			}
		})
	}
	
</script>

<!-- 초기페이지 설정 -->

<div id="main-wrapper">
	<!-- Page wrapper  -->
	<!-- ============================================================== -->

	<!-- <div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">전자결재 문서보기</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div> -->

	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<h5 class="card-title" style="float: left;">Excel Upload</h5>
		    	
				<div class="table-responsive">
					<form id="excelUploadForm" name="insertExcelEmp" method="post" enctype="multipart/form-data"
							action="${pageContext.request.contextPath}/util/personnel/insertExcelEmp.hari">
						<div class="form-group row">
							<div class="col-md-12">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="fileInput" name="fileInput" required >
									<label class="custom-file-label" for="validatedCustomFile">파일을 선택하세요.</label>
								</div>
							</div>
						</div>
						
						<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" style="width: 12%; background-color: #20B2AA; float: right; margin-bottom: 1%;" onclick="doExcelUploadProcess()">
							올리기
						</button>
	    				<button type="button" id="excelInsert" class="btn m-t-5 btn-info btn-block waves-effect waves-light" style="width: 12%; background-color: #20B2AA; float: right; margin-bottom: 1%;">
	    					저장하기
	    				</button>
	    						
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
	<!-- 											<th>사번</th> -->
									<th>이름</th>
									<th>소속</th>
									<th>직급</th>
									<th>직책</th>
									<th>재직구분</th>
									<th>생년월일</th>
									<th>주민등록번호</th>
									<th>핸드폰번호</th>
									<th>이메일</th>
									<th>입사일</th>
									<th>퇴사일</th>
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


