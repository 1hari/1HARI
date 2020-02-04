<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"	uri="http://www.springframework.org/security/tags"%>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
<!-- css 설정 폰트 설정 추가-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hari/dist/css/stylesheetlove.css">
	
<div class="page-wrapper" style="margin-left: 0%;">
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">
				<button type="button" id="print" class="btn btn-success" style ="marign-left:80%">출력하기</button>
				<table cellspacing="0" style="border-collapse:collapse; width:810px; height:1050px;">
					<tbody>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:1px solid black; height:40px; vertical-align:middle; white-space:nowrap; width:34px"><span style="font-size:15px;font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; vertical-align:middle; white-space:nowrap; width:138px"><span style="font-size:15px; font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; vertical-align:middle; white-space:nowrap; width:162px"><span style="font-size:15px; font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; vertical-align:middle; white-space:nowrap; width:138px"><span style="font-size:15px; font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; vertical-align:middle; white-space:nowrap; width:162px"><span style="font-size:15px; font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap; width:34px"><span style="font-size:15px; font-family:&quot;맑은 고딕&quot;,monospace">　</span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:51px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td colspan="4" rowspan="1" style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:32px"><strong><span style="font-family:&quot;맑은 고딕&quot;,monospace">재&nbsp; 직&nbsp; 증&nbsp; 명&nbsp; 서</span></strong></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:68px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:1px solid black; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">성&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;명</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">${emp.empName}</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">주 민 등 록 번 호</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">${emp.birth} - ${emp.resNum}</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:1px solid black; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">소&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;속</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">${emp.teamName}</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">직&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;급</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">${emp.rankName}</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:1px solid black; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">재&nbsp; 직&nbsp; 기&nbsp; 간</span></span></td>
							<td colspan="3" rowspan="1" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:&quot;맑은 고딕&quot;,monospace" id="employDate"></span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:76px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td colspan="4" rowspan="1" style="border-color:initial; border-style:none; border-width:initial; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:19px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">상기와 같이 재직하였음을 증명함.</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:263px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:39px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td colspan="4" rowspan="1" style="border-color:initial; border-style:none; border-width:initial; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace" id="todayDate"></span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:22px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap">&nbsp;</td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:52px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td colspan="4" rowspan="1" style="border-color:initial; border-style:none; border-width:initial; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-family:맑은 고딕, monospace"><span style="font-size:21px"><strong id="ceoName"></strong><img src="${pageContext.request.contextPath}/resources/hari/assets/images/1HARI_signature.png"></span></span></td>
							<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
						<tr>
							<td style="border-bottom:1px solid black; border-left:1px solid black; border-right:none; border-top:none; height:40px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
							<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:&quot;맑은 고딕&quot;,monospace">　</span></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<style>
	body, input, p, span, option, label, select, button, .wizard-content {
		font-family :맑은고딕,monospace;
		font-size : 1.3rem;
		font-weight : inherit;
	}
	
	.draft > td{
		border-color:#000000;
		border-style:solid;
		border-width:1px 1px 1px;
		width: 80px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
<script>
	var date = moment(new Date()).format("YYYY-MM-DD");
	console.log(date); 
	$('#employDate').html('${emp.hireDate} ~ '+date);
	$('#todayDate').html(date);
	$('#ceoName').html("1HARI 대표 ${ceo.empName}");
	//출력버튼
	$('#print').click(function(){
		window.print();
	});
</script>