<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/http-vue-loader@1.4.1/src/httpVueLoader.min.js"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/hari/customjs/1hariPay/payList.js"></script> --%>
<script>
	var contextPath = '${pageContext.request.contextPath}';
</script>

<script src="${pageContext.request.contextPath}/resources/vue/js/vue-router.js"></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/payRouter.js'></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/app.js'></script>
<style>
	#board_list>tbody>tr {
		cursor: pointer;
	}
</style>
<!-- 급여 조회 -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<!-- vue.js 코드 contents (webapp/vue folder 안에서 이루어짐) -->
<div class="page-wrapper" style= "height:800px;">
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
