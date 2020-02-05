<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

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
				<h4 class="page-title">사원정보수정</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!--컨텐츠 제목 끝 -->

	<!-- ============================================================== -->
	<div class="container-fluid" style= "margin-top:3%;">
	
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="container" style ="width:60%; border-radius:10px;  box-shadow :7px 7px #505050;">
					<div class="row setup-content" id="step-1">
						<div class="col-md-12">
							<!--form 태그 시작 -->
							<form action="" method="post">
								<c:set var="emp" value="${requestScope.emp}" />
								<div class="col-sm-12" style="margin-top: 3%;">
									<div class="form-group">
										<label for="empName">이름</label> 
										<input type="text" id="empName" name="empName" class="form-control" value="${emp.empName}" readonly style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="empNum">사번</label> 
										<input  type="text" id="empNum" name="empNum" class="form-control" value="${emp.empNum}" readonly style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="birth">생년월일</label>
										<input type="text" id="birth" name="birth" class="form-control" value="${emp.birth}" readonly style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="email">이메일</label>
										<input type="text" id="email" name="email" class="form-control" value="${emp.email}" readonly style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="phoneNum">핸드폰번호</label>
										<span class="checkPhoneNum" style="color: red;"></span>
										<input id="phoneNum" name="phoneNum" type="text" class="required form-control" value="${emp.phoneNum}" maxlength="13" placeholder="(-) 없이 숫자만 입력하세요" style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="hireDate">입사일</label>
										<input type="text" id="hireDate" name="hireDate" class="form-control" value="${emp.hireDate}" readonly style =" border-radius:10px; border:2px solid #807266">
									</div>
									<div class="form-group">
										<label for="teamCode">소속</label>
										<select id="teamSelect" name="teamCode" class="form-control" style="height: 100%;  border-radius:10px; border:2px solid #807266" required>
										</select>
									</div>
									<div class="form-group">
										<label for="positionCode">직책</label>
										<select id="positionSelect" name="positionCode" class="form-control" style="height: 100%;  border-radius:10px; border:2px solid #807266" required>
										</select>
									</div>
									<div class="form-group">
										<label for="rankCode">직급</label>
										<select id="rankSelect" name="rankCode" class="form-control" style="height: 100%;  border-radius:10px; border:2px solid #807266" required>
										</select>
									</div>
									<div class="form-group">
										<label for="employmentCode">재직구분</label>
										<select id="employmentSelect" name="employmentCode" class="form-control" style="height: 100%;  border-radius:10px; border:2px solid #807266" required>
										</select>
									</div>
									<div class="form-group" id="leaveDateDiv" style="display: none;">
										<label>퇴사일</label>
										<input type="text" id="leaveDate" name="leaveDate" class="form-control leavedatepicker" value="${emp.leaveDate}" placeholder="yyyy-mm-dd">
									</div>
									<se:authorize access="hasRole('ROLE_ADMIN')">
	 									<div class="form-group">
	 										<label for="roleName">권한</label>
	 										<select id="roleSelect" name="roleName" class="form-control" style="height: 100%;  border-radius:10px; border:2px solid #807266" required>
	 										</select>
	 									</div>
									</se:authorize>
									<div class="form-group" align="right">
										<button type="submit" style ="color: #000000; background-color: #fff; border-color: #807266;" class="btn btn-success">수정하기</button>
									</div>
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
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/mask/mask.init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/locales/bootstrap-datepicker.ko.min.js"></script>

<script type="text/javascript">
	/* datepicker */
	//입사일
	var hireDate = $('#hireDate').val();
	
	//퇴사일은 입사일 이후부터 설정가능
	hireDate=moment(hireDate, "YYYY-MM-DD").add('days',1).format("YYYY-MM-DD");
	$('.leavedatepicker').datepicker(
		{
			format: "yyyy-mm-dd", // 입사일 Date 형식
			autoclose: true,
			todayHighlight: true,
			startDate :hireDate, 
			language: "ko"
		}
	);
	
	$(function() {
		$('#employmentSelect').change(function(){
			var employmentValue = $('#employmentSelect').val();
			
			if (employmentValue != 5003) {
				$('#leaveDateDiv').attr("style", "display: none")
			} else {
				$('#leaveDateDiv').attr("style", "display: block")
			}
		});
		<!-- 소속코드, 직책코드, 직급코드, 재직구분 Select Box -->
		$.ajax({ // 소속코드 비동기 가져오기
			url: "${pageContext.request.contextPath}/ajax/getTeamCode.hari",
			type: "post",
			dataType: "json",
			success: function(teamCodes) {
				let team = "";
				$.each(teamCodes, function(index, element) {
					if (${emp.teamCode} == element.teamCode) {
						team += '<option value="' + element.teamCode + '" selected>' + element.teamName + '</option>';
					} else {
						team += '<option value="' + element.teamCode + '">' + element.teamName + '</option>';
					}
				})
				$("#teamSelect").append(team);
			}
		});
	
		$.ajax({ // 직책코드 비동기 가져오기
			url: "${pageContext.request.contextPath}/ajax/getPositionCode.hari",
			type: "post",
			dataType: "json",
			success: function(positionCodes) {
				let position = "";
				$.each(positionCodes, function(index, element) {
					if (${emp.positionCode} == element.positionCode) {
						position += '<option value="' + element.positionCode + '" selected>' + element.positionName + '</option>';
					} else {
						position += '<option value="' + element.positionCode + '">' + element.positionName + '</option>';
					}
				})
				$("#positionSelect").append(position);
			}
		});
	
		$.ajax({ // 직급코드 비동기 가져오기
			url: "${pageContext.request.contextPath}/ajax/getRankCode.hari",
			type: "post",
			dataType: "json",
			success: function(rankCodes) {
				let rank = "";
				$.each(rankCodes, function(index, element) {
					if (${emp.rankCode} == element.rankCode) {
						rank += '<option value="' + element.rankCode + '" selected>' + element.rankName + '</option>';
					} else {
						rank += '<option value="' + element.rankCode + '">' + element.rankName + '</option>';
					}
				})
				$("#rankSelect").append(rank);
			}
		});
	
		$.ajax({ // 재직구분코드 비동기 가져오기
			url: "${pageContext.request.contextPath}/ajax/getEmploymentCode.hari",
			type: "post",
			dataType: "json",
			success: function(employmentCodes) {
				let employment = "";
				$.each(employmentCodes, function(index, element) {
					if (${emp.employmentCode} == element.employmentCode) {
						employment += '<option value="' + element.employmentCode + '" selected>' + element.employmentName + '</option>';
					} else {
						employment += '<option value="' + element.employmentCode + '">' + element.employmentName + '</option>';
					}
				})
				$("#employmentSelect").append(employment);

				if ($('#employmentSelect').val() == 5003) { // 재직구분이 퇴직인 사원정보수정으로 들어오면
					$('#leaveDateDiv').attr("style", "display: block")
				}

			}
		});
	
		$.ajax({ // 권한 비동기 가져오기
			url: "${pageContext.request.contextPath}/ajax/getRole.hari",
			type: "post",
			dataType: "json",
			success: function(Roles) {
				let role = "";
				$.each(Roles, function(index, element) {
					if ('${emp.roleName}' == element.roleName) {
						role += '<option value="' + element.roleName + '" selected>' + element.roleDSCR + '</option>';
					} else {
						role += '<option value="' + element.roleName + '">' + element.roleDSCR + '</option>';
					}
				})
				$("#roleSelect").append(role);
			}
		});

		var phoneReg = /^01[016789]-\d{3,4}-\d{4}$/; // 핸드폰번호 정규표현식
		
		/* 핸드폰번호 입력 시 자동 (-) 삽입  */
		$('#phoneNum').keyup(function() {
			var number = this.value.replace(/[^0-9]/g, "");
			var phone = "";

			if (number.length < 4) {
				return number;
			} else if(number.length < 7) {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3);
			} else if(number.length < 11) {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 3);
				phone += "-";
				phone += number.substr(6);
			} else {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 4);
				phone += "-";
				phone += number.substr(7);
			}
			this.value = phone;
			
			if (phoneReg.test($('#phoneNum').val())) { // 정규표현식 유효성 검사
				$('.checkPhoneNum').text(""); // 정규표현식과 일치하면 아무 text를 출력하지 않음
			} else { // 정규표현식과 일치하지 않으면
				$('.checkPhoneNum').text("핸드폰번호 형식이 잘못되었습니다.");
			}
		})
	});
</script>


