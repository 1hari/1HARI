<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- 초기페이지 설정 -->
<c:forEach var="docu" items="${requestScope.signDocu}">
<div id="main-wrapper">
	<!-- Page wrapper  -->
	<!-- ============================================================== -->

	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">전자결재 문서보기</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>

	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 250px; vertical-align: middle; text-align: center;">
					<tr class="draft" style="height: 40px; vertical-align: middle;">
						<td rowspan="3">결<br>재<br>선</td>
						<!-- 직급 -->
						<td id="rankName0">${docu.rankName}</td>
						<td id="rankName1"></td>
						<td id="rankName2"></td>
					</tr>
					<tr class="draft" style="height: 63px; vertical-align: middle;">
						<!-- 사원명 -->
						<td id="empName0">${emp.empName}</td>
						<td id="empName1"></td>
						<td id="empName2"></td>
					</tr>
					<tr class="draft" style="height: 40px; vertical-align: middle;">
						<!-- 빈칸 : 승인일 -->
						<td></td>
						<td></td>
						<td></td>
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