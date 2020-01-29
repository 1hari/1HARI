<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/http-vue-loader@1.4.1/src/httpVueLoader.min.js"></script>
<script src="https://unpkg.com/vuex"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<script>
	var contextPath = '${pageContext.request.contextPath}';
	console.log(contextPath);
	var g_oBeforeBody = document.getElementById('printMe').innerHTML;
	
// 	function printPage(){
// 			console.log("click!");
// 		    let $container = $("#print").clone()    // 프린트 할 특정 영역 복사
// 		    let cssText = ""                            // 스타일 복사
// 		    for (const node of $("style")) {
// 		        cssText += node.innerHTML
// 		        console.log(cssText);
// 		    }
		    
// 		    let innerHtml = $container[0].innerHTML
// 		    let popupWindow = window.open("", "_blank", "width=700,height=800")
// 		    popupWindow.document.write("<!DOCTYPE html>"+
// 		      "<html>"+
// 		      '<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">' + 
// 		      '<link rel="icon" type="image/png" sizes="16x16" href="/1HARI/resources/hari/assets/images/favicon.png">'+
// 		      '<link rel="stylesheet" href="/1HARI/resources/hari/dist/css/style.min.css">'+
// 		      '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css">'+
// 		      ''+
// 		      ''+
// 		      ''+
// 		      ''+
// 		        "<head>"+
// 		        "<style>"+cssText+"</style>"+
// 		        "</head>"+
// 		        "<body>"+innerHtml+"</body>"+
// 		      "</html>")
		   
// 		    popupWindow.document.close()
// 		    popupWindow.focus()

// 		    /** 1초 지연 */
// 		    setTimeout(() => {
// 		        popupWindow.print()         // 팝업의 프린트 도구 시작
// 		        popupWindow.close()         // 프린트 도구 닫혔을 경우 팝업 닫기
// 		    }, 1000)
// 	}

  var win=null;
  function printIt(printThis)  {
    win = window.open('','offprint','width=755 height=526');
//     self.focus();
//     win.document.open();
//     win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
//     win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
//     win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
//     win.document.write(printThis);
//     win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
//     win.document.close();
	window.onbeforeprint = function (ev) {
	    document.body.innerHTML = g_oBeforeBody;
	};
 
    win.print();
    win.close();
  }
</script>

<script src="${pageContext.request.contextPath}/resources/vue/js/vue-router.js"></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/payRouter.js'></script>
<script src='${pageContext.request.contextPath}/resources/vue/js/app.js'></script>
<style>
	#board_list>tbody>tr {
		cursor: pointer;
	}
</style>
<!-- 급여 조회 -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<!-- vue.js 코드 contents (webapp/vue folder 안에서 이루어짐) -->
<div class="page-wrapper">
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<div id='app'>
					<router-view></router-view> <!-- 급여조회 -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->