<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<script>
	$(function(){
		
	});//onload 끝

	function allList(cp){
		//전체 전자결재 가져오기
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/selectAllSign.hari",
			type:"post",
			
			success: function(list){
 				console.log(list);
				
				$('#formlist').append(formlist);
				
			},
			error: function(xhr){
				console.log(xhr.status);
			},
// 			beforeSend:function(){//이미지 보여주기
// 				$('.wrap-loading').removeClass('display-none');
// 			},
// 			complete:function(){ //이미지 감추기
// 		        $('.wrap-loading').addClass('display-none');
// 			},
		});//ajax 끝
	}
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
						<button type="button" class="btn btn-success btn-sm">전체</button>
						<button type="button" class="btn btn-success btn-sm">기안</button>
						<button type="button" class="btn btn-success btn-sm">진행</button>
						<button type="button" class="btn btn-success btn-sm">승인</button>
						<button type="button" class="btn btn-success btn-sm">반려</button>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">기안일</th>
								<th scope="col">문서번호</th>
								<th scope="col">결재양식</th>
								<th scope="col">제목</th>
								<th scope="col">결재상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>기안일</td>
								<td>문서번호</td>
								<td>결재양식</td>
								<td>제목</td>
								<td>결재상태</td>
							</tr>
						</tbody>
					</table>
				</div>					
				<!-- 내 문서함 테이블 끝 -->
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->

</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->