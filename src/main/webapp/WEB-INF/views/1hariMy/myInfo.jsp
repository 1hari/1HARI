<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
    
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--datepicker link 필수 !!! -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

<!--아래 3개는 마이 정보에서 필요한 js -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->

<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!--필수 js 지우지 말기 -->

<!-- 컨텐츠 제목 -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
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
				<div class="container" style="background-color: #ffffff;">
					<div class="row setup-content" id="step-1">
						<div class="col-md-12">
							<!--form 태그 시작 -->
							<form action="" method="post" enctype="multipart/form-data">
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
											<label for="phoneNum">핸드폰번호</label>
											<span class="checkPhoneNum" style="color: red;"></span>
											<input type="text" id="phoneNum" name="phoneNum" class="form-control" value="${emp.phoneNum}" placeholder="(-) 없이 숫자만 입력하세요." maxlength="13" required>
										</div>
										<div class="form-group">
											<label for="email">이메일</label>
											<div>
												<input id="email" name="email" type="text" class="form-control" value="${emp.email}">
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="hireDate">입사일</label>
											<input type="text" id="hireDate" name="hireDate" class="form-control" value="${emp.hireDate}" readonly>
										</div>
										<div class="form-group">
											<label for="teamCode">소속</label>
											<input type="text" id="teamCode" name="teamCode" class="form-control" value="${emp.teamName}" readonly>
										</div>
										<div class="form-group">
											<label for="positionCode">직책</label>
											<input type="text" id="positionCode" name="positionCode" class="form-control" value="${emp.positionName}" readonly>
										</div>
										<div class="form-group">
											<label for="rankCode">직급</label>
											<input type="text" id="rankCode" name="rankCode" class="form-control" value="${emp.rankName}" readonly>
										</div>
										<div class="form-group">
											<label for="employmentCode">재직구분</label>
											<input type="text" id="employmentCode" name="employmentCode" class="form-control" value="${emp.employmentName}" readonly>
										</div>
									</div>									
								</div>
								<div class="form-group" align="right">
									<button type="submit" style ="color: #fff; background-color: #20B2AA; border-color: #20B2AA;" class="btn btn-success">수정하기</button>
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

<!-- 이 페이지에서 꼭 필요한  js -->

<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>

<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/dist/js/pages/mask/mask.init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/select2/dist/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/hari/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">
	$(function() {
		/* 핸드폰번호 입력 유효성 검사 */
		var phoneReg = /^01[016789]-\d{3,4}-\d{4}$/; // 핸드폰번호 정규표현식
		var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        //0부터9a부터zA부터Z까지 (-, _, . 가 있어도 되고 없어도 되고, 0부터9a부터zA부터Z까지)반복횟수 상관없이가능
        //@기호포함  (-, _, . 가 있어도 되고 없어도 되고, 0부터9a부터zA부터Z까지)반복횟수 상관없이가능 .기호포함 2자~3자 이내 대소문자 구분안함
        
        var email_check = false;
        var phoneNumCheck = false;
		
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
				$('.checkPhoneNum').text("");
			} else {
				$('.checkPhoneNum').text("핸드폰번호 형식이 잘못되었습니다.");
			}
		})

		//email 유효성체크 
        $('#email').keyup(function() {
            if (email_pattern.test($(this).val()) != true) {
                $('#emailcheck').text("이메일 형식에 맞지 않습니다.");
            } else {
                $('#emailcheck').text("이메일 형식에 맞습니다.");
                $('#emailCheck').removeAttr('disabled');
            }
        });
		
		//이메일 인증
		$('#emailCheck').click(function() {
			//이메일이 입력되면 새창으로 이동
			if ($('#emailCheck').val() != null) {
				var url = "emailCheck.do?email="+$('#email').val();
				//console.log(url);
				open(url,"Email Check","statusber=no, scrollbar=no, menuber=no, width=400, height=130");
			} else {
				alert("이메일이 입력되지 않았습니다.");
			}
		});//이벤트 끝
		
		//전송
		$('#submit').click(function() {
			//console.log($('#emailCheckReturn').val());
			
			if ($('#emailCheckReturn').val() == "true") {
				email_check = true;
			}
			let issubmit = id_check && pw_check && pwck_check && email_check;
			console.log(issubmit);
			
			return issubmit;
		});//이벤트 끝
	})

</script>
    
    
    