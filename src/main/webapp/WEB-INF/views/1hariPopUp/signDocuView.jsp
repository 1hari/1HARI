<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"	uri="http://www.springframework.org/security/tags"%>

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
<se:authentication property="name" var="loginuser"  />
	<div id="main-wrapper">
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
	
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-12 d-flex no-block align-items-center" style="margin-bottom: 15px;">
					<h4 class="page-title">결재문서</h4>
					<div class="ml-auto text-right">
						<c:if test='${docu.signCode !="4" && ((docu.isSign1 == "0" && docu.empSign1 == loginuser) || (docu.isSign1 == "1" && docu.isSign2 == "0" && docu.empSign2 == loginuser))}'>
							<button type="button" signCode="3" class="btn btn-outline-success approval">결재</button>
							<button type="button" signCode="4" class="btn btn-outline-danger approval">반려</button>
						</c:if>
						<c:if test='${docu.signCode=="4" && docu.draftEmp==loginuser}'>
							<button type="button" class="btn btn-outline-dark" id="draft">재기안</button>
						</c:if>
						<button type="button" id="print" class="btn btn-outline-secondary">출력하기</button>
					</div>
				</div>
				<div class = "col-md-12 d-flex no-block align-items-center" style="margin-bottom: 15px;">
					<input type="text" class="form-control" id="signComment" placeholder="Comment" value="${docu.signComment}" <c:if test='${docu.signCode =="4" || !((docu.isSign1 == "0" && docu.empSign1 == loginuser) || (docu.isSign1 == "1" && docu.isSign2 == "0" && docu.empSign2 == loginuser))}'>readonly</c:if>>
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
					<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 100%; vertical-align: middle; text-align: center;">
						<tr>
							<td colspan="2">
								<div class="row">
									<div class="col-md-5">
										<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 250px; vertical-align: middle; text-align: center;">
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<td>기안자</td>
												<td>${docu.draftEmpName} (${docu.draftEmp})</td>
											</tr>
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<td>부서명</td>
												<td>${docu.draftEmpTeamName}</td>
											</tr>
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<td>기안일</td>
												<td>${docu.signDate}</td>
											</tr>
										</table>
									</div>
									<div class="col-md-3"></div>
									<div class="col-md-4">
										<table style="border-color: #000000; border-style: solid; border-width: 1px 1px 1px; width: 260px; vertical-align: middle; text-align: center;">
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<td rowspan="3">결<br>재<br>선</td>
												<!-- 직급 -->
												<td>${docu.draftEmpRankName}</td>
												<td>${docu.empSign1RankName}</td>
												<td>${docu.empSign2RankName}</td>
											</tr>
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<!-- 사원명 -->
												<td>${docu.draftEmpName}<br>(${docu.draftEmp})</td>
												<td>${docu.empSign1Name}<br>(${docu.empSign1})</td>
												<td>${docu.empSign2Name}<br> (${docu.empSign2})</td>
											</tr>
											<tr class="draft" style="height: 40px; vertical-align: middle;">
												<!-- 빈칸 : 승인도장 -->
												<td><img src="${pageContext.request.contextPath}/resources/hari/assets/images/stamp_approved.png"></td>
												<td>
													<c:choose>
														<c:when test='${docu.isSign1 == "1" }'>
															<img src="${pageContext.request.contextPath}/resources/hari/assets/images/stamp_approved.png">
														</c:when>
														<c:when test='${docu.isSign1 == "0" && docu.signCode == "4" }'>
															반려
														</c:when>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test='${docu.isSign2 == "1" }'>
															<img src="${pageContext.request.contextPath}/resources/hari/assets/images/stamp_approved.png">
														</c:when>
														<c:when test='${docu.isSign2 == "0" && docu.signCode == "4" }'>
															반려
														</c:when>
													</c:choose>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</td>
						</tr>
						<tr style="height: 20px;">
							<td></td>
							<td></td>
						</tr>
						<tr class="draft" style="height: 40px; vertical-align: middle;">
							<td style="width:15px">문서번호 : ${docu.signNum}</td>
							<td>${docu.signTitle}</td>
						</tr>
						<tr style="height: 20px;">
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">${docu.signContent}</td>
						</tr>
						<tr style="height: 20px;">
							<td></td>
							<td></td>
						</tr>
						<tr class="draft" style="height: 40px; vertical-align: middle;">
							<td style="width:15px">첨부파일</td>
							<td><a href="${pageContext.request.contextPath}/1hariSign/download.hari?path=/WEB-INF/views/1hariSign/upload&file=${docu.signFileName}">${docu.signFileName}</a></td>
						</tr>
						<tr style="height: 20px;">
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
	
	<script>		
		//결재하기
		$('.approval').click(function(){

			let isSign1 = ${docu.isSign1};
			let empSign1 = ${docu.empSign1};
			
			let isSign2 = ${docu.isSign2};
			let empSign2 = ${docu.empSign2};

			let signNum = ${docu.signNum};

			let draftEmp = ${docu.draftEmp};

			let	signComment = $('#signComment').val(); //comment 담을 변수
			
			let signCode = $(this).attr('signCode');

			let signFormCode = ${docu.signFormCode}
						
			$.ajax({
				url:"${pageContext.request.contextPath}/ajax/approval.hari",
				type:"post",
				data : {
					"isSign1" : isSign1,
					"empSign1" : empSign1,
					"isSign2" : isSign2,
					"empSign2" : empSign2,
					"signNum" : signNum,
					"signComment" : signComment,
					"signCode" : signCode,
					"signFormCode" : signFormCode
				},
				success: function(resultMap){
	 				console.log(resultMap);
	 				var icon;
	 				
	 				if(resultMap.isOk == 'true'){
	 					icon = 'success';
	 				}else {
	 					icon = 'warning';
	 				}
	 				
	 				if(resultMap.msg != ''){
	 					swal({
	 						text: resultMap.msg,
	 						icon: icon,
	 						button: "닫기"
	 					}).then((value) => {
	 						window.opener.send(draftEmp,empSign2,signCode);
	 						window.location.reload();
	 						window.opener.reload();			
		 				})
	 				}
				},
				error: function(xhr){
					console.log(xhr.status);
				},
	// 			beforeSend:function(){//이미지 보여주기
	// 				$('.wrap-loading').removeClass('display-none');
	// 			},
	// 			complete:function(){ //이미지 감추기
	// 		        $('.wrap-loading').addClass('display-none');
	// 			}
			});//ajax 끝
		}); //결재하기 끝

		//출력버튼
		$('#print').click(function(){
			window.print();
		});

		//재기안 버튼
		$('#draft').click(function(){
			window.opener.location.href ='${pageContext.request.contextPath}/1hariSign/docuDraft.hari?signNum=${docu.signNum}';
			self.close();
		});
	</script>
</c:forEach>