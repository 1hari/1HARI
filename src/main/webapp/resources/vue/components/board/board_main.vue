<template>
  <!-- 게시글 리스트 -->
  <div class="container" style="margin-top:5%;">
    <div class="card shadow" style=" height: 500%;">
      <div class="card-body" style="height:700px;">

        <h4 class="card-title">{{server_data.boardName}}</h4> <!--게시판 이름 위에 서비스에서 지정한 이름으로 서버 데이타   가져오기 -->
        <table class="table table-hover" id="board_list" >
          <thead>
            <tr>
              <th class="text-center d-none d-md-table-cell">글번호</th>
              <th class="text-center d-none d-md-table-cell">제목</th>
              <th class="text-center d-none d-md-table-cell">글내용</th>
               <th class="text-center d-none d-md-table-cell">첨부파일</th>
              <th class="text-center d-none d-md-table-cell">작성자</th>
              <th class="text-center d-none d-md-table-cell">작성일</th>
            </tr>
          </thead>
          
          <tbody>
            <tr>
              <td class="text-center d-none d-md-table-cell">1</td>
              <td class="text-center d-none d-md-table-cell">2</td>
              <td class="text-center d-none d-md-table-cell">3</td>
              <td class="text-center d-none d-md-table-cell">4</td>
              <td class="text-center d-none d-md-table-cell">5</td>
              <td class="text-center d-none d-md-table-cell">6</td>
            </tr> 
          </tbody>

          <tbody>
            <tr v-for="a1 in server_data.board_list" :key="a1" > <!---->
              <td class="text-center d-none d-md-table-cell">{{a1.content_idx}}</td><!--글번호 -->
              <td @click="go_board_read(a1.content_idx)">{{a1.content_subject}}</td><!--제목-->
              <td class="text-center d-none d-md-table-cell">{{a1.content_writer_name}}</td><!--글내용-->
              <td class="text-center d-none d-md-table-cell">{{a1.content_writer_name}}</td><!--첨부파일-->
              <td class="text-center d-none d-md-table-cell">{{a1.content_writer_name}}</td><!--작성자-->
              <td class="text-center d-none d-md-table-cell">{{a1.content_date}}</td><!--작성일-->
            </tr>
          </tbody>
        </table>

        <div class="d-none d-md-block">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <router-link :to="'/board_main/' + $route.params.board_idx + '/' + server_data.pre" class="page-link">이전</router-link>
            </li>
            <li class="page-item" v-for="page in server_data.page_array" :key="page">
              <router-link :to="'/board_main/' + $route.params.board_idx + '/' + page" class="page-link">{{page}}</router-link>
              <!--여러개의 파라미터를 전달할 때 :to 사용-->
            </li>

            <li class="page-item">
              <router-link :to="'/board_main/' + $route.params.board_idx + '/' + server_data.next" class="page-link">다음</router-link>
            </li>
          </ul>
        </div>

        <!--글쓰기--> 
        <div class="text-right"> <!--v-if='$store.state.user_login_chk == 
        
        true'-->
          <router-link :to="'/board_write/' + $route.params.board_idx" class="btn btn-primary">글쓰기</router-link>
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
module.exports = {
  //템플릿 태그에서 여기에 있는 정보나 함수를 이용할 수 있음
  data: function() {
    return {
      //여기안에 있는 멤버들을 템플릿 안에서 사용할 수 있음
      server_data: {}
    };
  },
  methods: { //함수 
    go_board_read: function(content_idx) {
      alert(content_idx)	
      //this.$router router 객체 불러오기
      this.$router.push('/board_read/' + this.$route.params.board_idx + '/' + this.$route.params.page + '/' + content_idx) //.push에 파라미터값에 알맞는 컴포넌트를 찾아 그 컴포넌트 주소로 이동시켜줌
    },                  
    get_board_data: function() {
      var params = new URLSearchParams();
      params.append("board_idx", this.$route.params.board_idx);
      params.append("page", this.$route.params.page)
      axios.post("get_board_list.hari", params).then((response)=>{ //컨트롤러로 보내는, 앞에 이름이 컨트롤러를 찾아가는 경로이름이 된다 
      console.log(response.data)
        this.server_data=response.data
      })
    }
  },
  created() {
    //alert(this.$route.params.board_idx)//주소를 관리하는 객체 route, 주소가 바뀌면 route객체도 변경됨, route객체의 변경을 감지해줘야함
    this.get_board_data();
  },
  watch: {
    $route(to, from) {
      this.get_board_data();
    }
  }
};
</script>
