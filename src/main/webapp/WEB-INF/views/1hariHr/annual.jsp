<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">연차 관리 </h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="container" style="margin-top: 3%;">
		<div class="row">
			<div class="col-md-12">
					<div class="row row-card-no-pd">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999;  ">
								<div class="card-body ">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-calendar-alt fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">총 연차</p>
												<h4 class="card-title" id="totalTA">0</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-history fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">사용 연차</p>
												<h4 class="card-title" id="getTotalTime">:undefined</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px;  box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-sync fa-4x" style=""></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">남은 연차</p>
												<h4 class="card-title" id="getWeekTotalTime"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round" style="border-radius:10px; box-shadow :5px 5px #999999; ">
								<div class="card-body">
									<div class="row">
										<div class="col-5">
											<div class="icon-big text-center">
												<i class="fas fa-suitcase fa-4x"></i>
											</div>
										</div>
										<div class="col col-stats">
											<div class="numbers">
												<p class="card-category">연차 사용</p>
												<h4 class="card-title" id="getWorkTime"></h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 끝 -->
					
					
			</div>
		</div>
	</div>
	
	
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
	
				<!--연차 관리  테이블 -->
				<div class="card" style ="box-shadow :10px 10px #999999; border-radius:10px; border : 4px dashed #bcbcbc;">
					<div class="card-body">
						<h5 class="card-title">Basic Datatable</h5>
						<div class="table-responsive">
							<table id="zero_config" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
										<td>2011/07/25</td>
										<td>$170,750</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>66</td>
										<td>2009/01/12</td>
										<td>$86,000</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Senior Javascript Developer</td>
										<td>Edinburgh</td>
										<td>22</td>
										<td>2012/03/29</td>
										<td>$433,060</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>33</td>
										<td>2008/11/28</td>
										<td>$162,700</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Integration Specialist</td>
										<td>New York</td>
										<td>61</td>
										<td>2012/12/02</td>
										<td>$372,000</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Sales Assistant</td>
										<td>San Francisco</td>
										<td>59</td>
										<td>2012/08/06</td>
										<td>$137,500</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Integration Specialist</td>
										<td>Tokyo</td>
										<td>55</td>
										<td>2010/10/14</td>
										<td>$327,900</td>
									</tr>
	
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Software Engineer</td>
										<td>San Francisco</td>
										<td>28</td>
										<td>2011/06/07</td>
										<td>$206,850</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Chief Operating Officer (COO)</td>
										<td>San Francisco</td>
										<td>48</td>
										<td>2010/03/11</td>
										<td>$850,000</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Regional Marketing</td>
										<td>Tokyo</td>
										<td>20</td>
										<td>2011/08/14</td>
										<td>$163,000</td>
									</tr>
									<tr>
										<th>
											<label class="customcheckbox m-b-20">
												<input type="checkbox" class="listCheckbox">
												<span class="checkmark"></span>
											</label>
										</th>
										
										<td>Integration Specialist</td>
										<td>Sidney</td>
										<td>37</td>
										<td>2011/06/02</td>
										<td>$95,400</td>
									</tr>
	
								</tbody>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
							</table>
						</div>
	
					</div>
				</div>
				<!--데이터 테이블 끝 -->
	
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
</div>
<!-- ============================================================== -->
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