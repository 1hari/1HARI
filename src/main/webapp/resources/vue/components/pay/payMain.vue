<template>
  <!-- pay 급여조회 -->

  <div class="container" style="margin-top:4%; width:150%;">
    <div class="card" style=" border-radius:10px; box-shadow :7px 7px #505050; margin-left: -8%; width:115%; ">
      <div class="card-body" style=" border-radius:10px; box-shadow :7px 7px #505050; " >

        <div style = "margin-left:85%;">
           <span>사번: {{server_data.empNum}}</span>
            <select style = "margin-left:25%; border: 2px solid #807266;" id="selectYear" @change="getPayList($event)">
              <option  v-for="(a1, index) in server_data.years"  v-bind:selected="index == 0">{{a1}}</option>
            </select>
            
        </div>
        
        <table class="table table-hover table-bordered" id="payList" style="margin-top:3%;">
        
          <thead>
            <tr style = "background-color: #e9ecef ">
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
            <tr v-for="(pay, index) in server_data.payList">
              <td class="text-center d-none d-md-table-cell" style="height=20px">{{pay.payMonth}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.basicSal}}</td><!--기본급으로 받으세요 -->
              <td class="text-center d-none d-md-table-cell">{{pay.payNPension}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payHInsurance}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payCInsurance}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.empInsurance}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{pay.payLIncomeTax}}</td>
              <td class="text-center d-none d-md-table-cell">{{totalDeduction}}</td><!--실급여로 데이터 받으세요 -->
              <td class="text-center d-none d-md-table-cell">{{realAmount}}</td><!--실급여로 데이터 받으세요 -->
              <td class="text-center d-none d-md-table-cell"><button class ="btn-success" style = "background-color: white; color:black; border-radius:5px border:2px solid #807266; font-weight:bold; height:70%;" @click="payRead(splitPayMonth[index][0],splitPayMonth[index][1])">급여명세</button></td>
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
      </div>
    </div>
      <form action="getPayPopUp.hari" method="POST" id='form'>
        <input type="text" hidden="hidden" name="year" id="year" value="">
        <input type="text" hidden="hidden" name="month" id="month" value="">
      </form>
  </div>


</template>
<style>

 	.table-bordered td,
	.table-bordered th {
		border: 1px solid #505050;
		height: 45px;
	}

</style>
<script>
module.exports = {
  //템플릿 태그에서 여기에 있는 정보나 함수를 이용할 수 있음
  data: function() {
    return {
      //여기안에 있는 멤버들을 템플릿 안에서 사용할 수 있음
      server_data: {},
      splitPayMonth:[],
      totalDeduction:'',
      realAmount:'',
    };
  },
  methods: {
    payRead: function(year, month) {
       var url ="getPayPopUp.hari?year=" + year +"&month="+ month;
       open(url, "급여 명세서", "statusber=no, scrollbar=no, menuber=no, width=1000, height=1100 1000=500 left=530");
    },
    getPayList: function() {
       var params = new URLSearchParams();
       if(event.target.value ==undefined){ //연도 따로 설정안했을경우(첫 로딩 시)
         console.log(event.target.value)
        params.append("year", "init")
       }else { //선택한 연도가 있을경우
         params.append("year", event.target.value)
       }

      axios.post(contextPath + "/ajax/getPayList.hari", params).then((response)=>{
      
      this.server_data=response.data
      this.totalDeduction=numeral(this.server_data.payList[0].payNPension + this.server_data.payList[0].payHInsurance + this.server_data.payList[0].payCInsurance +  this.server_data.payList[0].empInsurance + this.server_data.payList[0].payIncomeTax + this.server_data.payList[0].payLIncomeTax).format( '₩0,0' )
      this.realAmount=numeral(this.server_data.payList[0].basicSal -  (this.server_data.payList[0].payNPension + this.server_data.payList[0].payHInsurance + this.server_data.payList[0].payCInsurance +  this.server_data.payList[0].empInsurance + this.server_data.payList[0].payIncomeTax + this.server_data.payList[0].payLIncomeTax)).format( '₩0,0' )
      pays=response.data.payList
      console.log(pays);
      this.splitPayMonth=[]
      pays.forEach(pay => {
        pay.basicSal = numeral(pay.basicSal).format( '₩0,0' )
        pay.payNPension = numeral(pay.payNPension).format( '₩0,0' )
        pay.payHInsurance = numeral(pay.payHInsurance).format( '₩0,0' )
        pay.payCInsurance = numeral(pay.payCInsurance).format( '₩0,0' )
        pay.empInsurance = numeral(pay.empInsurance).format( '₩0,0' )
        pay.payIncomeTax = numeral(pay.payIncomeTax).format( '₩0,0' )
        pay.payLIncomeTax = numeral(pay.payLIncomeTax).format( '₩0,0' )
        this.splitPayMonth.push(pay.payMonth.split("-"))
        console.log(this.splitPayMonth)
      });
      })
     
    },
  },
  created() {
    // alert(this.$route.params.board_idx) //주소를 관리하는 객체 route, 주소가 바뀌면 route객체도 변경됨, route객체의 변경을 감지해줘야함
    this.getPayList();
  },
};
</script>
<style>
   .table td{
      padding: 3px
      }
</style>