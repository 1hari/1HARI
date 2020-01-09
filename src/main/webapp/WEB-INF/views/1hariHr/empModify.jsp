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
				<h4 class="page-title">사원 정보 수정</h4>
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
				<div class="container"
					style="background-color: #ffffff; margin-top: 8%;">
					
						<div class="row setup-content" id="step-1">
							<div class="col-xs-12">
								<div class="col-md-12">

									<div class="container">
										<div class="row">
											<!--form 태그 시작 -->
											<form action="empModify1.hari" mehtod="post">
												
												<!--왼쪽 input 태그들 -->
												<div class="col-xs-6">
													<div class="form-group">
														<c:set var="emp" value="${requestScope.emp}"/>
														<c:set var="team" value="${requestScope.team}"/>
														
														<label for="firstname" style="margin-top: 8%;">소속</label>
														
														<%-- <input type="text" value="${emp.teamName }" id="empNum" name="empNum" class="form-control" placeholder="소속 번호" required=""> --%>
														<select id="teamName" name="teamName" class="form-control" placeholder="소속 번호" required="" style="height: 1000%;"">
														<option>${emp.teamName }</option> 
												 		<%-- <option>${team.teamName }</option> --%>
														<option>1002</option>
														<option>1003</option> 
														
														</select>
														
													</div>
													
													<div class="form-group">
														<label for="lastname" style="margin-top: 1%;">직책</label>
										 				<select type="text" class="form-control" placeholder="직책 번호" required="" style="height: 150%;">
															<option>${emp.positionName }</option>
															<option>2</option>
															<option>3</option>
														
														</select> 
														
														
													</div>

													<div class="form-group">
														<label for="AddressLine1" style="margin-top: 1%;">직급</label>
														<select type="text" class="form-control" placeholder="직급 번호" required="" style="height: 150%;">
														<option>${emp.rankName }</option>
															<option>2</option>
															<option>3</option>
														</select>
													</div>
													
													<div class="form-group">
														<label for="Address Line 1" style="margin-top: 1%;">재직 구분</label>
														<select type="text" class="form-control" placeholder="직책 번호" required="" style="height: 150%;">
														<option>${emp.employmentName }</option>
															<option>2</option>
															<option>3</option>
														</select>
													</div>
													
													<div class="form-group">
														<label for="Address Line 1" style="margin-top: 1%;">이름 </label>
														<input type="text" value="${emp.empName }" class="form-control" placeholder="이름" required="" style="margin-bottom: 10%" readonly>
													</div>
													
												</div>
												<!--왼쪽 input 태그들 끝-->
												<!--오른쪽 input 태그들 시작 -->
												<div class="col-xs-5">

													<div class="input-group">
														<label style="margin-top: 9%;">생년 월일 </label>
														<input type="text" value="${emp.birth }" class="form-control" placeholder="mm/dd/yyyy" readonly>
														<div class="input-group-append"></div>
													</div>

													<div class="form-group">
														<label for="State" style="margin-top: 1%;">핸드폰 번호</label> <br>
														<input type="text" value="${emp.phoneNum }" style="width: 32%; display: inline;" class="form-control" placeholder="010" required="">
														<input type="text" style="width: 32%; display: inline;" class="form-control" placeholder="" required="">
														<input type="text" style="width: 32%; display: inline-block;" class="form-control" placeholder="" required="">
													</div>
													<!--
						                                상위 선택자에 text-align:center를 넣고,
						                                하위 선택자 중 , 좌측 정렬 되어야 할 선택자에 display:inline 을 적용,
						                                우측 정렬 되어야 할 선택자에 display:inline-block 을 적용시키면 해결된다.
						
						
						                                출처: https://biju.tistory.com/317 [에헤라디야~]-->
																			<!-- <div class="form-group">
									                    <label for="zip" style = "margin-top:1%;">주민번호</label>
									                    <br>
									                    <input type="text" style = "width:49%; display:inline;" class="form-control" id="zip" placeholder="주민 번호" required="">
									                    <input type="password"   style = "width:49%;  display:inline-block;"  class="form-control" id="zip" placeholder="뒷자리" required="">
									                    </div> 
								                	-->
													<div class="form-group">
														<%-- <c:forTokens  var="email1" items="${emp.email }" delims="@"> --%>
														<%-- <c:set var="emp" var="email1" items="${emp.email }" delims="@"/>
														<c:forEach var="email2" begin="0" end="1">
														    <p><c:out value="${i}" /></p> --%>
														<label for="zip">이메일 </label> <br>
														<input type="text" <c:out value="${emp.email }" /> style="width: 49%; display: inline;" class="form-control" placeholder="이메일" required="" readonly>
														<span type="text" style="width: 49%; display: inline-block;" placeholder="@gmail.com" required="">@gmail.com</span>
														<%-- </c:forEach> --%>

													</div>
														
													<div class="input-group">
														<label>입사일</label>
														<input type="text" value="${emp.hireDate }" class="form-control" placeholder="mm/dd/yyyy" readonly>
														<div class="input-group-append"></div>
													</div>

													<div class="input-group">
														<label>퇴사일</label>
														<input type="text" class="form-control mydatepicker" placeholder="mm/dd/yyyy">
														<div class="input-group-append"></div>
													</div>
														
														
												
												</div>
												<!--오른쪽 input 태그들 끝-->
													<input type="submit" class="form-control" value="수정" style="margin-bottom: 10%">									
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