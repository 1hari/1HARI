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