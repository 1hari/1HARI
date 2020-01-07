<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/http-vue-loader@1.4.1/src/httpVueLoader.min.js"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
	var contextPath = '${pageContext.request.contextPath}';
	console.log(contextPath);
</script>

<script src="${pageContext.request.contextPath}/resources/vue/js/vue-router.js"></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/router.js'></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/app.js'></script>
<style>
	#board_list>tbody>tr {
		cursor: pointer;
	}
</style>

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<div id='app'>
		<router-view></router-view>
	</div>
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->