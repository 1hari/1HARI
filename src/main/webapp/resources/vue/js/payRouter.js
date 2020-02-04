var router = new VueRouter({
	routes : [
		{
			path : '/',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payMain.vue')
		},
		{
			path : '/payRead/:year/:month',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payRead.vue')
		},
	]
})








