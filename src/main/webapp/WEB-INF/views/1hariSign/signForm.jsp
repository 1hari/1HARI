<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">전자 결재 홈</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Bread crumb and right sidebar toggle -->
	
	<!-- ============================================================== -->
	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!--전자결재 관리1  테이블 -->

				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">결재할 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>
										<label class="customcheckbox m-b-20">
										<input type="checkbox" id="mainCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<th scope="col">Rendering engine</th>
									<th scope="col">Browser</th>
									<th scope="col">Platform(s)</th>
									<th scope="col">결재 단계</th>
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
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 5.0</td>
									<td>Win 95+</td>
									<td>5</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블1 끝 -->

				<!--전자결재 관리2  테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">기안 진행 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>
										<label class="customcheckbox m-b-20">
											<input type="checkbox" id="mainCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<th scope="col">Rendering engine</th>
									<th scope="col">Browser</th>
									<th scope="col">Platform(s)</th>
									<th scope="col">Engine version</th>
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
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 5.0</td>
									<td>Win 95+</td>
									<td>5</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블2 끝 -->

				<!--전자결재 관리3  테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">완료 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th>
										<label class="customcheckbox m-b-20">
											<input type="checkbox" id="mainCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<th scope="col">Rendering engine</th>
									<th scope="col">Browser</th>
									<th scope="col">Platform(s)</th>
									<th scope="col">Engine version</th>
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
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 5.0</td>
									<td>Win 95+</td>
									<td>5</td>
								</tr>
								<tr>
									<th>
										<label class="customcheckbox">
											<input type="checkbox" class="listCheckbox" />
											<span class="checkmark"></span>
										</label>
									</th>
									<td>Trident</td>
									<td>Internet Explorer 4.0</td>
									<td>Win 95+</td>
									<td>4</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블3 끝 -->

			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
		
	</div>
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	
</div>
<!-- ============================================================== -->
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