

$(function(){
	console.log(contextPath);
	var app = new Vue({
		el : '#app',
		components : {
			'top-menu' : httpVueLoader(contextPath+'/resources/vue/components/common/top_menu.vue'),
			'bottom-info' : httpVueLoader(contextPath+'/resources/vue/components/common/bottom_info.vue')
		},
		router : router,//(router.js) 등록한 객체를 이용 해 원하는 정보를 이용할 수 있음
		store : store,
		beforeCreate : function(){
            console.log(sessionStorage.user_login_chk +'허허허')
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