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
<!-- datepicker script -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">
	/* Excel Upload / Download를 위한 script */
	$(function() {
		$('#excelInsert').click(function() {
			$('#excelUploadForm').submit();
		})
		
		var icon;
		if ('${requestScope.isOk}' == 'true') {
			icon = 'success';
		} else {
			icon = 'warning';
		}
		
		if('${requestScope.msg}' != '') {
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
					formdata += '<tr>'
								+ '<td><input type="text" name="empdto[' + index + '].empName" value="' + element.empName + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].teamCode" value="' + element.teamCode + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].rankCode" value="' + element.rankCode + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].positionCode" value="' + element.positionCode + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].employmentCode" value="' + element.employmentCode + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].birth" class="datepicker-autoclose" value="' + element.birth + '" style="width: 54px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].resNum" value="' + element.resNum + '" style="width: 70px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].phoneNum" value="' + element.phoneNum + '" style="width: 100px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].email" value="' + element.email + '" style="width: 140px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].hireDate" value="' + element.hireDate + '" style="width: 80px;"></td>'
								+ '<td><input type="text" name="empdto[' + index + '].leaveDate" value="' + element.leaveDate + '" style="width: 80px;"></td>'
								+ '</tr>'
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