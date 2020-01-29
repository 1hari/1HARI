<template>
  <div class="container" style="margin-top:0">
    <div class="row">
      <div class="col-sm-1"></div>
      <div class="col-sm-8">
      <button type="button" id="printPay" class="btn btn-outline-secondary" @click="print()">출력하기</button>
        <div class="card shadow">
<table cellspacing="0" style="border-collapse:collapse; width:800px">
	<tbody>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap; width:33px"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="13" rowspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:27px"><strong><span style="font-family:&quot;맑은 고딕&quot;,monospace">급 여 지 급 명 세 서</span></strong></span></td>
			<td colspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">소&nbsp;&nbsp; 속</span></span></td>
			<td colspan="5" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">　{{emp.teamName}}</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">성&nbsp;&nbsp; 명</span></span></td>
			<td colspan="5" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">　{{emp.empName}}</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="13" rowspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:19px"><strong><span style="font-family:&quot;맑은 고딕&quot;,monospace">{{year}} 년&nbsp;{{month}}&nbsp;월</span></strong></span></td>
			<td colspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">입사일</span></span></td>
			<td colspan="5" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">　{{emp.hireDate}}</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="2" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">직&nbsp;&nbsp; 위</span></span></td>
			<td colspan="5" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">　{{emp.rankName}}</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:normal; width:33px"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:normal; width:33px"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="20" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">1. 실 지급액</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">지급 합계</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">공제 합계</span></span></td>
			<td colspan="8" style="background-color:white; border-bottom:none; border-left:none; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">실 수령액</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].basicSal}}</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{totalDeduction}}</span></span></td>
			<td colspan="8" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">{{realAmount}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:29px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="20" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:left; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><strong><span style="font-family:돋움,monospace">2. 지급 내역</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="10" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">지급항목</span></span></td>
			<td colspan="10" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">공제항목</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">기본급여</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].basicSal}}</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">국민연금</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].payNPension}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">건강보험</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{ server_data.payList[0].payHInsurance}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">장기요양보험</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].payCInsurance}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">고용보험</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].empInsurance}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">소득세</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].payIncomeTax}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">지방소득세</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　{{server_data.payList[0].payLIncomeTax}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:none; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:3px double black; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:3px double black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:3px double black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:3px double black; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:1px solid black; border-left:1px solid black; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">{{server_data.payList[0].basicSal}}</span></span></td>
			<td colspan="4" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="6" style="background-color:white; border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">{{totalDeduction}}</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="20" rowspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><strong><span style="font-family:돋움,monospace">노고에 대단히 감사드립니다.</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="20" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:16px"><span style="font-family:돋움,monospace">{{currYear}} 년&nbsp;{{currMonth}} 월&nbsp;{{currDay}} 일</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="20" rowspan="2" style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:19px"><strong><span style="font-family:돋움,monospace">일하리 대표이사 {{CEO.empName}}</span></strong></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; height:35px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:white; border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:12px"><span style="font-family:돋움,monospace">　</span></span></td>
			
		</tr>
	</tbody>
</table>


        </div>
      </div>
      <div class="col-sm-3"></div>
    </div>
  </div>
</template>
<script>
//현재 날짜 구하는 포맷팅
var date = new Date(); 
var cYear = date.getFullYear(); 
var cMonth = new String(date.getMonth()+1); 
var cDay = new String(date.getDate()); 

// 한자리수일 경우 0을 채워준다. 
if(cMonth.length == 1){ 
  cMonth = "0" + cMonth; 
} 
if(cDay.length == 1){ 
  cDay = "0" + cDay; 
} 
$(function(){
	//출력버튼
	$('#printPay').click(function(){
		console.log('클릭')
		window.print()
	})
})
module.exports = {
  data: function() {
    return {
      server_data:{},
      realAmount:'',
      totalDeduction:'',
      emp:{},
	  day:'',
	  CEO:{},
	  year:'',
	  month:'',
	  currYear:'',
	  currMonth:'',
	  currDay:'',
    }
  },
  created() {

	console.log(month)
	this.year=year
	this.month=month
	this.currYear=cYear
	this.currMonth=cMonth
	this.currDay=cDay

    var params = new URLSearchParams();
	params.append('year', year)
	params.append('month', month)
    axios.post(contextPath + "/ajax/getPayList.hari", params).then((response)=>{
	  this.server_data=response.data
      //실수령액
      this.totalDeduction=numeral(this.server_data.payList[0].payNPension + this.server_data.payList[0].payHInsurance + this.server_data.payList[0].payCInsurance +  this.server_data.payList[0].empInsurance + this.server_data.payList[0].payIncomeTax + this.server_data.payList[0].payLIncomeTax).format( '₩0,0' )
      this.realAmount=numeral(this.server_data.payList[0].basicSal -  (this.server_data.payList[0].payNPension + this.server_data.payList[0].payHInsurance + this.server_data.payList[0].payCInsurance +  this.server_data.payList[0].empInsurance + this.server_data.payList[0].payIncomeTax + this.server_data.payList[0].payLIncomeTax)).format( '₩0,0' )
        this.server_data.payList[0].basicSal = numeral(this.server_data.payList[0].basicSal).format( '₩0,0' )
        this.server_data.payList[0].payNPension = numeral(this.server_data.payList[0].payNPension).format( '₩0,0' )
        this.server_data.payList[0].payHInsurance = numeral(this.server_data.payList[0].payHInsurance).format( '₩0,0' )
        this.server_data.payList[0].payCInsurance = numeral(this.server_data.payList[0].payCInsurance).format( '₩0,0' )
        this.server_data.payList[0].empInsurance = numeral(this.server_data.payList[0].empInsurance).format( '₩0,0' )
        this.server_data.payList[0].payIncomeTax = numeral(this.server_data.payList[0].payIncomeTax).format( '₩0,0' )
        this.server_data.payList[0].payLIncomeTax = numeral(this.server_data.payList[0].payLIncomeTax).format( '₩0,0' )
    })
    
    axios.post(contextPath + '/ajax/getEmp.hari', params).then((response)=>{
      this.emp=response.data.emp
      console.log(this.emp)
	})
	
    axios.post(contextPath + '/ajax/getCEO.hari', params).then((response)=>{
      this.CEO=response.data.CEO
      console.log(this.CEO)
    })
  },
  methods: {
	print: function() {
		window.print()
       }
	}
  }




</script>