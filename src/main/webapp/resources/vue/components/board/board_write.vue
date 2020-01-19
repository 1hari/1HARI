<template>
  <div class="container" style="margin-top:100px">
    <div class="row">
      <div class="col-sm-3"></div>
      <div class="col-sm-6">
        <div class="card shadow">
          <div class="card-body">
            <div class="form-group">
              <label for="boardTitle">제목</label>
              <input type="text" id="boardTitle" v-model="boardTitle" class="form-control" />
            </div>
            <div class="form-group">
              <label for="boardContent">내용</label>
              <textarea
                id="boardContent"
                v-model="boardContent"
                class="form-control"
                rows="10"
                style="resize:none"
              ></textarea>
            </div>
              <div class="form-group">
              <label for="writer">작성자</label>
              <input type="text" id="writer" v-model="writer" class="form-control" />
            </div>
            <div class="form-group">
              <label for="boardFileName">첨부 이미지</label>
              <input
                type="file"
                id="boardFileName"
                name="boardFileName"
                class="form-control"
                accept="image/*"
              />
            </div>
            <div class="form-group">
              <div class="text-right">
                <button type="button" class="btn btn-primary" @click="check_input">작성하기</button>
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
      boardTitle: "",
      boardContent: "",
      writer: ""
    };
  },

  methods: {
    check_input: function() {
      if (this.board_subject.length == 0) {
        alert("제목을 입력해주세요");
        $("#boardTitle").focus();
        return;
      }
      if (this.board_content.length == 0) {
        alert("내용을 입력해주세요");
        $("#boardContent").focus();
        return;
      }

      var params = new FormData(); //파일까지 보낼 땐 formdata, 문자열만 보낼땐 urlsearchparams 사용
      //params.append('content_writer_idx', this.$store.state.user_idx)
      params.append('boardTitle', this.boardTitle)
      params.append('boardContent', this.boardContent)
      params.append('writer', parseInt(this.writer))
      params.append('boardFileName', $('#board_file')[0].files[0])
    //  params.append('content_board_idx', this.$route.params.board_idx)

      axios.post('add_content.hari', params).then((response) =>{
        if(response.data.result==true){
          alert('저장되었습니다.')
          this.$router.push('/board_read/' + this.$route.params.board_idx + '/1/' + response.data.boardNum)
        }else{
          alert('작성실패' + response.data.result)
        }
      })
    }
  }
};
</script>