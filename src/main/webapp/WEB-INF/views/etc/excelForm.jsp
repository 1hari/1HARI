<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title"></h4>
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
				사원 관리  테이블
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" style="float: left;">Excel Upload</h5>
				    	<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
				    			style="width: 12%; background-color: #20B2AA; float: right; margin-bottom: 1%;" 
				    			onclick="doExcelUploadProcess()">올리기</button>
						<div class="table-responsive">
							<form id="excelUploadForm" name="insertExcelEmp" method="post" enctype="multipart/form-data">
								<div class="form-group row">
									<div class="col-md-12">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="fileInput" name="fileInput" required >
											<label class="custom-file-label" for="validatedCustomFile">파일을 선택하세요.</label>
										</div>
									</div>
								</div>
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
								<div>
									<button type="submit" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
							    			style="width: 12%; background-color: #20B2AA; float: right; margin-bottom: 1%;">저장하기</button>
								</div>
							</form>
						</div>

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

	<!-- ============================================================== -->
</div>

<script type="text/javascript">
	/* Excel Upload / Download를 위한 script */
// 	function checkFileType(filePath) {
// 		var fileFormat = filePath.split(".");
// 		if (fileFormat.indexOf("xlsx") > -1) {
// 			return true;
// 		} else {
// 			return false;
// 		}
// 	}

// 	function excelUpload() {
// 		var file = $("#excelFile").val();
// 		if (file == "" || file == null) {
// 			swal({
// 				text: "파일을 선택해주세요.",
// 				icon: "warning",
// 				button: "닫기"
// 			});
// 			return false;
// 		} else if (!checkFileType(file)) {
// 			swal({
// 				text: "Excel 파일만 업로드 가능합니다.",
// 				icon: "warning",
// 				button: "닫기"
// 			});
// 			return false;
// 		}
	
// 		if (swal("업로드 하시겠습니까?")) {
// 			var options = 
// 				{
// 					url: "${pageContext.request.contextPath}/util/excelUpload.hari",
// 					type : "POST",
// 					success : function(data) {
// 						swal({
// 							text: "모든 데이터가 업로드 되었습니다.",
// 							icon: "success",
// 							button: "확인"
// 						});
// 					}
// 				};
// 			$("#excelUploadForm").ajaxSubmit(options);
// 		}
// 	}

//     function doExcelUploadProcess(){
//         var f = new FormData(document.getElementById('form1'));
//         $.ajax({
//             url: "uploadExcelFile",
//             data: f,
//             processData: false,
//             contentType: false,
//             type: "POST",
//             success: function(data){
//                 console.log(data);
//                 document.getElementById('result').innerHTML = JSON.stringify(data);
//             }
//         })
//     }
    
//     function doExcelDownloadProcess(){
//         var f = document.form1;
//         f.action = "downloadExcelFile";
//         f.submit();
//     }    function doExcelUploadProcess(){
	function doExcelUploadProcess(){
		var f = new FormData(document.getElementById('excelUploadForm'));
		$.ajax({
			url: "uploadExcelFile.hari",
			data: f,
			processData: false,
			contentType: false,
			type: "POST",
			success: function(excelData){
				console.log(excelData);
				
				let formdata = "";
				$.each(excelData, function(index, data) {
					console.log(data);
					$.each(data, function(index, element){
						
					/* document.getElementById('excelForm').innerHTML = JSON.stringify(emp.empNum); */
					formdata += '<tr><td><input type="text" name="empName[' + index + ']" value="' + element.empName + '"></td>'
								+ '<td><input type="text" name="teamCode[' + index + ']" value="' + element.teamCode + '"></td>'
								+ '<td><input type="text" name="rankCode[' + index + ']" value="' + element.rankCode + '"></td>'
								+ '<td><input type="text" name="positionCode[' + index + ']" value="' + element.positionCode + '"></td>'
								+ '<td><input type="text" name="employmentCode[' + index + ']" value="' + element.employmentCode + '"></td>'
								+ '<td><input type="text" name="birth[' + index + ']" value="' + element.birth + '"></td>'
								+ '<td><input type="text" name="resNum[' + index + ']" value="' + element.resNum + '"></td>'
								+ '<td><input type="text" name="phoneNum[' + index + ']" value="' + element.phoneNum + '"></td>'
								+ '<td><input type="text" name="email[' + index + ']" value="' + element.email + '"></td>'
								+ '<td><input type="text" name="hireDate[' + index + ']" value="' + element.hireDate + '"></td>'
								+ '<td><input type="text" name="leaveDate[' + index + ']" value="' + element.leaveDate + '"></td>'
					})
				})
				$('#excelForm').append(formdata);
				/* document.getElementById('excelForm').innerHTML = JSON.stringify(data); */
			}
		})
	}
	    
	function doExcelDownloadProcess(){
		var f = document.excelUploadForm;
		f.action = "downloadExcelFile";
		f.submit();
	}
</script>


