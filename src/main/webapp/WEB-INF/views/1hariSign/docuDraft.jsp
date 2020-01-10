<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--이 페이지에서만 쓰는  ckeditor 필수 제이쿼리 지우지 마세요! -->
<script src="https://cdn.ckeditor.com/4.13.1/standard-all/ckeditor.js"></script>

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">문서 기안</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row" >
			<div class="col-12">
				<div class="container">
					<!--form 태그 시작 -->
					<form action="" method="POST">
						<div class="row">
							<div class="col-md-12">
								<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#signModal">결재선</button>
							</div>
							<!-- input 태그 -->
							<div class="col-md-12">
									<input type="text" class="form-control" id="signFormName" name="signFormName" placeholder="제목" style="width:93%; display: inline;">
									<button type="submit" class="btn btn-success" style="display: inline-block;">기안</button>
							</div>
						</div><!-- row 끝 -->
						<!-- ck 에디터 form -->
						<textarea name="signFormContent" id="signFormContent" rows="10" cols="80">
							${form.signFormFormContent}
						</textarea>
						<script>
							CKEDITOR.replace('signFormContent', {
								// 도구 모음 정의: https://ckeditor.com/docs/ckeditor4/latest/features/toolbar
								// 기본적으로 CDN의 전체 사전 설정은 필요 이상의 기능을 제공합니다.
								// The full preset from CDN which we used as a base provides more features than we need.
								// 또한 기본적으로 3줄 도구 모음이 제공됩니다.
								// Also by default it comes with a 3-line toolbar. Here we put all buttons in two rows.
								toolbar: [{
									name: 'clipboard',
									items: ['PasteFromWord', '-', 'Undo', 'Redo']
								},
								{
									name: 'basicstyles',
									items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'Subscript', 'Superscript']
								},
								{
									name: 'links',
									items: ['Link', 'Unlink']
								},
								{
									name: 'paragraph',
									items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
								},
								{
									name: 'insert',
									items: ['Table']
								},
								{
									name: 'editing',
									items: ['Scayt']
								},
								'/',
		
								{
									name: 'styles',
									items: ['Format', 'Font', 'FontSize']
								},
								{
									name: 'colors',
									items: ['TextColor', 'BGColor', 'CopyFormatting']
								},
								{
									name: 'align',
									items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
								},
								{
									name: 'document',
									items: ['Print', 'PageBreak', 'Source']
								}],
		
								// Since we define all configuration options here, let's instruct CKEditor to not load config.js which it does by default.
								// One HTTP request less will result in a faster startup time.
								// For more information check https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html#cfg-customConfig

			
								// Enabling extra plugins, available in the full-all preset: https://ckeditor.com/cke4/presets
								extraPlugins: 'colorbutton,font,justify,print,tableresize,pastefromword,liststyle,pagebreak',
			
								// Make the editing area bigger than default.
								height: 600,
								width: 940
							});
						</script>
						<!-- ck 에디터 form 끝 -->
					</form>
				</div><!-- container -->
			</div><!-- col-12 끝 -->
		</div><!-- row 끝 -->
	</div><!-- container-fluid 끝 -->
</div>
<!-- End Page wrapper  -->
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>

<script>
	$(function(){
		//listCheckbox
		//결재자 클릭
		$('.empSign').click(function(){
// 			console.log($(this).attr('teamCode'));
// 			console.log($(this).attr('teamName'));
// 			console.log($(this).val());
// 			console.log($(this).html());

			//체크된 줄의 부모 요소 중 tr을 찾음
			var check = $('.listCheckbox:checked').closest('tr');
			
			//찾은 tr의 자식 중 class가 일치하는 것을 찾아서 값 대입
			check.children('.empTeam').html($(this).attr('teamName'));
			check.children('.empSign').html($(this).val());
			check.children('.empName').html($(this).html());
			
		});//결재자 클릭 끝
			
	});//document ready 끝
</script>

<!-- sign Modal -->
<div class="modal fade" id="signModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content"  style="width: 500px;">
			<form action="${pageContext.request.contextPath}/1hariSign/docuDraft.hari">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재자 선택</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div><!-- modal-header 끝 -->
			
				<div class="modal-body" >
					<div class="row">
						<div class="col-md-4">
							<c:forEach var="team" items="${requestScope.teamList}">
								<!-- accoridan part -->
								<div class="accordion" id="accordionExample">
									<!-- 부서시작 -->
									<div class="card m-b-0 border-top">
										<div class="card-header" id="headingOne">
											<h5 class="mb-0">
												<a class="collapsed" data-toggle="collapse" data-target="#collapse${team.teamCode}" aria-expanded="false" aria-controls="collapse${team.teamCode}">
													<i class="m-r-5 fa fa-magnet" aria-hidden="true"></i>
													<span>${team.teamName}</span>
												</a>
											</h5>
										</div>
		
										<!-- 부서원 data-parent="#accordionExample" -->
										<div id="collapse${team.teamCode}" class="collapse" aria-labelledby="headingOne">
											<div class="card-body">
												<ul>
													<c:forEach var="emp" items="${requestScope.empList}">
														<c:if test="${emp.teamCode == team.teamCode}">
															<li class="empSign" teamCode="${emp.teamCode}" teamName ="${team.teamName}" value="${emp.empNum}">${emp.empName}</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
										<!-- 부서원끝 -->
									</div>
									<!-- 부서시작 -->
								</div><!-- accordion 끝 -->
							</c:forEach>
						</div>
						<div class="col-md-8">
							<table class="table">
								<thead class="thead-light">
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" id="mainCheckbox" />
												<span class="checkmark"></span>
											</label>
										</th>
										<th scope="col">
											부서
										</th>
										<th scope="col">
											직급
										</th>
										<th scope="col">
											사번
										</th>
										<th scope="col">
											이름
										</th>
									</tr>
								</thead>
								<tbody class="customtable">
									<tr>
										<th>
											<label class="customcheckbox">
												<input type="checkbox" class="listCheckbox" />
												<span class="checkmark"></span>
											</label>
										</th>
										<td class="empTeam" id="empTeam1" name="empTeam1">
											
										</td>
										<td class="empSign" id="empSign1" name="empSign1">
											
										</td>
										<td class="empName" id="empName1" name="empName1">
											
										</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox">
												<input type="checkbox" class="listCheckbox" />
												<span class="checkmark"></span>
											</label>
										</th>
										<td class="empTeam" id="empTeam2" name="empTeam2">
											
										</td>
										<td class="empSign" id="empSign2" name="empSign2">
											
										</td>
										<td class="empName" id="empName2" name="empName2">
											
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div><!-- modal-body 끝 -->
                        
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="formChoice">선택완료</button>
				</div><!-- modal-footer 끝 -->
				<input type="hidden" value="" id="signFormCode" name="signFormCode">
			</form>
		</div><!-- modal-content 끝 -->
	</div><!-- modal-dialog 끝 -->
</div><!--  signModal 끝 -->