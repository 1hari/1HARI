<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
    
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

<!-- 컨텐츠 제목 -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb" style = "margin-bottom:3%;">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">개인 정보 프로필</h4>
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
				<div class="container" style ="marign-bottom:3%; background-color:#fff; border-radius:10px; box-shadow: 0 0 12px #999999;">
					<div class="row">
						<div class="col-md-12">
							<!--form 태그 시작 -->
							<form action="" id="example-form" method="post">
								<c:set var="emp" value="${requestScope.emp}" />
								<div class="row" style="margin-top: 2%;">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="empName">이름</label> 
											<input type="text" id="empName" name="empName" class="form-control" value="${emp.empName}" readonly>
										</div>
										<div class="form-group">
											<label for="empNum">사번</label> 
											<input type="text" id="empNum" name="empNum" class="form-control" value="${emp.empNum}" readonly>
										</div>
										<div class="form-group">
											<label for="birth">생년월일</label>
											<input type="text" id="birth" name="birth" class="form-control" value="${emp.birth}" readonly>
										</div>
										<div class="form-group">
											<label for="hireDate">입사일</label>
											<input type="text" id="hireDate" name="hireDate" class="form-control" value="${emp.hireDate}" readonly>
										</div>
										<div class="form-group">
											<label for="empNum">비밀번호</label>
											<span id="pwdCheck" style="color: red;"></span>
											<input type="password" id="password" name="password" class="form-control" required="required">
										</div>
										<div class="form-group">
											<label for="birth">비밀번호 확인</label>
											<span id="pwdReCheck" style="color: red;"></span>
											<input type="password" id="passwordCheck" class="form-control" required="required">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="teamCode">소속</label>
											<input type="text" class="form-control" value="${emp.teamName}" readonly>
										</div>
										<div class="form-group">
											<label for="positionCode">직책</label>
											<input type="text" class="form-control" value="${emp.positionName}" readonly>
										</div>
										<div class="form-group">
											<label for="rankCode">직급</label>
											<input type="text" class="form-control" value="${emp.rankName}" readonly>
										</div>
										<div class="form-group">
											<label for="employmentCode">재직구분</label>
											<input type="text" class="form-control" value="${emp.employmentName}" readonly>
										</div>
										<div class="form-group">
											<label for="phoneNum">핸드폰번호</label>
											<span id="phoneNumCheck" style="color: red;"></span>
											<input type="text" id="phoneNum" name="phoneNum" class="form-control" value="${emp.phoneNum}" placeholder="(-) 없이 숫자만 입력하세요." maxlength="13" required>
										</div>
										<div class="form-group">
											<label for="email">이메일</label>
											<span id="emailCheck" style="color: red;"></span>
											<input id="email" name="email" type="text" class="form-control" value="${emp.email}" required>
										</div>
									</div>									
								</div>
								<div class="form-group" align="right">
									<button type="button" id="submitButton" style ="color: #807266; background-color: #fff; border-color: #807266;" class="btn btn-success">수정하기</button>
								</div>
							</form>
							<!--폼 action 태그 끝 -->
						</div>
						<!--div= "row" 끝 -->
						<!--   <button href="#step-2" class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button> -->
					</div>
					<!-- <div class="row setup-content" id="step-1">끝 -->
				</div>
				<!--입사/퇴사 관리 end-->
			</div>
			<!--      <div class="col-12"> 끝-->

		</div>
		<!-- row 끝 -->
	</div>
	<!--container-fluid 끝  -->
</div>
<!--page-wrapper-->

<!-- 이 페이지에서 필요한  js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/mask/mask.init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/customjs/1hariMy/myInfo.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    
    
    