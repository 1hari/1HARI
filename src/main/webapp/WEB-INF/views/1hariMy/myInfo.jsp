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

<!--아래 3개는 마이 정보에서 필요한 js -->
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
				<h4 class="page-title">개인 정보</h4>
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
			<div class="col-12" >

				<!-- 사원 등록 input div 시작 -->
					            <div class="card" style = "position:relative;width:100%;">
					       
	                            <form class="form-horizontal">
	                                <div class="card-body">
	                                    <h4 class="card-title">개인 정보 프로필</h4>
	                                      <div class="form-group row">
	                                        <label for="file" class="col-sm-3 text-right control-label col-form-label">프로필 사진</label>
	                                        <div class="col-sm-3" >
	               <!--                              <input type="file" name="profile_pt" id="profile_pt"  onchange="previewImage(this,'View_area')"> -->
	               
							               			
						                                        <div class="custom-file">
						                                            <input type="file" class="custom-file-input" id="validatedCustomFile" style ="background-color:#20B2AA; width:150%;"  onchange="previewImage(this,'View_area')" required="">
						                                            <label class="custom-file-label" for="validatedCustomFile">파일 선택</label>
						                                            <div class="invalid-feedback"></div>
						                                        </div>
						                             
						                                
	               						<!-- 			<button type="file" class="btn btn-success" style ="background-color:#20B2AA;" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">파일 선택</button> -->
													<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'></div>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="teamcode" class="col-sm-3 text-right control-label col-form-label">소속 번호</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="teamcode" name="teamcode" placeholder="소속 번호" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="positioncode" class="col-sm-3 text-right control-label col-form-label">직책 번호 </label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="positioncode" name = "positioncode" placeholder="직책번호" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="rankcode" class="col-sm-3 text-right control-label col-form-label">직급 번호</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="rankcode" name = "rankcode" placeholder="직급 번호" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="employmentcode" class="col-sm-3 text-right control-label col-form-label">재직구분 번호</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="employmentcode" name ="employmentcode" placeholder="재직구분 번호" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="ename" class="col-sm-3 text-right control-label col-form-label">이름</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="ename" name="ename" placeholder="이름" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="birth" class="col-sm-3 text-right control-label col-form-label">생년월일</label>
	                                        <div class="col-sm-9">
	                                               <input type="text" class="form-control mydatepicker"  placeholder="yyyy/mm/dd" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="phonenum" class="col-sm-3 text-right control-label col-form-label">핸드폰 번호</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="핸드폰 번호">
	                                            
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="email" class="col-sm-3 text-right control-label col-form-label">이메일</label>
	                                        <div class="col-sm-9">
	                                            <input type="text" style = "width:49%; display:inline;" class="form-control" id="email" name="email" placeholder="이메일">
	                                            <span type="text"   style = "width:49%;  display:inline-block;"  id="zip" placeholder="@gmail.com" required="">@gmail.com</span>
	                                        </div>
	                                    </div>
	                                    <div class="form-group row">
	                                        <label for="hiredate" class="col-sm-3 text-right control-label col-form-label">입사일</label>
	                                        <div class="col-sm-9">
	                                               <input type="text" id="hiredate" name ="hiredate" class="form-control mydatepicker"  placeholder="yyyy/mm/dd" readonly>
	                                        </div>
	                                    </div>
	                                   <!--  <div class="form-group row">
	                                        <label for="leavedate" class="col-sm-3 text-right control-label col-form-label">퇴사일</label>
	                                        <div class="col-sm-9">
	                                               <input type="text" id="leavedate" name="leavedate" class="form-control mydatepicker"  placeholder="yyyy/mm/dd">
	                                        </div>
	                                    </div> -->
	                                 </div>
	                                 
	                                <div class="border-top">
	                                    <div class="card-body">
	                                        <button type="button" style ="color: #fff; background-color: #20B2AA; border-color: #20B2AA;" class="btn btn-success">변경하기</button>
	                                    </div>
	                                </div>
	                            </form>
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
	    //1. 데이터 테이블
		$('#zero_config').DataTable();
	
		/*2.datepicker*/
		jQuery('.mydatepicker').datepicker();
		
		jQuery('#datepicker-autoclose').datepicker({
			autoclose: true,
			todayHighlight: true
		});

		$.datepicker.setDefaults({
		    dateFormat: 'yyyy-mm-dd' //Input Display Format 변경
		});


		//3. 파일 첨부, 파일 미리보기 스크립트 
		function previewImage(targetObj, View_area) {
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
		  //ie가 아닐때(크롬, 사파리, FF)
			} else {
				var files = targetObj.files;
				for ( var i = 0; i < files.length; i++) {
					var file = files[i];
					var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
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
		}
    </script>