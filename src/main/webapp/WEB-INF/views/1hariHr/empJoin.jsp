<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="row">
			<div class="col-12">

				<!-- 사원 등록 input div 시작 -->
				<div class="container" style="background-color: #ffffff; margin-top: 8%;">
					
						<div class="row setup-content" id="step-1">
							<div class="col-xs-12">
								<div class="col-md-12">

									<div class="container">
										<div class="row">
										
										<!--form 태그 시작 -->
											<form action="" method="post">
												<!--왼쪽 input 태그들 -->
												<div class="col-xs-6">
													<div class="form-group">
														<label for="firstname" style="margin-top: 8%;">소속 번호</label>
														
														<!-- ★★ 소속번호 DB에서 조회해서 가져오기 -->
														<select type="text" class="form-control" placeholder="소속 번호" style="height: 1000%;">
														</select>
													</div>
													
													<div class="form-group">
														<label for="lastname" style="margin-top: 1%;">직책 번호</label>
														
														<!-- ★★ 직책번호 DB에서 조회해서 가져오기 -->
														<select type="text" class="form-control" placeholder="직책 번호" style="height: 150%;">
														</select>
													</div>

													<div class="form-group">
														<label for="AddressLine1" style="margin-top: 1%;">직급 번호 </label>
														
														<!-- ★★ 직급번호 DB에서 조회해서 가져오기 -->
														<select type="text" class="form-control" placeholder="직급 번호" style="height: 150%;">
														</select>
													</div>
													<div class="form-group">
														<label for="Address Line 1" style="margin-top: 1%;">재직 구분 번호 </label>
														
														<!-- ★★ 재직 번호 DB에서 조회해서 가져오기 -->
														<select type="text" class="form-control" placeholder="직책 번호" style="height: 150%;">
														</select>
													</div>
													<div class="form-group">
														<label for="Address Line 1" style="margin-top: 1%;">이름</label>
														<input type="text" class="form-control" placeholder="이름" style="margin-bottom: 10%">
													</div>
												</div>
												<!--왼쪽 input 태그들 끝-->
												<!--오른쪽 input 태그들 시작 -->
												<div class="col-xs-5">
													<div class="form-group">
														<label style="margin-top: 9%;">생년 월일 </label>
														<input type="text" class="form-control mydatepicker" placeholder="mm/dd/yyyy">
														<div class="input-group-append"></div>
													</div>

													<div class="form-group">
														<label for="State">핸드폰 번호</label> <br>
														<input type="text" style="width: 32%; display: inline;" class="form-control" placeholder="010">
														<input type="text" style="width: 32%; display: inline;" class="form-control" placeholder="" >
														<input type="text" style="width: 32%; display: inline-block;" class="form-control" placeholder="">
													</div>
													<!--
									                                상위 선택자에 text-align:center를 넣고,
									                                하위 선택자 중 , 좌측 정렬 되어야 할 선택자에 display:inline 을 적용,
									                                우측 정렬 되어야 할 선택자에 display:inline-block 을 적용시키면 해결된다.
									
									                                출처: https://biju.tistory.com/317 [에헤라디야~]-->
													<div class="form-group">
														<label for="zip">주민번호</label> <br>
														<input type="text" style="width: 49%; display: inline;" class="form-control" placeholder="주민 번호" >
														<input type="password" style="width: 49%; display: inline-block;" class="form-control" placeholder="뒷자리">
													</div>
													<div class="form-group">
														<label for="zip">이메일 </label> <br>
														<input type="text" style="width: 49%; display: inline;" class="form-control" id="zip" placeholder="이메일">
														<span type="text" style="width: 49%; display: inline-block;">@gmail.com</span>
													</div>

													<div class="input-group">
														<label>입사일</label>
														<input type="text" class="form-control mydatepicker" placeholder="yyyy/mm/dd">
														<div class="input-group-append"></div>
													</div>
												</div>
												<!--오른쪽 input 태그들 끝-->

											</form>
											<!--form 태그 끝 -->
											
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
			<!--  <div class="col-12"> 끝-->

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

<!-- 주민등록번호 유효성 체크 -->
<script>
	function CheckForm() {
	
		var birth = regform.birth.value;
		var resnum = regform.resnum.value;
		var SUM = 0;
	
		for (i = 0; i < birth.length; i++) // 주민등록번호 1 ~ 6 자리까지의 처리
		{
			if (birth.charAt(i) >= 0 || birth.charAt(i) <= 9) // 지정한 인덱스에 해당하는 문자를 반환(charAt) 즉, 반환된 값들이 숫자면 곱해 더함
			{
				if (i == 0) // 앞 자리 첫번째 숫자
				{
					SUM = (i + 2) * birth.charAt(i);
				} else {
					SUM = SUM + (i + 2) * birth.charAt(i);
				}
			}

			else // 숫자가 아닌 문자가 있을 때의 처리
			{
				alert("주민등록번호에 숫자만 입력하세요");
				document.regform.jumin1.focus();
				return false;
			}
		}

		for (i = 0; i < 2; i++) // 주민등록번호 7 ~ 8 자리까지의 처리
		{
			if (resnum.charAt(i) >= 0 || resnum.charAt(i) <= 9) {
				SUM = SUM + (i + 8) * resnum.charAt(i);
			} else // 숫자가 아닌 문자가 있을 때의 처리
			{
				alert("주민등록번호에 숫자만 입력하세요");
				document.regform.jumin1.focus();
				return false;
			}
		}

		for (i = 2; i < 6; i++) // 주민등록번호 9 ~ 12 자리까지의 처리
		{
			if (resnum.charAt(i) >= 0 || resnum.charAt(i) <= 9) {
				SUM = SUM + (i) * resnum.charAt(i);
			} else // 숫자가 아닌 문자가 있을 때의 처리
			{
				alert("주민등록번호에 숫자만 입력하세요");
				document.regform.jumin1.focus();
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

		if (resnum.charAt(6) >= 0 || resnum.charAt(6) <= 9) {
			var check2 = parseInt(resnum.charAt(6))
		} else // 숫자가 아닌 문자가 있을 때의 처리
		{
			alert("주민등록번호에 숫자만 입력하세요");
			document.regform.jumin1.focus();
			return false;
		}

		if (check1 != check2) // 주민등록번호가 틀릴 때의 처리
		{
			alert("주민등록번호를 다시 확인 하세요.");
			document.regform.jumin1.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

<!-- 소속코드, 직책코드, 직급코드, 재직구분 Select Box -->
<script>
	$(function() {
		$.ajax({
			url:"getTeamCode.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
	    		console.log(data);
	    		
				var dArray = [];
				dArray = data;
				
				for(var i = 0; i < dArray.length; i++) {
					var option = document.createElement("option");
					$(option).text(dArray[i]);
					$("#deptSelect").append(option);
				}
			}
		});
		
		$.ajax({
			url:"getRankCode.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
	    		console.log(data);
	    		
				var dArray = [];
				dArray = data;
				
				for(var i = 0; i < dArray.length; i++) {
					var option = document.createElement("option");
					$(option).text(dArray[i]);
					$("#deptSelect").append(option);
				}
			}
		});
		
		$.ajax({
			url:"getPositionCode.hari",
			type: "post",
			dataType: "json",
			success: function(data) {
	    		console.log(data);
	    		
				var dArray = [];
				dArray = data;
				
				for(var i = 0; i < dArray.length; i++) {
					var option = document.createElement("option");
					$(option).text(dArray[i]);
					$("#deptSelect").append(option);
				}
			}
		});
	});
</script>

