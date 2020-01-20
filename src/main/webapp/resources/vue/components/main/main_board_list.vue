<template>

<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div class="col-lg-9" style="margin-top:10%; margin-left:10%; margin-right: 10%; text-align: center;">
					<div class="card shadow">
						<div class="card-body">
							<h4 class="card-title">{{server_data.boardName}}</h4> <!--service단에서 // 해당 게시판 정보 가져오기 가세요 -->
							<table class="table table-hover" id='board_list'>
								<thead>
									<tr>
											<th class="text-center w-25">글번호</th>
											<th>제목</th>
											<th class="text-center w-25 d-none d-xl-table-cell">작성날짜</th>
										
									</tr>
								</thead>
								<tbody>
									<tr v-for="a1 in server_data.board_list" :key="a1"> 
										<td class="text-center">{{a1.boardNum}}</td>
										<td @click="go_board_read(a1.boardNum)">{{a1.boardTitle}}</td>
										<td class="text-center d-none d-xl-table-cell">{{a1.boardWriteDate}}</td>
									</tr>
								</tbody>
							</table>
							
							<router-link :to="'/board_main/' + boardNum +'/1'" class="btn m-t-5 btn-info btn-block waves-effect waves-light">더보기</router-link>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</template>
<style>
#board_list > tbody > tr {
  cursor: pointer;
}
</style>
<script>
module.exports={
  	data:function(){
		return{
			server_data:{}
		}
  },
  props:['boardNum'],
  methods: {
    go_board_read:function(boardNum){
      this.$router.push('/board_read/' + this.boardNum + '/1/' + boardNum)
	}
  },
  created() {
	  var params = new URLSearchParams()
	  params.append('boardNum', this.boardNum)

	  axios.post('add_content.hari', params).then((response)=>{
		  this.server_data=response.data
	  })

  },
}

</script>