<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/quill/dist/quill.snow.css">

<!--datepicker link 필수 end-->
<link href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css" rel="stylesheet">

<!--아래 3개는 사원 등록에서 필요한 js -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/quill/dist/quill.min.js"></script>
<!--필수 js 지우지 말기 -->

<style>
.stepwizard-step p {
	margin-top: 10px;
}

.stepwizard-row {
	display: table-row;
}

.stepwizard {
	display: table;
	width: 100%;
	position: relative;
}

.stepwizard-step button[disabled] {
	opacity: 1 !important;
	filter: alpha(opacity = 100) !important;
}

.stepwizard-row:before {
	top: 14px;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 100%;
	height: 1px;
	background-color: #ccc;
	z-order: 0;
}

.stepwizard-step {
	display: table-cell;
	text-align: center;
	position: relative;
}

.btn-circle {
	width: 30px;
	height: 30px;
	text-align: center;
	padding: 6px 0;
	font-size: 12px;
	line-height: 1.428571429;
	border-radius: 0px;
}
</style>
<!-- 컨텐츠 제목 -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h3 class="page-title">사원정보수정</h3>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!--컨텐츠 제목 끝 -->

	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<!-- 사원 등록 input div 시작 -->
				<div class="container" style="background-color: #ffffff;">
					<div class="row setup-content" id="step-1">
						<div class="col-xs-12">
							<div class="col-md-12">
								<div class="container">
									<div class="row">
										<!--form 태그 시작 -->
										<form action="" method="post">
											<c:set var="emp" value="${requestScope.emp}" />
											<!--왼쪽 input 태그들 -->
											<div class="col-xs-6" style="margin-top: 3%;">
												<div class="form-group">
													<label for="empName">이름</label> 
													<input type="text" id="empName" name="empName" class="form-control" value="${emp.empName}" readonly>
												</div>
												<div class="form-group">
													<label for="empNum">사번</label> 
													<input id="empNum" name="empNum" type="text" class="form-control" value="${emp.empNum}" readonly>
												</div>
												<div class="form-group">
													<label for="birth">생년월일</label>
													<input type="text" id="birth" name="birth" class="form-control" value="${emp.birth}" readonly>
												</div>
												<div class="form-group">
													<label for="email">이메일</label>
													<input type="text" id="email" name="email" class="form-control" value="${emp.email}" readonly>
												</div>
												<div class="form-group">
													<label for="phoneNum">핸드폰번호</label>
													<input type="text" id="phoneNum" name="phoneNum" class="form-control" value="${emp.phoneNum}" placeholder="010-0000-0000" required>
												</div>
											</div>
											<!--왼쪽 input 태그들 끝-->
											<!--오른쪽 input 태그들 시작 -->
											<div class="col-xs-6" style="margin-top: 3%;">
												<div class="form-group">
													<label for="teamCode">소속</label>
													<select id="teamName" name="teamName" class="form-control" style="height: 100%;" required>
														<option selected="selected">${emp.teamName}</option>
													</select>
												</div>
												<div class="form-group">
													<label for="positionCode">직책</label>
													<select id="positionName" name="positionName" class="form-control" style="height: 100%;" required>
														<option selected="selected">${emp.positionName}</option>
													</select>
												</div>
												<div class="form-group">
													<label for="rankCode">직급</label>
													<select id="rankName" name="rankName" class="form-control" style="height: 100%;" required>
														<option selected="selected">${emp.rankName}</option>
													</select>
												</div>
												<div class="form-group">
													<label for="employmentCode">재직구분</label>
													<select id="employmentName" name="employmentName" class="form-control" style="height: 100%;" required>
														<option selected="selected">${emp.employmentName}</option>
													</select>
												</div>
												<div class="form-group">
													<label for="hireDate">입사일</label>
													<input type="text" id="hireDate" name="hireDate" class="form-control mydatepicker" value="${emp.hireDate}" readonly>
													<div class="input-group-append"></div>
												</div>
												<div class="form-group">
													<label>퇴사일</label>
													<input type="text" class="form-control mydatepicker" placeholder="mm/dd/yyyy">
													<div class="input-group-append"></div>
												</div>
											</div>
											<!--오른쪽 input 태그들 끝-->
											<div class="row">
												<div class="col-xs-1"></div>
												<div class="col-xs-10">
													<input type="submit" class="form-control" value="수정" style="margin-bottom: 10%">									
												</div>
												<div class="col-xs-1"></div>
											</div>
										</form>
											<!--폼 action 태그 끝 -->
									</div>
									<!--div= "row" 끝 -->
								</div>
								<!--컨테이너 디브태그 끝 -->

								<!--   <button href="#step-2" class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button> -->
							</div>
							<!--   <div class="col-md-12"> 끝 -->
						</div>
						<!--     <div class="col-xs-12"> 끝-->
					</div>
					<!-- <div class="row setup-content" id="step-1">끝 -->
				</div>
				<!--입사/퇴사 관리 end-->
			</div>
			<!--      <div class="col-12"> 끝-->

		</div>
		<!--div= row 끝 -->
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!--    <div class="container-fluid"> 끝 -->
	<!-- ============================================================== -->

</div>
<!--page-wrapper-->
<!-- 이 페이지에서 꼭 필요한  js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/mask/mask.init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/quill/dist/quill.min.js"></script>

<script>
	/****************************************
	*      필수 테이블 1. 데이터 테이블 , 2. datepicker 제이쿼리 스크립트 *
	****************************************/
	$('#zero_config').DataTable();

	/*datepicker*/
	jQuery('.mydatepicker').datepicker();
	jQuery('#datepicker-autoclose').datepicker({
		autoclose: true,
		todayHighlight: true
	});
</script>