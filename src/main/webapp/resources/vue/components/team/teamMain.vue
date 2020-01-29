<template>
  <!-- 사원조회 리스트 -->
  <div class="container" style="margin-top:5%;">
    <div class="card shadow" style=" height: 500%;  border-radius:10px; border : 4px groove #bcbcbc;">
      <div class="card-body">
        
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <div class="col-md-1">
              </div>
              <div class="col-md-7">
                <div class="row">

                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="data.searchCheck" id="customControlAutosizing1" value="empNum" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing1">사번</label>
                  </div>
                  
                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="data.searchCheck" id="customControlAutosizing2" value="empName" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing2">이름</label>
                  </div>
                  
                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="data.searchCheck" id="customControlAutosizing3" value="teamName" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing3">소속</label>
                  </div>

                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="data.searchCheck" id="customControlAutosizing4" value="phoneNum" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing4">연락처</label>
                  </div>

                </div>
              </div>

              <div class="col-md-4">
                <input type="search" class="form-control form-control-sm" placeholder="검색어를 입력하세요." v-model="data.searchKey">
              </div>
									
            </div>
          </div>
        </div>

        <table class="table table-hover" id="zero_config" >
          <thead>
            <tr>
              <th class="text-center d-none d-md-table-cell">사번</th>
              <th class="text-center d-none d-md-table-cell">이름</th>
              <th class="text-center d-none d-md-table-cell">소속</th>
              <th class="text-center d-none d-md-table-cell">직급</th>
              <th class="text-center d-none d-md-table-cell">직책</th>
              <th class="text-center d-none d-md-table-cell">재직구분</th>
              <th class="text-center d-none d-md-table-cell">연락처</th>
              <th class="text-center d-none d-md-table-cell">이메일</th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="(emp, index) in server_data.empList" >
              <td class="text-center d-none d-md-table-cell" style="height=20px">{{emp.empNum}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.empName}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.teamName}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.rankName}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.positionName}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.employmentName}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.phoneNum}}</td>
              <td class="text-center d-none d-md-table-cell">{{emp.email}}</td>
            </tr> 
          </tbody>

        </table>

        <div class="d-none d-md-block">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <router-link :to="'/teamMain/' + $store.state.pg + '/' + 1" class="page-link"><<</router-link>
            </li>

            <li class="page-item" v-for="page in server_data.page" :key="page">
              <router-link :to="'/teamMain/' + $store.state.pg + '/' + page" class="page-link">{{page}}</router-link>
              <!--여러개의 파라미터를 전달할 때 :to 사용-->
            </li>

            <li class="page-item">
              <router-link :to="'/teamMain/' + $store.state.pg + '/' + server_data.lastPage" class="page-link">>></router-link>
            </li>
          </ul>
        </div>

      </div>
    </div>
  </div>
</template>
<style>
#zero_config > tbody > tr {
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
      data : {
        searchCheck : [],
        searchKey : ''
      }
    };
  },
  methods: {
    getEmpList: function() {
      var params = new URLSearchParams(); //URL에 붙어오는 parameter를 구분할 수 있다.
      //console.log(this.$route.params.pg == undefined );

      if(this.$route.params.pg == undefined){
        params.append("pg", this.$store.state.pg)
      }else {
        params.append("pg", this.$route.params.pg)
      }
      
      if(this.$route.params.cp == undefined){
        params.append("cp", this.$store.state.cp)
      }else {
        params.append("cp", this.$route.params.cp)
      }
      
      //console.log(contextPath);
      axios.post(contextPath+"/ajax/getEmpList.hari",params).then((response)=>{
        //console.log(response.data)
        this.server_data=response.data
      })
    }
  },
  created() {
    //alert(this.$route.params.board_idx) //주소를 관리하는 객체 route, 주소가 바뀌면 route객체도 변경됨, route객체의 변경을 감지해줘야함
    this.getEmpList();
  },
  watch: {
    $route(to, from) {
      this.getEmpList();
    }
  }
};
</script>