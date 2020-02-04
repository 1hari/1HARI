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
	    
	    #signListTable td{
	    	border: 2px solid #505050;
	    
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
	<div class="container-fluid" style ="margin-top: 3%;">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<!--내 문서함 테이블 -->
				<div class="card"  style=" border-radius:10px;  box-shadow :7px 7px #505050; border-radius:10px;">
					<div class="card-body">
						<div class="row">
							<!-- 문서구분 버튼 -->
							<div class="col-md-6">
								<button type="button" class="btn btn-success btn-sm signType" code="0">전체문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="1">기안문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="4">결재 할 문서</button>
								<button type="button" class="btn btn-success btn-sm signType" code="5">결재 한 문서</button>
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
	                                            <label class="custom-control-label" for="customControlAutosizing4">사번</label>
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
					<table class="table"  style = "margin-left:2%; width:96%">
						<thead>
							<tr style = "background-color:#e9ecef;">
								<th scope="col" style ="width:10%;">기안일</th>
								<th scope="col" style ="width:6%;">문서번호</th>
								<th scope="col" style ="width:6%;">결재양식</th>
								<th scope="col" style ="width:18%;">제목</th>
								<th scope="col" style ="width:9%;">기안자 (사번)</th>
								<th scope="col" style ="width:9%;">중간결재자 (사번)</th>
								<th scope="col" style ="width:9%;">최종결재자 (사번)</th>
								<th scope="col" style ="width:13%;">결재상태</th>
								
								
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
<script>
	var code = 0 //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서
	var cp = 1; //보여줄 페이지
	var pg = 10; //한 페이지에 보여줄 갯수
	var signDate = "false";
	var signNum = "false";
	var signTitle = "false";
	var draftEmp = "false";
	var searchKey;
	
	$(function(){
				
		list(code, cp, pg, signDate, signNum, signTitle, draftEmp, searchKey);
		page(code,pg,signDate, signNum, signTitle, draftEmp, searchKey);

		//내문서함 문서구분 클릭
		$('.signType').click(function(){
			//console.log($(this).attr("code"));
			code = $(this).attr("code");
			cp = 1;
			
// 			$('.searchCheck:checked').each(function(index){
// 				console.log($(this));
// 				$(this).attr("checked",false);
// 			});
			
 			signDate = "false";
			signNum = "false";
			signTitle = "false";
			draftEmp = "false";
			
			list(code, cp, pg, signDate, signNum, signTitle, draftEmp, searchKey)
			page(code,pg); //,signDate, signNum, signTitle, draftEmp, searchKey
		});//내문서함 문서구분 클릭 끝

		//검색어 입력
		$('#searchKey').keyup(function(){
			//console.log($('.searchCheck:checked').length);
			
			signDate = "false";
			signNum = "false";
			signTitle = "false";
			draftEmp = "false";
			
			if($('.searchCheck:checked').length == 0){
				swal({
					text: "검색구분이 선택되지 않았습니다.",
					icon: "warning",
					button: "닫기"
				})
			}else {
				//체크박스 each
				$('.searchCheck:checked').each(function(index){
					//console.log($(this).val());
					
					var searchCheck = $(this).val();
					//console.log(searchCheck);
					
					if(searchCheck == "signDate"){
						signDate = "true";
						
					}else if(searchCheck == "signNum"){
						signNum = "true";
						
					}else if(searchCheck == "signTitle"){
						signTitle = "true";
						
					}else if(searchCheck == "draftEmp"){
						draftEmp = "true";
					}
				}); //체크박스 each 끝
				
				//console.log($('#searchKey').val());
				searchKey = $('#searchKey').val();
				cp = 1; //보여줄 페이지
				pg = 3; //한 페이지에 보여줄 갯수
				
				list(code, cp, pg, signDate, signNum, signTitle, draftEmp, searchKey);
				page(code,pg,signDate, signNum, signTitle, draftEmp, searchKey);
			}
			
		});//검색어 입력 끝
		
	});//onload 끝

	//페이징처리
	function page(code,pg,signDate, signNum, signTitle, draftEmp, searchKey){
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/signPage.hari",
			type:"post",
			data :{
				"code" : code,
				"signDate" : signDate,
				"signNum" : signNum,
				"signTitle" : signTitle,
				"draftEmp" : draftEmp,
				"searchKey" : searchKey
			},
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
					
					list(code, cp, pg, signDate, signNum, signTitle, draftEmp, searchKey);
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
	function list(code, cp, pg, signDate, signNum, signTitle, draftEmp, searchKey){
		//console.log(code);
		//console.log(cp);
		//console.log(pg);
			
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/selectSign.hari",
			type:"post",
			data :{
					"code" : code,
					"cp" : cp,
					"pg" : pg,
					"signDate" : signDate,
					"signNum" : signNum,
					"signTitle" : signTitle,
					"draftEmp" : draftEmp,
					"searchKey" : searchKey
			},
			success: function(list){
				$('#signListTable').empty();
 				//console.log(list);
 				let signList="";
 				$.each(list, function(index, sign){
 	 				//console.log(sign);
 	 				//console.log(sign.signNum);
 	 				//리스트 1줄
 	 				signList += '<tr class="signDocu" signNum="'+sign.signNum+'">'
								+ "<td>"+sign.signDate+"</td>"
								+ "<td>"+sign.signNum+"</td>"
								+ "<td>"+sign.signFormFormName+"</td>"
								+ "<td>"+sign.signTitle+"</td>"
								+ "<td>"+sign.draftEmpName + " " + sign.draftEmpRankName + " ("+sign.draftEmp+")</td>"
								+ "<td>"+sign.empSign1Name + " " + sign.empSign1RankName + " ("+sign.empSign1+")</td>"
								+ "<td>"+sign.empSign2Name + " " + sign.empSign2RankName + " ("+sign.empSign2+")</td>"
								+ "<td>"
									+ '<div class="d-flex no-block align-items-center m-t-15" style="margin-left:5%;">'
										+'<span>'+sign.signName+'</span>'
                        			+ '</div>'
									+ '<div class="progress" style="margin-left:5%;">';
										if(sign.signCode == "1") {
											signList += '<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 30%" aria-valuenow="30"></div>'; 
										}else if(sign.signCode == "2"){
											signList +='<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped" style="width: 70%" aria-valuenow="70"></div>';
										}else if(sign.signCode == "3"){
											signList +='<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-success" style="width: 95%" aria-valuenow="100"></div>';
										}else{
											signList += '<div role="progressbar" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-striped bg-danger" style="width: 95%" aria-valuenow="100"></div>';
										}
									signList += '</div>'
								+'</td>'
							+ "</tr>";
					//리스트 1줄
 	 			});//each 끝
 	 			//console.log(signList);
				$('#signListTable').append(signList);

				//문서 클릭
				$(".signDocu").click(function(){
					//console.log($(this).attr("signNum"));
					let openUrl = "${pageContext.request.contextPath}/1hariSign/signDocuView.hari?signNum="+$(this).attr("signNum");
					//console.log(openUrl);
					open(openUrl,"전자결재","statusber=no,menuber=no, width=850, height=800, top=10");
				});//문서 클릭
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

	function reload() {
		window.location.reload();
	}
</script>
