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
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!--사원 관리  테이블 -->

				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<table id="zero_config" class="table table-striped table-bordered">
						<form action="" id="excelForm" name="excelForm" method="post" enctype="multipart/form-data">
								<div style="text-align: right; margin-bottom: 5%;">
									<a href="empJoin.hari" style="color: white;">
										<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
												style="width: 20%; background-color: #20B2AA; margin-right: 1%;">
											사원등록
										</button>
									</a>
									<a href="excelDownload.hari" style="color: white;">
										<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
												style="width: 20%; background-color: #20B2AA; margin-right: 1%;" onclick="doExcelDownloadProcess()">
											Excel 다운로드
										</button>
									</a>
									<a href="hr_join&resign2.jsp" style="color: white;">
										<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
												style="width: 20%; background-color: #20B2AA; margin-right: 1%;" onclick="doExcelUploadProcess()">
											Excel 업로드
										</button>
									</a>
									<a href="hr_join&resign2.jsp" style="color: white;">
										<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" 
												style="width: 20%; background-color: #20B2AA; margin-right: 1%;">
											양식 받기
										</button>
									</a>
								</div>
						</form>
						<form action="" id="excelForm" name="excelForm" method="post" enctype="multipart/form-data">
								<thead>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<th>사번</th>
										<th>이름</th>
										<th>소속</th>
										<th>직급</th>
										<th>직책</th>
										<th>재직구분</th>
										<th>생년월일</th>
										<th>핸드폰번호</th>
										<th>이메일</th>
										<th>입사일</th>
										<th>정보수정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="emp" items="${requestScope.emplist}">
										<tr>
											<th>
												<label class="customcheckbox m-b-20">
													<input type="checkbox" class="listCheckbox">
													<span class="checkmark"></span>
												</label>
											</th>
											<td>${emp.empNum}</td>
											<td>${emp.empName}</td>
											<td>${emp.teamName}</td>
											<td>${emp.rankName}</td>
											<td>${emp.positionName}</td>
											<td>${emp.employmentName}</td>
											<td>${emp.birth}</td>
											<td>${emp.phoneNum}</td>
											<td>${emp.email}</td>
											<td>${emp.hireDate}</td>
											<td>
												<button type="button" class="btn m-t-5 btn-info btn-block waves-effect waves-light" style="width: 80%; background-color: #20B2AA">
													<a href="empModify.hari?empNum=${emp.empNum}" style="color: white;">수정</a>
												</button>
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
									<tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
								</form>
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
	/****************************************
	*       Basic Table                   *
	****************************************/
	$('#zero_config').DataTable();

	/* Excel Upload / Download를 위한 script */
    function doExcelUploadProcess(){
        var form = new FormData(document.getElementById('excelForm'));
        $.ajax({
            url: "uploadExcelFile",
            data: form,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(data){
                console.log(data);
                document.getElementById('result').innerHTML = JSON.stringify(data);
            }
        })
    }
    
    function doExcelDownloadProcess(){
        var form = document.excelForm;
        form.action = "downloadExcelFile";
        form.submit();
    }
</script>