<template>
  <!-- pay 급여조회 -->
  <div class="container" style="margin-top:5%;">
    <div class="card shadow" style=" height: 500%;">
      <div class="card-body" >
        <h4 class="card-title">급여</h4>
        <div style = "margin-left:85%;">
           <span>사번: {{server_data.empNum}}</span>
            <select style = "margin-left:10%;" id="selectYear" @change="getPayList($event)">
              <option  v-for="(a1, index) in server_data.years"  v-bind:selected="index == 0">{{a1}}</option>
            </select>
            
        </div>
        
        <table class="table table-hover" id="payList" >
          <thead>
            <tr>
              <th class="text-center d-none d-md-table-cell">지급일</th>
              <th class="text-center d-none d-md-table-cell">기본급</th>
              <th class="text-center d-none d-md-table-cell">국민연금</th>
              <th class="text-center d-none d-md-table-cell">건강보험</th>
              <th class="text-center d-none d-md-table-cell">장기요양보험</th>
              <th class="text-center d-none d-md-table-cell">고용보험</th>
              <th class="text-center d-none d-md-table-cell">소득세</th>
              <th class="text-center d-none d-md-table-cell">지방소득세</th>
              <th class="text-center d-none d-md-table-cell">공제금액</th>
              <th class="text-center d-none d-md-table-cell">실급여</th>
              <th class="text-center d-none d-md-table-cell">급여명세</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="pay in server_data.payList" >
              <td class="text-center d-none d-md-table-cell" style="height=20px">{{pay.payMonth}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.basicSal}}</td><!--기본급으로 받으세요 -->
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td><!--실급여로 데이터 받으세요 -->
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td><!--실급여로 데이터 받으세요 -->
              <td class="text-center d-none d-md-table-cell"><button class ="btn btn-sucess" style = "background-color: #2ab2aa; text-color:white; height:70%; " >급여명세</button></td>
            </tr>
          </tbody>
          
          <tbody>
            <tr v-for="a1 in server_data.board_list" >
              <td class="text-center d-none d-md-table-cell">{{a1.content_idx}}</td>
              <td @click="go_board_read(a1.content_idx)">{{a1.content_subject}}</td>
              <td class="text-center d-none d-md-table-cell">{{a1.content_writer_name}}</td>
              <td class="text-center d-none d-md-table-cell">{{a1.content_date}}</td>
            </tr>
          </tbody>
        </table>

        <!--글쓰기--> 
        <div class="text-right" v-if='$store.state.user_login_chk == true'>
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
      server_data: {},
    };
  },
  methods: {
    go_board_read: function(content_idx) {
      alert(content_idx)	
      //this.$router router 객체 불러오기
      this.$router.push('/board_read/' + this.$route.params.board_idx + '/' + this.$route.params.page + '/' + content_idx) //.push에 파라미터값에 알맞는 컴포넌트를 찾아 그 컴포넌트 주소로 이동시켜줌
    },
    getPayList: function() {
       var params = new URLSearchParams();
       if(event.target.value ==undefined){
        params.append("year", "init")
       }else {
         params.append("year", event.target.value)
       }
       axios.post("getPayList.hari", params).then((response)=>{
         this.server_data=response.data
          console.log(this.server_data)
      })
     
    },
    // onChange: function(event){
    //   console.log(event.target.value);
    //   var params = new URLSearchParams();
    //   params.append("year", event.target.value)
    //   axios.post("getPayListYear.hari", params).then((response)=>{
    //     this.server_data=response.data
    //   })
    // }
  },
  created() {
    // alert(this.$route.params.board_idx) //주소를 관리하는 객체 route, 주소가 바뀌면 route객체도 변경됨, route객체의 변경을 감지해줘야함
    this.getPayList();
  },
  watch: {
    $route(to, from) {
      this.getPayList();
    }
  }
};
</script>
<style>
	.table td{
		padding: 3px
		}
</style>
