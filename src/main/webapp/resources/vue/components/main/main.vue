<template>
    <!-- 게시판 미리보기 부분 -->
<div class="container" style="margin-top:100px">
	<div class="row">
		<main-board-list v-bind:board_idx="1"></main-board-list> <!--공지사항 게시판-->
		<main-board-list v-bind:board_idx="2"></main-board-list> <!--부서별 게시판 -->	
	</div>
</div>
</template>
<script>
	module.exports={
		components:{
			'main-board-list': httpVueLoader(contextPath+'/resources/vue/components/main/main_board_list.vue')
		}
	}
</script>