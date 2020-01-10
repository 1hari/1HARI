<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- 사원등록 step by step을 위해 필요한 css --> 
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-steps/jquery.steps.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-steps/steps.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/quill/dist/quill.snow.css">

<!--datepicker link 필수 end-->
<link href="${pageContext.request.contextPath}/resources/hari/dist/css/style.min.css" rel="stylesheet">

<!--아래 사원 등록에서 필요한 js -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
				<h4 class="page-title">사원 등록</h4>
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
		<div class="card">
			<div class="card-body wizard-content">
				<h6 class="card-subtitle"></h6>
				<form id="example-form" action="" class="m-t-40" name="joinform" method="post">
					<div>
						<h3>사원 정보</h3>
						<section>
							<div>
								<label for="empName" style="margin-top: 10px; margin-bottom: 0px;">이름</label> 
								<input id="empName" name="empName" type="text" class="required form-control"> 
							</div>
							<div class="input-group">
								<label for="birthFull" style="margin-top: 10px; margin-bottom: 0px;">생년월일</label> 
								<input type="text" id="birth" name="birth" class="form-control datepicker-autoclose" placeholder="yymmdd">
								<div class="input-group-append"></div>
							</div>
							<div>
								<label for="phoneNum" style="margin-top: 10px; margin-bottom: 0px;">핸드폰번호</label> 
								<input id="phoneNum" name="phoneNum" type="text" class="required form-control"> 
							</div>
							<div>
								<label for="resNum" style="margin-top: 10px; margin-bottom: 0px;">주민등록번호</label>
								<button type="button" class="btn btn-outline-success" style="padding-top: 0px; padding-bottom: 0px;" onclick="CheckForm()">확인</button><br>
								<input type="password" id="resNum" name="resNum" class="form-control" maxlength="7" placeholder="주민등록번호 뒷자리">
							</div>
							<div>
								<label for="email" style="margin-top: 10px; margin-bottom: 0px;">이메일</label><br>
								<input id="email" name="email" type="text" class="form-control" style="width: 50%; display: inline;">
								<input type="text" id="gmail" name="gmail" class="required form-control" style="width: 49%; display: inline;" value="@gmail.com" readonly="readonly">
							</div>
						</section>

						<h3>재직 정보</h3>
						<section>
							<label for="teamCode">소속</label> 
							<select class="required form-control" id="teamSelect" name="teamCode" style="height: 300%; margin-bottom: 1%;">
								<option hidden>소속을 선택하세요</option>
							</select> 
							
							<label for="positionCode">직책</label> 
							<select class="required form-control" id="positionSelect" name="positionCode" style="height: 300%; margin-bottom: 1%;">
								<option hidden>직책을 선택하세요</option>
							</select> 
							
							<label for="rankcode">직급</label> 
							<select class="required form-control" id="rankSelect" name="rankCode" style="height: 300%; margin-bottom: 1%;">
								<option hidden>직급을 선택하세요</option>
							</select> 
							
							<label for="employmentcode">재직구분</label> 
							<select class="required form-control" id="employmentSelect" name="employmentCode" style="height: 300%; margin-bottom: 1%;">
								<option hidden>재직 유형을 선택하세요</option>
							</select>
							<div class="input-group">
								<label for="hireDate" style="margin-top: 10px; margin-bottom: 0px;">입사일</label>
								<input type="text" id="hireDate" name="hireDate" class="form-control mydatepicker" placeholder="yyyy-mm-dd">
								<div class="input-group-append"></div>
							</div>
						</section>

						<h3>Finish</h3>
						<section>
							<input id="acceptTerms" name="acceptTerms" type="checkbox" class="required"> <label for="acceptTerms">I agree with the Terms and Conditions.</label>
						</section>
					</div>
				</form>
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

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
/****************************************
*      필수 테이블 1. 데이터 테이블 , 2. datepicker 제이쿼리 스크립트 *
****************************************/
/*datepicker*/
$(function() {
	$('.mydatepicker').datepicker(
		{
			format: "yyyy-mm-dd", // 입사일 Date 형식
			autoclose: true,
			todayHighlight: true
		}
	);
	
	$('.datepicker-autoclose').datepicker(
		{
			format: "yymmdd", // 생년월일 Date 형식
			autoclose: true,
			todayHighlight: true
		}
	);

	<!-- 소속코드, 직책코드, 직급코드, 재직구분 Select Box -->
	$.ajax({ // 소속코드 비동기 가져오기
		url: "${pageContext.request.contextPath}/ajax/getTeamCode.hari",
		type: "post",
		dataType: "json",
		success: function(teamCodes) {
			let team = "";
			$.each(teamCodes, function(index, element) {
				team += '<option value="' + element.teamCode + '">' + element.teamName + '</option>';
				console.log(team);
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
				position += '<option value="' + element.positionCode + '">' + element.positionName + '</option>';
				console.log(position);
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
				rank += '<option value="' + element.rankCode + '">' + element.rankName + '</option>';
				console.log(position);
			})
			$("#rankSelect").append(rank);
		}
	});

	$.ajax({ // 직책코드 비동기 가져오기
		url: "${pageContext.request.contextPath}/ajax/getEmploymentCode.hari",
		type: "post",
		dataType: "json",
		success: function(employmentCodes) {
			let employment = "";
			$.each(employmentCodes, function(index, element) {
				employment += '<option value="' + element.employmentCode + '">' + element.employmentName + '</option>';
				console.log(employment);
			})
			$("#employmentSelect").append(employment);
		}
	});
});
</script>
<!-- this page js , 1단계 2단계 3단계 제출 구성 쿼리 필수! 지우지 마세요 -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-steps/build/jquery.steps.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/jquery-validation/dist/jquery.validate.min.js"></script>

    
    
<script>
    // Basic Example with form
	var form = $("#example-form");
	form.validate({
		errorPlacement : function errorPlacement(error, element) {
			element.before(error);
		},
		rules : {
			confirm : {
				equalTo : "#password"
			}
		}
	});

	form.children("div").steps({
		headerTag : "h3",
		bodyTag : "section",
		transitionEffect : "slideLeft",
		onStepChanging : function(event, currentIndex, newIndex) {
			form.validate().settings.ignore = ":disabled,:hidden";
			return form.valid();
		},
		onFinishing : function(event, currentIndex) {
			form.validate().settings.ignore = ":disabled";
			return form.valid();
		},
		onFinished : function(event, currentIndex) {
			alert("Submitted!");
		}
	});
</script>

<!-- 주민등록번호 유효성 체크 -->
<script>
	function CheckForm() {
	
		var birthday = joinform.birth.value;
		var regNum = joinform.resNum.value;
		var SUM = 0;
	
		for (i = 0; i < birthday.length; i++) // 주민등록번호 1 ~ 6 자리까지의 처리
		{
			if (birthday.charAt(i) >= 0 || birthday.charAt(i) <= 9) // 지정한 인덱스에 해당하는 문자를 반환(charAt) 즉, 반환된 값들이 숫자면 곱해 더함
			{
				if (i == 0) // 앞 자리 첫번째 숫자
				{
					SUM = (i + 2) * birthday.charAt(i);
				} else {
					SUM = SUM + (i + 2) * birthday.charAt(i);
				}
			}

			else // 숫자가 아닌 문자가 있을 때의 처리
			{
				swal({
					text: "주민등록번호에 숫자만 입력해주세요.",
					icon: "warning",
					button: "닫기"
				});
				document.joinform.resNum.focus();
				return false;
			}
		}

		for (i = 0; i < 2; i++) // 주민등록번호 7 ~ 8 자리까지의 처리
		{
			if (regNum.charAt(i) >= 0 || regNum.charAt(i) <= 9) {
				SUM = SUM + (i + 8) * regNum.charAt(i);
			} else // 숫자가 아닌 문자가 있을 때의 처리
			{
				swal({
					text: "주민등록번호에 숫자만 입력해주세요.",
					icon: "warning",
					button: "닫기"
				});
				document.joinform.resNum.focus();
				return false;
			}
		}

		for (i = 2; i < 6; i++) // 주민등록번호 9 ~ 12 자리까지의 처리
		{
			if (regNum.charAt(i) >= 0 || regNum.charAt(i) <= 9) {
				SUM = SUM + (i) * regNum.charAt(i);
			} else // 숫자가 아닌 문자가 있을 때의 처리
			{
				swal({
					text: "주민등록번호에 숫자만 입력해주세요.",
					icon: "warning",
					button: "닫기"
				});
				document.joinform.resNum.focus();
				return false;
			}
		}

		var checkSUM = SUM % 11; // 나머지 구하기

		if (checkSUM == 0) // 나머지가 0 이면 10 을 설정
		{
			var checkCODE = 10;
		} else if (checkSUM == 1) // 나머지가 1 이면 11 을 설정
		{
			var checkCODE = 11;
		} else {
			var checkCODE = checkSUM;
		}

		var check1 = 11 - checkCODE; // 나머지를 11 에서 뺀다

		if (regNum.charAt(6) >= 0 || regNum.charAt(6) <= 9) {
			var check2 = parseInt(regNum.charAt(6))
		} else // 숫자가 아닌 문자가 있을 때의 처리
		{
			swal({
				text: "주민등록번호에 숫자만 입력해주세요.",
				icon: "warning",
				button: "닫기"
			});
			document.joinform.resNum.focus();
			return false;
		}

		if (check1 != check2) // 주민등록번호가 틀릴 때의 처리
		{
			swal({
				text: "주민등록번호에 숫자만 입력해주세요.",
				icon: "warning",
				button: "닫기"
			});
			document.joinform.resNum.focus();
			return false;
		} else {
			swal({
				text: "주민등록번호가 확인되었습니다.",
				icon: "success",
				button: "확인"
			});
			return true;
		}
	}
</script>



