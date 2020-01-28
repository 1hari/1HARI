<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- moment js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title"> 근태관리 </h4>
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

				<!-- 사원 근태관리 테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<form id="taTable" name="taTable" method="post" enctype="multipart/form-data">
								<table id="zero_config" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>사원</th>
											<th>부서</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>수정</th>
										</tr>
									</thead>
									<tbody id="taBody">
										
									</tbody>
									<tfoot>
									</tfoot>
								</table>
							</form>
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
	<!-- ============================================================== -->

	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>

<script>
	$(function() {
		
		$.ajax({ // 근태목록 가져오기
			url: "${pageContext.request.contextPath}/ajax/getTaList.hari",
			type: "post",
			dataType: "json",
			success: function(TaList) {
				let empTaList = "";
				var count = 0;
				
				for (var i = 0; i < TaList.length; i++) {
					if (count == 0) {
						empTaList += '<tr>'
									+ '<td><div><span>' + TaList[i].empName + ' ' + TaList[i].rankName +'</span><span>(' + TaList[i].empNum + ')</span></div></td>'
									+ '<td><div><p>' + TaList[i].teamName + '</p></div></td>'
									+ '<td><div><span>' + TaList[i].taName + '</span><span> (' + TaList[i].taDate + ')</span></div></td>';
						count++;
					} else {
						if (TaList[i].empNum == TaList[i-1].empNum) {
							empTaList += '<td><div><span>' + TaList[i].taName + '</span><span> (' + TaList[i].taDate + ')</span></div>'
									+ '</td></tr>';
							count = 0;
						}
					}
				}
				$('#taBody').append(empTaList);
				$('#zero_config').DataTable();
			}
		});
	})
	/****************************************
	*       Basic Table                   *
	****************************************/
	

</script>