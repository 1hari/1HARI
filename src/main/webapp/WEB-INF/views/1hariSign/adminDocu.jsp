<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<style>
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		    position: fixed;
		    left:0;
		    right:0;
		    top:0;
		    bottom:0;
		    background: rgba(0,0,0,0.2); /*not in ie */
		    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
		}

	    .wrap-loading div{ /*로딩 이미지*/
	        position: fixed;
	        top:50%;
	        left:50%;
	        margin-left: -21px;
	        margin-top: -21px;
	    }
	
	    .display-none{ /*감추기*/
	        display:none;
	    }
</style>
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">

	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">전체 문서함</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>

	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid" style ="margin-top: 3%;">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<!--내 문서함 테이블 -->
				<div class="card"  style=" border-radius:10px;  box-shadow :0 0 12px #999999; border-radius:10px;">
					<div class="card-body">
						<div class="row">
							<!-- 문서구분 버튼 -->
							<div class="col-md-6">
								<button type="button" class="btn btn-success btn-sm signType" code="0">전체문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="1">진행문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="2">완료문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="3">반려문서</button>
							</div>
							<!-- 문서구분 버튼끝 -->
							
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-8">
										<div class="row">
										
	                                        <div class="custom-control custom-checkbox col-md-3">
	                                            <input type="checkbox" class="custom-control-input searchCheck" id="customControlAutosizing1" value="signDate" checked="checked">
	                                            <label class="custom-control-label" for="customControlAutosizing1">기안일</label>
	                                        </div>
	                                        
	                                        <div class="custom-control custom-checkbox col-md-3">
	                                            <input type="checkbox" class="custom-control-input searchCheck" id="customControlAutosizing2" value="signNum" checked="checked">
	                                            <label class="custom-control-label" for="customControlAutosizing2">문서번호</label>
	                                        </div>
	                                        
	                                        <div class="custom-control custom-checkbox col-md-3">
	                                            <input type="checkbox" class="custom-control-input searchCheck" id="customControlAutosizing3" value="signTitle" checked="checked">
	                                            <label class="custom-control-label" for="customControlAutosizing3">제목</label>
	                                        </div>
	                                        
	                                        <div class="custom-control custom-checkbox col-md-3">
	                                            <input type="checkbox" class="custom-control-input searchCheck" id="customControlAutosizing4" value="draftEmp" checked="checked">
	                                            <label class="custom-control-label" for="customControlAutosizing4">기안자</label>
	                                        </div>
	                                        
                                        </div>
									</div>
									
									<div class="col-md-4">
										<input type="search" class="form-control form-control-sm" placeholder="검색어를 입력하세요." id="searchKey">
									</div>
									
								</div>
							</div>
							
						</div>
						
					</div>
					<table class="table">
						<thead>
							<tr style = "background-color:#e9ecef;">
								<th scope="col" style ="width:13%;">기안일</th>
								<th scope="col" style ="width:8%;">문서번호</th>
								<th scope="col" style ="width:10%;">결재양식</th>
								<th scope="col" style ="width:10%;">제목</th>
								<th scope="col" style ="width:10%;">기안자 (사번)</th>
								<th scope="col" style ="width:10%;">중간결재자 (사번)</th>
								<th scope="col" style ="width:10%;">최종결재자 (사번)</th>
								<th scope="col" style ="width:10%;">결재상태</th>
							</tr>
						</thead>
						<tbody id="signListTable">
							<!-- 리스트 1줄 -->
<!-- 							<tr> -->
<!-- 								<td>기안일</td> -->
<!-- 								<td>문서번호</td> -->
<!-- 								<td>결재양식</td> -->
<!-- 								<td>제목</td> -->
<!-- 								<td>결재상태</td> -->
<!-- 							</tr> -->
							<!-- 리스트 1줄 -->
						</tbody>
					</table>
				</div>					
				<!-- 내 문서함 테이블 끝 -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
			<!-- 페이징처리 -->
			<div class="col-md-2">
				<nav aria-label="Page navigation">
					<ul class="pagination" id="pagination">
						<!-- 페이지 -->
						<!-- <li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
							</a>
						</li> -->
						<!-- 페이지 -->
					</ul>
				</nav>
			</div>
			<!-- 페이징처리 -->
			<div class="col-md-4"></div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<script src="${pageContext.request.contextPath}/resources/hari/customjs/1hariSign/adminDocu.js"></script>
