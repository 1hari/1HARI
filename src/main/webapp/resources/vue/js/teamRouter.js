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
			component : httpVueLoader(contextPath+'/resources/vue/components/team/teamMain.vue')
		}
	],
	scrollBehavior(to, from, savedPosition){ //이전화면으로 돌아갈때 스크롤 위치 기억
		return {
			x : 0,
			y : 0
		}
	}
})







