var router = new VueRouter({
	routes : [
		{
			path : '/',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payMain.vue')
		},
		{
			// '/payRead/' + year + '/' + month
			path : '/payRead/:year/:month',
			component : httpVueLoader(contextPath+'/resources/vue/components/pay/payRead.vue')
		},
	]
})








