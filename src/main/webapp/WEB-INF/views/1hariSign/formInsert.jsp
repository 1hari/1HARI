<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--이 페이지에서만 쓰는  ckeditor 필수 제이쿼리 지우지 마세요! -->
<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js" ></script>

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">

	<!--전자 결재 모달 -->
	<div id="add-new-event" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1>결재양식 선택</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>

				<div class="modal-body">
					<form onsubmit="return false;">
						<section>
							<div></div>
						</section>
					</form>
					<div></div>
				</div>
				<div class="modal-body">
					<form></form>
					<div></div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<a href="javascript:void(0)" data-toggle="modal" data-target="#add"
						class="btn m-t-20 btn-info btn-block waves-effect waves-light">
						<i class="ti-plus"></i> 인증번호 받기
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- 전자 결재 모달 끝 -->
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">양식 등록</h4>
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
				<!-- ck 에디터 form -->
				<form>
					<textarea name="editor1" id="editor1" rows="10" cols="80">
			                This is my textarea to be replaced with CKEditor.
			            </textarea>
					<script>
			                // Replace the <textarea id="editor1"> with a CKEditor
			                // instance, using default configuration.
			                CKEDITOR.replace( 'editor1' );
			            </script>
				</form>
				<!-- ck 에디터 form 끝 -->
			</div>
			<!-- col-12 끝 -->
		</div>
		<!-- row 끝 -->
	</div>
	<!-- container-fluid 끝 -->
</div>
<!-- End Page wrapper  -->
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>
<script>
	/****************************************
	*       Basic Table                   *
	****************************************/
	$('#zero_config').DataTable();
</script>