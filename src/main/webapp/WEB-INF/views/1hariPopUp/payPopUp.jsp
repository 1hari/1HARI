<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/http-vue-loader@1.4.1/src/httpVueLoader.min.js"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<c:set var="year" value="${requestScope.year}" />
<c:set var="month" value="${requestScope.month}" />

<style>
	body, input, p, span, option, label, select, button, .wizard-content {
		font-family :맑은고딕,monospace;
		font-size : 1.3rem;
		font-weight : inherit;
	}
	
	.draft > td{
		border-color:#000000;
		border-style:solid;
		border-width:1px 1px 1px;
		width: 80px;
	}
</style>
<!-- 급여 조회 -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<!-- vue.js 코드 contents (webapp/vue folder 안에서 이루어짐) -->
<div class="page-wrapper" style="margin-left: 0%;">
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div id='app'>
					<router-view></router-view> <!-- 급여조회 -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<script>
	var contextPath = '${pageContext.request.contextPath}';
  	var year ='${year}'
	var month ='${month}'
</script>
<script src="${pageContext.request.contextPath}/resources/vue/js/vue-router.js"></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/payPopUpRouter.js'></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/app.js'></script>