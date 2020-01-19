<template>
  <div class="container" style="margin-top:100px">
    <div class="row">
      <div class="col-sm-3"></div>
      <div class="col-sm-6">
        <div class="card shadow">
          <div class="card-body">
            <div class="form-group">
              <label for="writer">작성자</label>
              <input
                type="text"
                id="writer"
                v-model="server_data.writer"
                class="form-control"
                disabled="disabled"
              />
            </div>
            <div class="form-group">
              <label for="boardWriteDate">작성날짜</label>
              <input
                type="text"
                id="boardWriteDate"
                v-model="server_data.boardWriteDate"
                class="form-control"
                disabled="disabled"
              />
            </div>
            <div class="form-group">
              <label for="boardTitle">제목</label>
              <input
                type="text"
                id="boardTitle"
                v-model="server_data.boardTitle"
                class="form-control"
                disabled="disabled"
              />
            </div>
            <div class="form-group">
              <label for="boardContent">내용</label>
              <textarea
                id="boardContent"
                v-model="server_data.boardContent"
                class="form-control"
                rows="10"
                style="resize:none"
                disabled="disabled"
              ></textarea>
            </div>
            <div class="form-group" v-if='server_data.boardFileName != null'>
              <label for="boardFileName">첨부 이미지</label>
              <img :src="'upload/' + server_data.boardFileName" width="100%" />
            </div>
            <div class="form-group">
              <div class="text-right">
                <router-link :to="'/board_main/' + $route.params.board_idx + '/' + $route.params.page" class="btn btn-primary">목록보기</router-link>
                <router-link :to="'/board_modify/' + $route.params.board_idx + '/' + $route.params.page + '/' + $route.params.boardNum" class="btn btn-info">수정하기</router-link><!--v-if='server_data.content_writer_idx == $store.state.user_idx'-->
                <router-link :to="'/board_delete/' + $route.params.board_idx + '/' + $route.params.page + '/' + $route.params.boardNum" class="btn btn-danger">삭제하기</router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-3"></div>
    </div>
  </div>
</template>
<script>
module.exports = {
  data: function() {
    return {
      server_data:{}
    }
  },
  created() {//스크립트로 보자면, window.onload 와 비슷한 느낌 인스턴스가 작성된 후 동기적으로 호출됩니다.
  // 이 단계에서 인스턴스는 데이터 처리, 계산된 속성, 메서드, 감시/이벤트 콜백 등과 같은 옵션 처리를 완료합니다. 그러나 마운트가 시작되지 않았으므로 $el 속성을 아직 사용할 수 없습니다.

    var params = new URLSearchParams();
    params.append('boardNum', this.$route.params.boardNum)
    console.log(this.$route.params.boardNum)
	
    axios.post('get_content.hari', params).then((response)=>{
      this.server_data=response.data
      console.log(response.data.boardWriteDate)
    })
  },
};
</script>