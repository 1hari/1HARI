<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--left sidebar시작 !!  css는 sidebar.css 파일 참고 -->
<aside class="left-sidebar" data-sidebarbg="skin5">

	<!-- 사이드바 스크롤-->
	<div class="scroll-sidebar">
	
		<!-- Sidebar 네비게이션-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav" class="p-t-30">
			
				<!--인사관리-->
				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="hr_attendance.html" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">인사관리</span>
					</a>
					
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/attendance.hari" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 근태관리 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/annual.hari" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 연차관리 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="hr_proof.jsp" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 재직증명 </span>
							</a>
						</li>
						
						<!-- 권한처리 메뉴 : ROLE_ADMIN & ROLE_PERSONNEL-->
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariHr/personnel/empList.hari" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 입사 & 퇴사관리 </span>
							</a>
						</li>

					</ul>
				</li>
				<!--인사관리 끝 -->
				
				<!--조직관리 시작-->
				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">조직관리</span>
					</a>
					
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-outline"></i>
								<span class="hide-menu">조직도 조회 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu">조직도 설정 </span>
							</a>
						</li>
					</ul>
				</li>
				<!--조직관리 끝-->

				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">급여 관리 </span>
					</a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariPay/payList.hari" class="sidebar-link">
								<i class="mdi mdi-note-outline"></i>
								<span class="hide-menu">급여조회 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 급여명세서 조회 </span>
							</a>
						</li>
					</ul>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">전자 결재 </span>
					</a>
					
					<ul aria-expanded="false" class="collapse  first-level">
						
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariSign/signForm.hari" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu">전자결재</span>
							</a>
						</li>
						
						<!-- ROLE_ADMIN -->
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariSign/admin/formInsert.hari" class="sidebar-link">
								<i class="mdi mdi-note-outline"></i><span class="hide-menu">양식 등록 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a class="sidebar-link" data-toggle="modal" data-target="#draftModal">
							<i class="mdi mdi-note-plus"></i>
							<span class="hide-menu">문서기안</span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="${pageContext.request.contextPath}/1hariSign/myDocu.hari" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu">내 문서함</span>
							</a>
						</li>
						
					</ul>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">커뮤 니티 </span>
					</a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-outline"></i>
								<span class="hide-menu">공지 사항 </span>
							</a>
						</li>
						
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-plus"></i>
								<span class="hide-menu"> 부서 게시판 </span>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
						<i class="mdi mdi-receipt"></i>
						<span class="hide-menu">사내 메일 </span>
					</a>
					<ul aria-expanded="false" class="collapse  first-level">
						<li class="sidebar-item">
							<a href="#" class="sidebar-link">
								<i class="mdi mdi-note-outline"></i>
								<span class="hide-menu">메일 목록 </span>
							</a>
						</li>
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
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">결재양식 선택 </h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">반으로 갈라 조직도와 품의서 종류를 올려볼까
				<div class="set_wrap">
					<div class="set_nav" id="appr_form_searchTree">
						<form onsubmit="return false;">
							<section class="search">
								<div class="search_wrap">
									<input id="searchInput" class="search" maxlength="20" type="text" placeholder="양식제목">
									<input class="btn_search" type="button" value="" title="" evt-rol="mail-search">
								</div>
								
								<div id="detailSearchLayerWrap" style="position:relative;display:none;z-index:60">
								</div>
							</section>
						</form>
						
						<div class="content_tab_wrap">
							<div id="formTree" class="jstree jstree-0 jstree-focused jstree-default">
								<ul>
									<li class="jstree-open">
										<ins class="jstree-icon">&nbsp;</ins>
										<a title="일반" rel="FOLDER" nodeid="21" href="#" data-bypass="1" class="">
											<ins class="jstree-icon">&nbsp;</ins>일반
										</a>
											
										<ul>
											<li class="jstree-leaf">
												<ins class="jstree-icon">&nbsp;</ins>
												<a title="업무기안" rel="FORM" nodeid="784" href="#" data-bypass="1" class="">
													<ins class="jstree-icon appr_form">&nbsp;</ins>업무기안
												</a>
											</li>
													
											<li class="jstree-leaf">
												<ins class="jstree-icon">&nbsp;</ins>
												<a title="업무협조" rel="FORM" nodeid="799" href="#" data-bypass="1">
													<ins class="jstree-icon appr_form">&nbsp;</ins>업무협조
												</a>
											</li>
													
											<li class="jstree-leaf">
												<ins class="jstree-icon">&nbsp;</ins>
												<a title="일반품의서" rel="FORM" nodeid="689" href="#" data-bypass="1" class="">
													<ins class="jstree-icon appr_form">&nbsp;</ins>일반품의서
												</a>
											</li>
													
											<li class="jstree-last jstree-leaf">
												<ins class="jstree-icon">&nbsp;</ins>
												<a title="회계(입금,출금,대체)품의서" rel="FORM" nodeid="688" href="#" data-bypass="1" class="">
													<ins class="jstree-icon appr_form">&nbsp;</ins>회계(입금,출금,대체)품의서
												</a>
											</li>
													
										</ul>
									</li>
											
								</ul>
								<li class="jstree-last jstree-leaf">
									<ins class="jstree-icon">&nbsp;</ins>
									<a title="테스트양식" rel="FORM" nodeid="768" href="#" data-bypass="1">
										<ins class="jstree-icon appr_form">&nbsp;</ins>테스트양식
									</a>
								</li>
							</div>
							<div id="searchResult" style="min-height: 150px; max-height: 375px; display: none;">
								<div class="jstree jstree-default" style="border-bottom:1px dashed #c8c8c8;margin:5px;display:block">
									<ul class="mail_folder"></ul>
								</div>
							</div>
						</div>
					</div>
				
					<!-- 문서정보 form_detail -->
					<div class="doc_info">
						<div class="tit_type2">상세정보</div>
						<form>
							<fieldset>
								<table id="form_detail" class="form_type tb_doc_info">
									<tbody id="form_detail_tbody">
										<tr>
											<th><span class="title">제목</span></th>
											<td></td>
										</tr>
										<tr>
											<th><span class="title">전사문서함</span></th>
											<td></td>
										</tr>
										<tr>
											<th><span class="title">보존연한</span></th>
											<td>
											</td>
										</tr>
									<!-- 	<tr>
											<th><span class="title">설명</span></th>
											<td></td>
										</tr> -->
										<tr>
											<th><span class="title">기안부서</span></th>
											<td></td>
										</tr>
										<tr>
									        <th><span class="title">부서문서함</span></th>
									        <td></td>
									    </tr>
									</tbody>
								</table>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<a href="${pageContext.request.contextPath}/1hariSign/docuDraft.hari" class="btn btn-primary">선택완료</a>
			</div>
			
		</div>
	</div>
</div>