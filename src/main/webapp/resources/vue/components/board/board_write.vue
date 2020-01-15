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
              <label for="boardWriter">작성자</label>
              <input type="text" id="boardWriter" class="form-control" /><!--v-model="board_subject" -->
            </div>
             <div class="form-group">
              <label for="bWriteDate">작성일</label>
              <input type="text" id="bWriteDate"  class="form-control" /><!--v-model="board_subject" -->
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
      boardContent: ""
    };
  },

  methods: {
    check_input: function() {
      if (this.boardTitle.length == 0) {
        alert("제목을 입력해주세요");
        $("#boardTitle").focus();
        return;
      }
      if (this.boardContent.length == 0) {
        alert("내용을 입력해주세요");
        $("#boardContent").focus();
        return;
      }

      var params = new FormData(); //파일까지 보낼 땐 formdata, 문자열만 보낼땐 urlsearchparams 사용
      //params.append('content_writer_idx', this.$store.state.user_idx)
      params.append('boardTitle', this.boardTitle)
      params.append('boardContent', this.boardContent)
      params.append('boardWriter', this.boardWriter)
      params.append('bWriteDate', this.bWriteDate)
      params.append('boardFileName', $('#boardFileName')[0].files[0])
      params.append('boardNum', this.$route.params.boardNum)

      axios.post('boardList.hari', params).then((response) =>{ //컨트롤러로 보냄 
        if(response.data.result==true){
          alert('저장되었습니다.')
            this.$router.push('/board_read/' + this.$route.params.boardCode + '/1/' + response.data.boardNum) //넘어가는 view단.. 보내는 곳 
        }else{                                                //게시판 번호                                                             //글번호 
          alert('작성실패' + response.data.result)
        } 
      })
    }
  }
};
</script>