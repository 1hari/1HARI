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
	
<style>
	.where {
	  display: block;
	  margin: 25px 15px;
	  font-size: 11px;
	  color: #000;
	  text-decoration: none;
	  font-family: verdana;
	  font-style: italic;
	} 
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  -webkit-appearance: none; /* 네이티브 외형 감추기 */
	  -moz-appearance: none;
	  appearance: none;
	}
	
	/* imaged preview */
	.filebox .upload-display {
	    margin-bottom: 5px;
	}
	
	@media(min-width: 768px) {
	    .filebox .upload-display {
	        display: inline-block;
	        margin-right: 5px;
	        margin-bottom: 0;
	    }
	}
	
	.filebox .upload-thumb-wrap {
	    display: inline-block;
	    width: 54px;
	    padding: 2px;
	    vertical-align: middle;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    background-color: #fff;
	}
	
	.filebox .upload-display img {
	    display: block;
	    max-width: 100%;
	    width: 100% \9;
	    height: auto;
	}
	
	.filebox.bs3-primary label {
	  color: #fff;
	  background-color: #2ab2aa;
	  border-color: #2ab2aa;
	}
	
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
	
	#profile_pt input[type="file"] { 
	
		position: absolute; 
		width: 10px; 
		height: 10px;
		padding: 0; 
		margin: -1px;
		overflow: hidden; 
		clip:rect(0,0,0,0);
		border: 0; 
		background-color:#20B2AA;
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
							<form action="" method="post">
								<c:set var="emp" value="${requestScope.emp}" />
								<div class="form-group row">
									<label for="file" class="col-sm-3 text-right control-label col-form-label">프로필 사진</label>
									<div class="col-sm-6" >
										<div class="filebox bs3-primary preview-image">
											<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
											<label for="input_file">업로드</label> 
											<input type="file" id="input_file" class="upload-hidden"> 
										</div> 
									</div>
								</div>
								<div class="col-sm-12" style="margin-top: 3%;">
									<div class="form-group">
										<label for="empName">이름</label> 
										<input type="text" id="empName" name="empName" class="form-control" value="${emp.empName}" readonly>
									</div>
									<div class="form-group">
										<label for="empNum">사번</label> 
										<input  type="text" id="empNum" name="empNum" class="form-control" value="${emp.empNum}" readonly>
									</div>
									<div class="form-group">
										<label for="birth">생년월일</label>
										<input type="text" id="birth" name="birth" class="form-control" value="${emp.birth}" readonly>
									</div>
									<div class="form-group">
										<label for="email">이메일</label>
										<input type="text" id="email" name="email" class="form-control" value="${emp.email}@gmail.com">
									</div>
									<div class="form-group">
										<label for="phoneNum">핸드폰번호</label>
										<input type="text" id="phoneNum" name="phoneNum" class="form-control" value="${emp.phoneNum}" placeholder="010-0000-0000" required>
									</div>
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
									<div class="form-group" id="leaveDateDiv" style="display: none;">
										<label>퇴사일</label>
										<input type="text" id="leaveDate" name="leaveDate" class="form-control leavedatepicker" value="${emp.leaveDate}" placeholder="yyyy-mm-dd">
									</div>
									<div class="form-group" align="right">
										<button type="submit" style ="color: #fff; background-color: #20B2AA; border-color: #20B2AA;" class="btn btn-success">수정하기</button>
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

    
    
<script>
	/****************************************
	*      필수 테이블 1. 데이터 테이블 , 2. datepicker 제이쿼리 스크립트 *
	****************************************/
		/*2.datepicker*/
		jQuery('.mydatepicker').datepicker();
		
		jQuery('#datepicker-autoclose').datepicker({
			autoclose: true,
			todayHighlight: true
		});

		$('.mydatepicker').setDefaults({
		    dateFormat: 'yyyy-mm-dd' //Input Display Format 변경
		});





		// 3. 파일 업로드 , 파일 미리보기 
		$(document).ready(function(){
			   var fileTarget = $('.filebox .upload-hidden');

			    fileTarget.on('change', function(){
			        if(window.FileReader){
			            // 파일명 추출
			            var filename = $(this)[0].files[0].name;
			        } 

			        else {
			            // Old IE 파일명 추출
			            var filename = $(this).val().split('/').pop().split('\\').pop();
			        };

			        $(this).siblings('.upload-name').val(filename);
			    });

			    //preview image 
			    var imgTarget = $('.preview-image .upload-hidden');

			    imgTarget.on('change', function(){
			        var parent = $(this).parent();
			        parent.children('.upload-display').remove();

			        if(window.FileReader){
			            //image 파일만
			            if (!$(this)[0].files[0].type.match(/image\//)) return;
			            
			            var reader = new FileReader();
			            reader.onload = function(e){
			                var src = e.target.result;
			                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
			            }
			            reader.readAsDataURL($(this)[0].files[0]);
			        }

			        else {
			            $(this)[0].select();
			            $(this)[0].blur();
			            var imgSrc = document.selection.createRange().text;
			            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

			            var img = $(this).siblings('.upload-display').find('img');
			            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
			        }
			    });
			});

		//3. 파일 첨부, 파일 미리보기 스크립트 
		/* function previewImage(targetObj, View_area) {
			var preview = document.getElementById(View_area); //div id
			var ua = window.navigator.userAgent;

		  //ie일때(IE8 이하에서만 작동)
			if (ua.indexOf("MSIE") > -1) {
				targetObj.select();
				try {
					var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
					var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


					if (ie_preview_error) {
						preview.removeChild(ie_preview_error); //error가 있으면 delete
					}

					var img = document.getElementById(View_area); //이미지가 뿌려질 곳

					//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
					img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
				} catch (e) {
					if (!document.getElementById("ie_preview_error_" + View_area)) {
						var info = document.createElement("<p>");
						info.id = "ie_preview_error_" + View_area;
						info.innerHTML = e.name;
						preview.insertBefore(info, null);
					}
				}
		  ie가 아닐때(크롬, 사파리, FF)
			} else {
				var files = targetObj.files;
				for ( var i = 0; i < files.length; i++) {
					var file = files[i];
					var imageType = /image.; //이미지 파일일경우만.. 뿌려준다.
					if (!file.type.match(imageType))
						continue;
					var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
					if (prevImg) {
						preview.removeChild(prevImg);
					}
					var img = document.createElement("img"); 
					img.id = "prev_" + View_area;
					img.classList.add("obj");
					img.file = file;
					img.style.width = '100px'; 
					img.style.height = '100px';
					preview.appendChild(img);
					if (window.FileReader) { // FireFox, Chrome, Opera 확인.
						var reader = new FileReader();
						reader.onloadend = (function(aImg) {
							return function(e) {
								aImg.src = e.target.result;
							};
						})(img);
						reader.readAsDataURL(file);
					} else { // safari is not supported FileReader
						//alert('not supported FileReader');
						if (!document.getElementById("sfr_preview_error_"
								+ View_area)) {
							var info = document.createElement("p");
							info.id = "sfr_preview_error_" + View_area;
							info.innerHTML = "not supported FileReader";
							preview.insertBefore(info, null);
						}
					}
				}
			}
		} */
    </script>