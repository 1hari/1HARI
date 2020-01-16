<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<style>
	.draft > td{
		border-color:#000000;
		border-style:solid;
		border-width:1px 1px 1px;
		width: 80px;
	}
</style>

<!-- 초기페이지 설정 -->
<c:forEach var="docu" items="${requestScope.signDocu}">
<div id="main-wrapper">
	<!-- Page wrapper  -->
	<!-- ============================================================== -->

	<!-- <div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">전자결재 문서보기</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div> -->

	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 100%; vertical-align: middle; text-align: center;">
					<tr>
						<td>
							<div class="row">
								<div class="col-md-5">
									<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 250px; vertical-align: middle; text-align: center;">
										<tr class="draft" style="height: 40px; vertical-align: middle;">
											<td>기안자</td>
											<td>${docu.draftEmpName}</td>
										</tr>
										<tr class="draft" style="height: 63px; vertical-align: middle;">
											<td>부서명</td>
											<td></td>
										</tr>
										<tr class="draft" style="height: 40px; vertical-align: middle;">
											<td>기안일</td>
											<td>${docu.signDate}</td>
										</tr>
									</table>
								</div>
							<div class="col-md-5">
							<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 250px; vertical-align: middle; text-align: center;">
								<tr class="draft" style="height: 40px; vertical-align: middle;">
									<td rowspan="3">결<br>재<br>선</td>
									<!-- 직급 -->
									<td>${docu.draftEmpRankName}</td>
									<td>${docu.empSign1RankName}</td>
									<td>${docu.empSign2RankName}</td>
								</tr>
								<tr class="draft" style="height: 63px; vertical-align: middle;">
									<!-- 사원명 -->
									<td>${docu.draftEmpName}</td>
									<td>${docu.empSign1Name}</td>
									<td>${docu.empSign2Name}</td>
								</tr>
								<tr class="draft" style="height: 40px; vertical-align: middle;">
									<!-- 빈칸 : 승인도장 -->
									<td><img src="${pageContext.request.contextPath}/resources/hari/assets/images/stamp_approved.png"></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							</div>
							</div>
							${docu.signContent}
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
</div>
</c:forEach>