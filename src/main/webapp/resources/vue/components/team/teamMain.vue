<template>
  <!-- 사원조회 리스트 -->
  <div class="container" style="margin-top:4%; width:150%;">
    <div class="card shadow" style=" border-radius:10px; box-shadow :7px 7px #505050; margin-left: -8%; width:115%; ">
      <div class="card-body" style=" border-radius:10px; box-shadow :7px 7px #505050; ">
        
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <div class="col-md-1">
              </div>
              <div class="col-md-7">
                <div class="row">

                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="searchCheck" id="customControlAutosizing1" value="empNum" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing1">사번</label>
                  </div>
                  
                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="searchCheck" id="customControlAutosizing2" value="empName" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing2">이름</label>
                  </div>
                  
                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="searchCheck" id="customControlAutosizing3" value="teamName" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing3">소속</label>
                  </div>

                  <div class="custom-control custom-checkbox col-md-3">
                    <input type="checkbox" class="custom-control-input" v-model="searchCheck" id="customControlAutosizing4" value="phoneNum" checked="checked">
                      <label class="custom-control-label" for="customControlAutosizing4">연락처</label>
                  </div>

                </div>
              </div>

              <div class="col-md-4">
                <input type="search" class="form-control form-control-sm" placeholder="검색어를 입력하세요." v-model="searchKey">
              </div>								
            </div>
          </div>
        </div>
		
        <table class="table table-hover table-bordered" id="zero_config" style="margin-top:3%;">
          <thead style = "background-color: #e9ecef;">
            <tr>
              <th class="text-center d-none d-md-table-cell" >사번</th>
              <th class="text-center d-none d-md-table-cell" >이름</th>
              <th class="text-center d-none d-md-table-cell" >소속</th>
              <th class="text-center d-none d-md-table-cell" >직급</th>
              <th class="text-center d-none d-md-table-cell" >직책</th>
              <th class="text-center d-none d-md-table-cell" >재직구분</th>
              <th class="text-center d-none d-md-table-cell" >연락처</th>
              <th class="text-center d-none d-md-table-cell" style="width=50%">이메일</th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="(emp, index) in server_data.empList" >
              <td class="text-center d-none d-md-table-cell" style="width: 10%;">{{emp.empNum}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 10%;">{{emp.empName}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 10%;">{{emp.teamName}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 10%;">{{emp.rankName}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 15%;">{{emp.positionName}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 10%;">{{emp.employmentName}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 15%;">{{emp.phoneNum}}</td>
              <td class="text-center d-none d-md-table-cell" style="width: 20%;">{{emp.email}}</td>
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

	
	.table-bordered td,
	.table-bordered th {
		border: 2px solid #505050;
		height: 45px;
	}
	
	
	page-item.active .page-link {
		z-index: 1;
		color: #807266;
		background-color: #ffffff;
		border-color: #807266;
		border: 2px solid #807266;
		
	}
	
	.page-item.disabled .page-link {
		color: #807266;
		pointer-events: none;
		cursor: auto;
		background-color: #fff;
		border-color: #dee2e6;
 	}
	
</style>

<script>
	module.exports = {
	  //템플릿 태그에서 여기에 있는 정보나 함수를 이용할 수 있음
	  data: function() {
	    return {
	      //여기안에 있는 멤버들을 템플릿 안에서 사용할 수 있음
	      server_data: {},
	      searchCheck : [],
	      searchKey : ''
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
	      
	      params.append("searchCheck", this.searchCheck)
	      params.append("searchKey", this.searchKey)
	      
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
	  computed : {
	  	watchTarget : function(){
	  		return [this.searchKey, this.searchCheck]
	  	}
	  },
	  watch: {
	    $route(to, from) {
	      this.getEmpList();
	    },
	    watchTarget : function(){
	    	console.log(this.searchKey);
	    	console.log(this.searchCheck);
	    	
	    	var params = new URLSearchParams();
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
	      params.append("searchCheck", this.searchCheck)
	      params.append("searchKey", this.searchKey)
	      
	    	axios.post(contextPath+"/ajax/getEmpList.hari",params).then((response)=>{
	        //console.log(response.data)
	        this.server_data=response.data
	      })
	    }
	  }
	};
</script>