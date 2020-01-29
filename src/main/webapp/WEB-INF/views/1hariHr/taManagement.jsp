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
	<div class="container-fluid" style ="margin-top: 3%;">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!-- 사원 근태관리 테이블 -->
				<div class="card">
					<div class="card-body" style ="border-radius:10px; box-shadow :3px 3px #999999;  border: 2px groove #999999;">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<form id="taTable" name="taTable" method="post" enctype="multipart/form-data">
								<table id="zero_config" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>사번</th>
											<th>사원</th>
											<th>부서</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>퇴근처리</th>
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
				let count = 0;
				
				for (var i = 0; i < TaList.length; i++) {
					if (count == 0) {
						empTaList += '<tr>'
										+ '<td>' + TaList[i].empNum + '</td>'
										+ '<td>' + TaList[i].empName + ' ' + TaList[i].rankName +'</td>'
										+ '<td>' + TaList[i].teamName + '</td>'
										+ '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>';
						count++;
					} else {
						if (TaList[i].empNum == TaList[i-1].empNum && TaList[i].taCode == 6) {
							empTaList += '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>'
										+ '<td><button type="button" class="editEmpTa btn btn-success"><i class="fa fa-edit"></i> 퇴근처리</button></td>'
									+ '</tr>';
							count = 0;
						} else {
							empTaList += '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>'
										+ '<td></td>' // 결근이 아닐 경우 퇴근처리 버튼을 만들지 않음
									+ '</tr>';
							count = 0;
						}
					}
				}
				$('#taBody').append(empTaList);
				/* 비동기 데이터 호출 후 DataTable 호출 */
				$('#zero_config').DataTable();

				getEmpTa();
			}
		});
		
		function getEmpTa() {
			$('.editEmpTa').click(function() {
				let tr = $(this).closest('tr'); // 나와 조상요소 중 첫번째 tr //.parent() 바로 상위요소 찾기
				let empNum = { "empNum" : tr.children().html() }; // 나와 조상요소 중 첫번째 tr의 자식의 값
				let td = tr.children().eq(4);
				console.log(tr);
				tr.children().eq(4).html("");
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/getEmpTa.hari",
					data: empNum,
					type: "post",
					dataType: "json",
					success: function(empTa) {
					}
				})
			})
		}
	})
	
</script>