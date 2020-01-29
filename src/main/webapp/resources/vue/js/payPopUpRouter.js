//여기서 만드는이유는 로그인 여부값을 라우터에 등록된 부분에서 사용할것이기 때문
	//+ cdn을 app.js가 더 밑에 있기때문에 router.js에서 인식 못할수도있음
var store = new Vuex.Store({
	state : {//정해진 이름으로 state를 써줘야함
		user_login_chk : false,
		user_id : '',
		user_name : '',
		user_idx : 0
	}
	//이렇게 만들어주고 app.js 가서 store를 등록해주면 모든 vue 어플리케이션에서 사용할 수 있음
})

var router = new VueRouter({
	routes : [
		{
			path : '/',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payRead.vue')
		},
		{
			path : '/board_main/:board_idx/:page',
			component : httpVueLoader(contextPath+'/resources/vue/components/board/board_main.vue')
		},
		{
			// '/payRead/' + year + '/' + month
			path : '/payRead/:year/:month',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payRead.vue')
		},
		{
			path : '/board_modify/:board_idx/:page/:content_idx',
			component : httpVueLoader(contextPath+'/resources/vue/components/board/board_modify.vue')
		},
		{
			path : '/board_delete/:board_idx/:page/:content_idx',
			beforeEnter(to, from, next){ //이전에 어디였고 어디를 요청했음, 함수
				//to => :board_idx/:page/:content_idx' 파라미터들의 값을 갖고있음
				var params = new URLSearchParams()
				params.append('content_idx', to.params.content_idx)

				axios.post('delete_content.do', params).then((response) =>{
					alert('삭제되었습니다.')
					next('/board_main/' + to.params.board_idx+'/'+to.params.page)
				})
			}
		},
		{
			path : '/board_write/:board_idx',
			component : httpVueLoader(contextPath+'/resources/vue/components/board/board_write.vue')
		},
		{
			path : '/login',
			component : httpVueLoader(contextPath+'/resources/vue/components/user/login.vue')
		},
		{
			path : '/join',
			component : httpVueLoader(contextPath+'/resources/vue/components/user/join.vue')
		},
		{
			path : '/user_modify',
			component : httpVueLoader(contextPath+'/resources/vue/components/user/user_modify.vue')
		},
		{
			path : '/logout',
			beforeEnter(to, from, next){ //이전에 어디였고 어디를 요청했음, 함수
				alert('로그아웃 되었습니다')
				
				store.state.user_login_chk = false
				store.state.user_id = ''
				store.state.user_name = ''
				store.state.user_idx = 0
				
				sessionStorage.clear()
				
				next('/')
			}
		}
	],
	scrollBehavior(to, from, savedPosition){
		return {
			x : 0,
			y : 0
		}
	}
})







