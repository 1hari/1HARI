<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<h5 class="card-title m-b-0">결재 대기 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">기안일</th>
									<th scope="col">문서번호</th>
									<th scope="col">결재양식</th>
									<th scope="col">제목</th>
									<th scope="col">기안자 (사번)</th>
									<th scope="col">중간결재자 (사번)</th>
									<th scope="col">최종결재자 (사번)</th>
									<th scope="col">결재상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<!-- 결재대기 리스트 1줄 -->
								<c:forEach var="waiting" items="${requestScope.signWaitingList}">
									<tr>
										<td>${waiting.signDate}</td>
										<td>${waiting.signNum}</td>
										<td>${waiting.signFormFormName}</td>
										<td class="signDocu" signNum="${waiting.signNum}"">${waiting.signTitle}</td>
										<td>${waiting.draftEmpName} (${waiting.draftEmp})</td>
										<td>${waiting.empSign1Name} (${waiting.empSign1})</td>
										<td>${waiting.empSign2Name} (${waiting.empSign2})</td>
										<td>
											<div class="d-flex no-block align-items-center m-t-15">
                                        		<span>${waiting.signName}</span>
                                    		</div>
											<div class="progress">
												<c:choose>
													<c:when test="${waiting.signCode == 1}">
														<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 30%" aria-valuenow="30"></div>
													</c:when>
													<c:otherwise>
														<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped" style="width: 70%" aria-valuenow="70"></div>
													</c:otherwise>
												</c:choose>
											</div>
										</td>
									</tr>
								</c:forEach>
								<!-- 결재대기 리스트 1줄 -->
							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블1 끝 -->
				<hr>
				<!--전자결재 관리2  테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">최근 기안 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">기안일</th>
									<th scope="col">문서번호</th>
									<th scope="col">결재양식</th>
									<th scope="col">제목</th>
									<th scope="col">기안자 (사번)</th>
									<th scope="col">중간결재자 (사번)</th>
									<th scope="col">최종결재자 (사번)</th>
									<th scope="col">결재상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<!-- 기안 리스트 1줄 -->
								<c:forEach var="draft" items="${requestScope.signDraftList}">
									<tr>
										<td>${draft.signDate}</td>
										<td>${draft.signNum}</td>
										<td>${draft.signFormFormName}</td>
										<td class="signDocu" signNum="${draft.signNum}">${draft.signTitle}</td>
										<td>${draft.draftEmpName} (${draft.draftEmp})</td>
										<td>${draft.empSign1Name} (${draft.empSign1})</td>
										<td>${draft.empSign2Name} (${draft.empSign2})</td>
										<td>
											<div class="d-flex no-block align-items-center m-t-15">
                                        		<span>${draft.signName}</span>
                                    		</div>
											<div class="progress">
												<c:choose>
													<c:when test="${draft.signCode == 1}">
														<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 30%" aria-valuenow="30"></div>
													</c:when>
													<c:otherwise>
														<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped" style="width: 70%" aria-valuenow="70"></div>
													</c:otherwise>
												</c:choose>
											</div>
										</td>
									</tr>
								</c:forEach>
								<!-- 기안 리스트 1줄 -->
							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블2 끝 -->
				<hr>
				<!--전자결재 관리3  테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">최근 완료 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">기안일</th>
									<th scope="col">문서번호</th>
									<th scope="col">결재양식</th>
									<th scope="col">제목</th>
									<th scope="col">기안자 (사번)</th>
									<th scope="col">중간결재자 (사번)</th>
									<th scope="col">최종결재자 (사번)</th>
									<th scope="col">결재상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<!-- 완료리스트 1줄 -->
								<c:forEach var="completet" items="${requestScope.signCompletetList}">
									<tr>
										<td>${completet.signDate}</td>
										<td>${completet.signNum}</td>
										<td>${completet.signFormFormName}</td>
										<td class="signDocu" signNum="${completet.signNum}">${completet.signTitle}</td>
										<td>${completet.draftEmpName} (${completet.draftEmp})</td>
										<td>${completet.empSign1Name} (${completet.empSign1})</td>
										<td>${completet.empSign2Name} (${completet.empSign2})</td>
										<td>
											<div class="d-flex no-block align-items-center m-t-15">
                                        		<span>${completet.signName}</span>
                                    		</div>
											<div class="progress">
												<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-success" style="width: 100%" aria-valuenow="100"></div>
											</div>
										</td>
									</tr>
								</c:forEach>
								<!-- 완료리스트 1줄 -->
							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블3 끝 -->
				<hr>
				<!--전자결재 관리4  테이블 -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">최근 반려 문서</h5>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">기안일</th>
									<th scope="col">문서번호</th>
									<th scope="col">결재양식</th>
									<th scope="col">제목</th>
									<th scope="col">기안자 (사번)</th>
									<th scope="col">중간결재자 (사번)</th>
									<th scope="col">최종결재자 (사번)</th>
									<th scope="col">결재상태</th>
								</tr>
							</thead>
							<tbody class="customtable">
								<!-- 반려리스트 1줄 -->
								<c:forEach var="signReturn" items="${requestScope.signReturnList}">
									<tr>
										<td>${signReturn.signDate}</td>
										<td>${signReturn.signNum}</td>
										<td>${signReturn.signFormFormName}</td>
										<td>${signReturn.empSign1Name} (${signReturn.empSign1})</td>
										<td>${signReturn.empSign2Name} (${signReturn.empSign2})</td>
										<td class="signDocu" signNum="${signReturn.signNum}">${signReturn.signTitle}</td>
										<td>${signReturn.draftEmpName} (${signReturn.draftEmp})</td>
										<td>
											<div class="d-flex no-block align-items-center m-t-15">
                                        		<span>${signReturn.signName}</span>
                                    		</div>
											<div class="progress">
												<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 100%" aria-valuenow="100"></div>
											</div>
										</td>
									</tr>
								</c:forEach>
								<!-- 반려리스트 1줄 -->
							</tbody>
						</table>
					</div>
				</div>
				<!--데이터 테이블4 끝 -->
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

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	var icon;
	if('${reqiestScope.isOk}' == 'true'){
		icon = 'success';
	}else {
		icon = 'warning';
	}
	
	if('${requestScope.msg}' != ''){
		swal({
			text: "${requestScope.msg}",
			icon: icon,
			button: "닫기"
		});
	}
	/****************************************
	*       Basic Table                   *
	****************************************/
	$('#zero_config').DataTable();
</script>