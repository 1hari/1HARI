<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 초기페이지 설정 -->

<script>
	var code = 0 //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서
	var cp = 1; //보여줄 페이지
	var pg = 3; //한 페이지에 보여줄 갯수
	
	$(function(){
		list(code, cp, pg);
		page(code,pg);

		//내문서함 문서구분 클릭
		$('.signType').click(function(){
			//console.log($(this).attr("code"));
			code = $(this).attr("code");
			cp = 1;
			list(code, cp, pg);
			page(code,pg);
		});//내문서함 문서구분 클릭 끝
		
	});//onload 끝

	//페이징처리
	function page(code,pg){
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/signPage.hari",
			type:"post",
			data :{"code" : code},
			success: function(count){
 				//console.log(count);
 				//count = count.trim();
 				$('#pagination').empty();
 				
 				count = count/pg;
				count = Math.ceil(count);
				<!-- 페이지 -->
				var page = '<li class="page-item">'
							+'<a class="page-link" id="first">'
								+'<span aria-hidden="true">&laquo;</span>'
							+'</a>'
						+'</li>';
					
				for(var i = 1; i <= count ; i++){
					page += '<li class="page-item"><a class="page-link" id="page'+i+'">'+i+'</a></li>';
				}

				page += '<li class="page-item">'
						+'<a class="page-link" id="last">'
							+'<span aria-hidden="true">&raquo;</span>'
						+'</a>'
					+'</li>'
				<!-- 페이지 -->

				$('#pagination').append(page);

				$('.page-link').click(function(){
					//console.log($(this).text()=="«");
					
					var cur = $(this).text();

					if(cur == "«"){
						cp = 1;
					}else if(cur == "»"){
						cp = count;
					}else {
						cp = cur;
					}
					
					list(code, cp, pg);
				});//페이지 클릭 이벤트 끝

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
	}//페이징처리 끝
	
	//전자결재 가져오기
	function list(code, cp, pg){
		//console.log(code);
		//console.log(cp);
		//console.log(pg);
			
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/selectSign.hari",
			type:"post",
			data :{"code" : code, "cp" : cp, "pg" : pg},
			success: function(list){
				$('#signListTable').empty();
 				//console.log(list);
 				let signList="";
 				$.each(list, function(index, sign){
 	 				//console.log(sign);
 	 				//console.log(sign.signNum);
 	 				//리스트 1줄
 	 				signList += "<tr>"
								+ "<td>"+sign.signDate+"</td>"
								+ "<td>"+sign.signNum+"</td>"
								+ "<td>"+sign.signFormFormName+"</td>"
								+ "<td>"+sign.signTitle+"</td>"
								+ "<td>"+sign.draftEmpName+" ("+sign.draftEmp+")</td>"
								+ "<td>"+sign.empSign1Name+" ("+sign.empSign1+")</td>"
								+ "<td>"+sign.empSign2Name+" ("+sign.empSign2+")</td>"
								+ "<td>"
									+ '<div class="d-flex no-block align-items-center m-t-15">'
										+'<span>'+sign.signName+'</span>'
                        			+ '</div>'
									+ '<div class="progress">';
										if(sign.signCode == "1") {
											signList += '<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 30%" aria-valuenow="30"></div>'; 
										}else if(sign.signCode == "2"){
											signList +='<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped" style="width: 70%" aria-valuenow="70"></div>';
										}else if(sign.signCode == "3"){
											signList +='<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-success" style="width: 100%" aria-valuenow="100"></div>';
										}else{
											signList += '<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 100%" aria-valuenow="100"></div>';
										}
									signList += '</div>'
								+'</td>'
							+ "</tr>";
					//리스트 1줄
 	 			});//each 끝
 	 			//console.log(signList);
				$('#signListTable').append(signList);
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
	}//전자결재 가져오기 끝
</script>
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
				<h4 class="page-title">내 문서함</h4>
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
				<!--내 문서함 테이블 -->
				<div class="card">
					<div class="card-body">
						<button type="button" class="btn btn-success btn-sm signType" code="0">전체문서</button>
						<button type="button" class="btn btn-success btn-sm signType" code="1">기안문서</button>
						<button type="button" class="btn btn-success btn-sm signType" code="4">결재 할 문서</button>
						<button type="button" class="btn btn-success btn-sm signType" code="2">완료문서</button>
						<button type="button" class="btn btn-success btn-sm signType" code="3">반려문서</button>
						
					</div>
					<table class="table">
						<thead>
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
			<div class="col-md-4"></div>
			<!-- 페이징처리 -->
			<div class="col-md-4">
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