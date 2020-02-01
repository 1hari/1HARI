<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<script>
	$(function(){

		//재직증명서 클릭
		$("#employPopUp").click(function(){
			//console.log($(this).attr("signNum"));
			let openUrl = "${pageContext.request.contextPath}/1hariHr/employ.hari";
			//console.log(openUrl);
			open(openUrl,"재직증명서","statusber=no,menuber=no, width=850, height=800");
		});//재직증명서 클릭
		
		//품의서 양식 목록 가져오기
		$.ajax({
			url:"${pageContext.request.contextPath}/ajax/selectAllForm.hari",
			type:"post",
			success: function(list){
// 				console.log(list);
				var formlist = "<ul>";
				$.each(list, function(index, form){
					//문서1개 시작 <i class="far fa-file-alt">&nbsp;</i> 아이콘 안먹힘..
					formlist += '<li class="jstree-leaf">'
									+'<i class="jstree-icon">&nbsp;</i>'
									+'<a class="formcode" title="'+form.signFormCode+'" rel="FORM" href="#" data-bypass="1">'
									+form.signFormFormName
									+'</a>'
								+'</li>'
					//문서1개 끝
				}) //each 끝
				formlist += "</ul>";
				
				$('#formlist').append(formlist);
				$('#formTree').jstree(); //비동기 완료 후 태그생성 -> jstree 활성화

				var signFormCode;
				//품의서 선택 시
				$('.formcode').click(function() {
					console.log($(this).attr('title'));
					signFormCode = $(this).attr('title');
					$('#signFormCode').val(signFormCode);
					if($('#signFormCode').val() != "품의서"){
						$('#formChoice').removeAttr('disabled');
					}else {
						$('#formChoice').attr('disabled', 'disabled');
					}
				})
				
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
	});//document ready 끝

		//ul, li hover, 클릭시 font-size 크기 변경.. 
	$(function() {

	});
</script>

<style>
	/* .wrap-loading{ /*화면 전체를 어둡게 합니다.
		    position: fixed;
		    left:0;
		    right:0;
		    top:0;
		    bottom:0;
		    background: rgba(0,0,0,0.2); /*not in ie 
		    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie 
		}

	    .wrap-loading div{ /*로딩 이미지
	        position: fixed;
	        top:50%;
	        left:50%;
	        margin-left: -21px;
	        margin-top: -21px;
	    }
	
	    .display-none{ /*감추기
	        display:none;
	    } */
	    /*aside bar 마우스 오버 액션들 */
	    
/* 	    { */
/* 	    	/* background: #dbdbdb; */
/* 	 		font-size:70%; */
/* 	    	/* font-family: 'Nanum DaCaeSaRang'; */
	    
/* 	    } */
/* 	    li.sidebar-link:hover, li.sidebar-link:active { */
/* 	    	font-size: 70%; */
/* 	    } */

	    span.hide-menu:hover, span.hide-menu:active{
	    	font-size: 150%;  	
	    }  
	    .sidebar-nav:hover {
	    	color: black;
	    }
	    a.sidebar-link.hover, a.sidebar-link:active {
	    	font-size: 150%; 
	    }
	    
	    .sidebar-item.hover, .sidebar-link:active{
	    	font-size: 150%;
	    }
	/*  	.sidebar-link.hover, .sidebar-link:hover {
	 		font-size: 150%; 
	 	} */
	/*  	.sidebar-nav ul .sidebar-item .first-level.hover, .sidebar-nav ul .sidebar-item .first-level:hover{
	 		font-size: 150%;
	 	} */

		/* a.sidebar-link has-arrow waves-effect waves-dark:hover, a.sidebar-link has-arrow waves-effect waves-dark:active{
			font-size: 200%;
		} */
/* 	    ul#sidebarnav:hover, ul#sidebarnav:active{ */
/* 	    	font-size: 150%; */
/* 	    } */
	    
/* 	    li.sidebar-item.a.sidebar-link:hover, li.sidebar-itema.sidebar-link:active{ */
/* 	    	font-size: 150%; */
/* 	    } */
	    
 	  /*   span.hide-menu {
	    	   text-shadow:
			    0 1px 0 #ffffff,
			    0 1.5px 0 #d3d5d6,
			    0 2px 0 #7c98a1,
			    0 2.5px 0 #4e727e,
			    2px 3px 4px rgba(0,0,0,0.1),
			    2px 3px 4px rgba(0,0,0,0.3);
			    color: white;
			    } */
		
	   
</style>

<!--left sidebar시작 !!  css는 sidebar.css 파일 참고 -->
<aside class="left-sidebar" id="theme" data-sidebarbg="skin5" style="background: white; ">

	<!-- 사이드바 스크롤-->
	<div class="scroll-sidebar" id="theme" style="background: white; ">
		<!-- Sidebar 네비게이션-->
		<nav class="sidebar-nav" >
			<ul id="sidebarnav" class="p-t-30" style="background: white;">
				<!-- 근태관리 -->
				<li class="sidebar-item" >
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="hr_attendance.html" aria-expanded="false" id="theme" class="sidebar-link" style="background: white;">
						<i class="m-r-10 mdi mdi-clipboard-account"></i>
						<span class="hide-menu">근태 관리</span>
					</a>

					<ul aria-expanded="false" class="collapse first-level" id="theme" style="background: white;">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/attendance.hari" class="sidebar-link">
								<i class="m-r-10 mdi mdi-account-multiple-outline"></i>
								<span class="hide-menu"> 근태 현황 </span>
							</a>
						</li>
						
						<se:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_PERSONNEL')">
							<li class="sidebar-item">
								<a href="${pageContext.request.contextPath}/1hariHr/personnel/taManagement.hari" class="sidebar-link">
									<i class="mdi mdi-calendar-check"></i>
									<span class="hide-menu"> 근태 관리 </span>
								</a>
							</li>
						</se:authorize>
						
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/annual.hari" class="sidebar-link">
								<i class="m-r-10 mdi mdi-animation"></i>
								<span class="hide-menu"> 연차 관리 </span>
							</a>
						</li>
						
					</ul>
				</li>
				<!--근태관리 끝 -->
				
				<!--인사관리-->
				<li class="sidebar-item" >
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="hr_attendance.html" aria-expanded="false" id="theme" class="sidebar-link" style="background: white;">
						<i class="m-r-10 mdi mdi-account-card-details"></i>
						<span class="hide-menu">인사 관리</span>
					</a>

					<ul aria-expanded="false" class="collapse first-level" id="theme" style="background: white;">
						<li class="sidebar-item">
							<a class="sidebar-link" id="employPopUp">
								<i class="m-r-10 mdi mdi-console"></i>
								<span class="hide-menu">재직 증명</span>
							</a>
						</li>
					<se:authorize access="hasAnyRole('ROLE_PERSONNEL', 'ROLE_ADMIN')">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/teamList.hari" class="sidebar-link">
								<i class="mdi mdi-emoticon-cool"></i>
								<span class="hide-menu">사원 조회</span>
							</a>
						</li>

						<!-- 권한처리 메뉴 : ROLE_ADMIN & ROLE_PERSONNEL-->
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/personnel/empList.hari" class="sidebar-link">
								<i class="mdi mdi-multiplication-box"></i>
								<span class="hide-menu">입퇴사관리</span>
							</a>
						</li>
					</se:authorize>
					</ul>
				</li>
				<!--인사관리 끝 -->

				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="m-r-10 mdi mdi-cash-usd"></i>
						<span class="hide-menu">급여 관리</span>
					</a>
					<ul aria-expanded="false" class="collapse  first-level" id="theme" style="background: #white;">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariPay/payList.hari" class="sidebar-link">
								<i class="m-r-10 mdi mdi-cash-multiple"></i>
								<span class="hide-menu">급여 현황</span>
							</a>
						</li>
					</ul>
				</li>

				<li class="sidebar-item" id="theme" style="background: white;">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" id="theme" class="sidebar-link" style="background: white;">
						<i class="m-r-10 mdi mdi-cellphone-link"></i>
						<span class="hide-menu">전자 결재</span>
					</a>
					
					<ul aria-expanded="false" class="collapse  first-level"  id="theme" style="background: white;">
						
						<li class="sidebar-item" >
                            <a href="${pageContext.request.contextPath}/1hariSign/signHome.hari" class="sidebar-link" >
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu">전자 결재</span>
							</a>
						</li>
						
						<se:authorize access="hasAnyRole('ROLE_ADMIN')">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariSign/admin/formList.hari" class="sidebar-link">
								<i class="m-r-10 mdi mdi-chart-timeline"></i>
								<span class="hide-menu">양식 관리</span>
							</a>
						</li>
						</se:authorize>
						<li class="sidebar-item">
							<a href="#" class="sidebar-link" data-toggle="modal" data-target="#draftModal">
							<i class="m-r-10 mdi mdi-clipboard-outline"></i>
							<span class="hide-menu">문서 기안</span>
							</a>
						</li>

						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariSign/myDocu.hari" class="sidebar-link">
								<i class="m-r-10 mdi mdi-clipboard-text"></i>
								<span class="hide-menu">내 문서함</span>
							</a>
						</li>
						<se:authorize access="hasAnyRole('ROLE_ADMIN')">
							<li class="sidebar-item">
								<a href="${pageContext.request.contextPath}/1hariSign/admin/adminDocu.hari" class="sidebar-link">
									<i class="m-r-10 mdi mdi-content-copy"></i>
									<span class="hide-menu">전체 문서함</span>
								</a>
							</li>
						</se:authorize>
						
					</ul>
				</li>

			</ul>
		</nav>
		<!-- Sidebar 네비게이션 끝 -->
	</div>
	<!-- Sidebar 스크롤 끝-->
</aside>
<!--left sidebar끝 !! css는 sidebar.css 파일 참고 -->

<!-- DRAFT Modal -->
<div class="modal fade" id="draftModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width: 250px;">
			<form action="${pageContext.request.contextPath}/1hariSign/docuDraft.hari">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">결재양식 선택 </h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div><!-- modal-header 끝 -->
			
				<div class="modal-body" style="height: 250px;">
					<div class="set_wrap">
						<section class="search">
<!-- 							<div class="search_wrap"> -->
<!-- 								<input id="searchInput" class="search" maxlength="20" type="text" placeholder="양식제목"> -->
<!-- 								<i class="fas fa-search" value="" title=""></i> -->
<!-- 							</div> -->
						</section>
					
						<div class="content_tab_wrap">
							<div id="formTree" class="jstree jstree-0 jstree-focused jstree-default">
								<ul>
									<li class="jstree-open" id="formlist">
										<i class="jstree-icon">&nbsp;</i>
										<a class="formcode" title="품의서" rel="FOLDER" href="#" data-bypass="1">
											<i class="far fa-folder-open">&nbsp;</i>품의서
										</a>
											
										<ul>	
<%-- 											<c:forEach var="form" items="${requestScope.list}"> --%>
<!-- 												문서1개 시작									 -->
<!-- 												<li class="jstree-leaf"> -->
<!-- 													<i class="jstree-icon">&nbsp;</i> -->
<%-- 													<a title="${form.signFormFormName}" rel="FORM" href="#" data-bypass="1"> --%>
<%-- 														<!-- <i class="far fa-file-alt">&nbsp;</i> -->${form.signFormFormName} --%>
<!-- 													</a> -->
<!-- 												</li> -->
<!-- 												문서1개 끝 -->
<%-- 											</c:forEach> --%>
										</ul>
										
									</li><!-- jstree-open 끝 -->
								</ul>
							</div> <!-- formTree 끝 -->
						</div> <!-- content_tab_wrap 끝 -->
					</div><!-- set_wrap 끝 -->
				</div><!-- modal-body 끝 -->
			
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="formChoice" style="color:#807266;" disabled="disabled">선택완료</button>
				</div><!-- modal-footer 끝 -->
				<input type="hidden" value="" id="signFormCode" name="signFormCode">
			</form>
		</div><!-- modal-content 끝 -->
	</div><!-- modal-dialog 끝 -->
</div><!--  draftModal 끝 -->