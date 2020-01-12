

$(function(){
	var app = new Vue({
		el : '#app',
		router : router,//(router.js) 등록한 객체를 이용 해 원하는 정보를 이용할 수 있음
		store : store,
		beforeCreate : function(){
			if(sessionStorage.user_login_chk != undefined){
				if(sessionStorage.user_login_chk == 'true'){
					this.$store.state.user_login_chk = true
				}
				
				this.$store.state.user_id = sessionStorage.user_id
				this.$store.state.user_name = sessionStorage.user_name
				this.$store.state.user_idx = parseInt(sessionStorage.user_idx)
			}
		}
	})
})