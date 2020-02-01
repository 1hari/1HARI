<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/multicheck.css">
<link href="${pageContext.request.contextPath}/resources/hari/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title"> 근태관리 </h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	
	<!-- Container fluid  -->
	<!-- ============================================================== -->
	<div class="container-fluid" style ="margin-top: 3%;">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-12">

				<!-- 사원 근태관리 테이블 -->
				<div class="card">
					<div class="card-body" style ="border-radius:10px;border-radius:10px; box-shadow :0 0 12px #999999;">
						<h5 class="card-title"></h5>
						<div class="table-responsive">
							<form id="taTable" name="taTable" method="post" enctype="multipart/form-data">
								<table id="zero_config" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style = "background-color:white;">
												<select id="selectMonth"></select>
											</th>
											<th style = "background-color:white;" id="days" colspan="5">
											</th>
										</tr>
										<tr>
											<th>사번</th>
											<th>사원</th>
											<th>부서</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>퇴근처리</th>
										</tr>
									</thead>
									<tbody id="taBody">
										
									</tbody>
									<tfoot>
									</tfoot>
								</table>
							</form>
						</div>

					</div>
				</div>
				<!--데이터 테이블 끝 -->

			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Right sidebar -->
		<!-- ============================================================== -->
		<!-- .right-sidebar -->
		<!-- ============================================================== -->
		<!-- End Right sidebar -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
<!-- this page js -->
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/hari/assets/extra-libs/DataTables/datatables.min.js"></script>

<script>
	$(function() {
		let startWork = ""; // 출근시간 처리를 위한 변수
		let leaveWork = ""; // 퇴근시간 처리를 위한 변수
		let today = moment().format("YYYY-MM-DD"); // 오늘 날짜
		let curMonth = moment().format("YYYY-MM"); // 현재 월
		let curDate = moment().date(); // 현재 일
		let curDay = moment().format("dddd");
		let setDate = ""; // 첫 페이지 진입 후 조건식을 위한 변수
		
		getTaList(today); // 페이지 로딩 후 오늘의 근태목록 가져오기
		getThreeMonth(); // 근태목록을 가져온 후 직전 2개월까지 선택할 수 있도록 하는 함수 호출

		function getThreeMonth() { // 직전 2개월 (총 3개월)을 선택할 수 있는 함수
			// daysMonth SelectBox
			let preMonth = moment().add(-1, "month").format("YYYY-MM"); // 1달 전
			let pastMonth = moment().add(-2, "month").format("YYYY-MM"); // 2달 전
	
			let month = "";
			month += '<option value="' + curMonth + '" selected>' + curMonth + '</option>' // 현재 월을 기본적으로 선택이 되도록
					+ '<option value="' + preMonth + '">' + preMonth + '</option>'
					+ '<option value="' + pastMonth + '">' + pastMonth + '</option>';
			$('#selectMonth').append(month); // selectBox에 넣기
			
			let selectedMonth = moment($('#selectMonth').val()).month(); // 선택되어 있는 현재 월('2020-01')에서 월(01)만 추출
			selectMonth(selectedMonth); // 
			
			$('#selectMonth').change(function() { // 선택 월이 바뀌는 경우
				selectedMonth = moment($('#selectMonth').val()).month(); // 선택한 월에서 월만 추출
				$('#days').empty(); // 해당 월 일자를 비워주고
				selectMonth(selectedMonth); // 해당 월 일자를 생성하는 함수 호출
			})
		}
		
		function getTaList(setDate) { // 근태목록 가져오기
			$.ajax({
				url: "${pageContext.request.contextPath}/ajax/getTaList.hari",
				type: "post",
				data : { "setDate" : setDate },
				dataType: "json",
				success: function(TaList) {
					let empTaList = "";
					let count = 0;
					if (TaList == "") { // 출퇴근 기록이 없는 주말 체크
						empTaList += '<tr>'
									+ '<td colspan="6">오늘은 ' + today + '&nbsp;&nbsp;' + curDay + ' 입니다. 출퇴근 기록이 존재하지 않습니다.</td>'
									+ '<td style="display: none;"></td>'
									+ '<td style="display: none;"></td>'
									+ '<td style="display: none;"></td>'
									+ '<td style="display: none;"></td>'
									+ '<td style="display: none;"></td>'
								+ '</tr>';
					} else { // 출퇴근 기록이 있는 경우
						for (var i = 0; i < TaList.length; i++) {
							if (count == 0) {
								empTaList += '<tr>'
												+ '<td>' + TaList[i].empNum + '</td>' // 사번
												+ '<td>' + TaList[i].empName + ' ' + TaList[i].rankName +'</td>' // 이름, 직급
												+ '<td>' + TaList[i].teamName + '</td>'; // 부서
								if (TaList[i].taDate != null && TaList[i].taDate != '0000-00-00 00:00:00') { // 출근시간 기록이 있고 연차(0000)가 아닌 경우
									empTaList += '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>'; // 출근, 출근시간
								} else if (TaList[i].taDate == null && TaList[i].taDate != '0000-00-00 00:00:00') { // 출근시간 기록이 없고 연차(0000)가 아닌 경우
									empTaList += '<td>' + TaList[i].taName + ' (출근시간 기록없음)</td>'; // 출근, 출근시간
								} else if (TaList[i].taDate == '0000-00-00 00:00:00') { // 연차인 경우
	// 								empTaList += ''; // 연차인 경우 출근을 화면에 출력하지 않고 뒤에 연차 td와 합치기 위해 공백으로 처리
									empTaList += '<td>연차</td>'; // 출근, 출근시간
								}
								count++;
							} else {
								if (TaList[i].empNum == TaList[i-1].empNum && TaList[i].taCode == 5) { // 퇴근이 아닌 결근처리가 되어있을 경우
									empTaList += '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>' // 결근, 결근처리시간
												+ '<td><button type="button" class="editEmpTa btn btn-success"><i class="fa fa-edit"></i> 퇴근처리</button></td>' // 결근일 경우 퇴근처리 버튼 생성
											+ '</tr>';
									count = 0;
								} else { // 결근이 아닌 경우
									if (TaList[i].taDate != null && TaList[i].taDate != '0000-00-00 00:00:00') { // 퇴근시간 기록이 있고 연차(0000)가 아닌 경우
										empTaList += '<td>' + TaList[i].taName + ' (' + TaList[i].taDate + ')</td>'; // 퇴근, 퇴근시간
									} else if (TaList[i].taDate == null && TaList[i].taDate != '0000-00-00 00:00:00') { // 퇴근시간 기록이 없고 연차(0000)가 아닌 경우
										empTaList += '<td>' + TaList[i].taName + ' (퇴근시간 기록없음)</td>'; // 퇴근시간 기록이 없는 경우
									} else if (TaList[i].taDate == '0000-00-00 00:00:00') { // 연차인 경우
										empTaList += '<td>' + TaList[i].taName + '</td>'; // 연차인 경우 출퇴근시간 td를 합쳐서
									}
										empTaList += '<td></td>' // 결근이 아닐 경우 퇴근처리 버튼을 만들지 않음
												+ '</tr>';
									count = 0;
								}
							}
						}
					}
					$('#taBody').append(empTaList);
					/* 데이터 호출 후 DataTable 호출 */
					$('#zero_config').DataTable();
					
					setEmpTa(setDate); // 퇴근처리를 위한 함수 호출
				},
				error : function(xhr){
					console.log(xhr.status);
					console.log('getTaList ajax error');
				}
			});
		}

		function setEmpTa(setDate) { // 퇴근처리하기
			$('.editEmpTa').click(function() {
				let tr = $(this).closest('tr'); // 나와 조상요소 중 첫번째 tr //.parent() 바로 상위요소 찾기
				let empNum = tr.children().html(); // 나와 조상요소 중 첫번째 tr의 자식의 값
				let startWorkTime = tr.children().eq(3).html(); // 해당 사원의 출근기록시간 받기
				// let leaveWorkTime = tr.children().eq(4).html(); // 해당 사원의 결근기록시간 받기
				
				startWork = moment(startWorkTime, "YYYY-MM-DD HH:mm:ss").format("YYYY-MM-DD HH:mm:ss"); // 출근시간
				leaveWork = moment(startWork, "YYYY-MM-DD HH:mm:ss").add(9, "hours").format("YYYY-MM-DD HH:mm:ss"); // 퇴근시간(출근시간 + 9시간)
				
				$.ajax({
					url: "${pageContext.request.contextPath}/ajax/setEmpTa.hari",
					data: 
						{
							"empNum" : empNum, // 사번
							 "taDate" : leaveWork, // 결근을 퇴근으로 처리하기 위한 시간
							 "setDate" : setDate // 해당 출퇴근 기록일
						},
					type: "post",
					dataType: "json",
					success: function() {
						$('#zero_config').DataTable().destroy(); // DataTables 초기화(해당 부분을 empty() 하기 전)
						$('#taBody').empty(); // 비동기 처리가 완료되면 해당 tbody를 비워주고
						getTaList(setDate); // 근태목록을 다시 가져온다
					},
					error : function(xhr){
						console.log(xhr.status);
						console.log('setEmpTa ajax error');
					}
				})
			})
		}

		function selectMonth(selectedMonth, setDate) { // 해당 월 포함 3개월 전까지 선택할 수 있도록
			let daysMonth = moment(selectedMonth).month(selectedMonth).daysInMonth(); // 해당 월의 일수를 구해서 변수에 선언
			let days = "";

			for (var i = 0; i < daysMonth; i++) {
                /* 첫 페이지 로드 후에도 첫 번째 if문을 타지 않으니 물어보고 삭제하거나 수정 */
				if (setDate == "") { // 오늘 날짜로 페이지를 들어왔을 때
					if (moment(curMonth).month() != selectedMonth) { // 이번 달과 선택된 달이 같지 않을 때
                        console.log('curMonth');
						days += '<span class="click"> ' + (i + 1) + ' </span>'; // 1일은 0이기 때문에 +1
					} else { // 이번 달과 선택된 달이 같을 때
                        console.log('!= curMonth');
						if (curDate != (i + 1)) { // 오늘 일자와 선택된 일자가 같지 않을 때
							days += '<span class="click"> ' + (i + 1) + ' </span>'; // 1일은 0이기 때문에 +1
						} else { // 오늘 일자와 선택된 일자가 같을 때
							days += '<span class="click" style="color: red;"> ' + (i + 1) + ' </span>'; // 1일은 0이기 때문에 +1
						}
					}
				} else { // 클릭 이후에 페이지에 들어올 때
                    console.log('클릭이후');
                    if (moment(setDate).month() != selectedMonth) { // SelectBox에서 월을 변경하고 일자를 선택하지 않았을 때
                        console.log('month');
                        days += '<span class="click">&nbsp; ' + (i + 1) + '&nbsp; </span>'; // 1일은 0이기 때문에 +1
                    } else { // SelectBox에서 월을 변경하고 일자를 선택했을 때
                        console.log('date');
						if (moment(setDate).date() != (i + 1)) { // setDate 일자와 선택된 일자가 같지 않은 경우
                            days += '<span class="click">&nbsp; ' + (i + 1) + '&nbsp; </span>'; // 1일은 0이기 때문에 +1
						} else { // setDate 일자와 선택된 일자가 같은 경우
                            days += '<span class="click" style="color: red;">&nbsp; ' + (i + 1) + '&nbsp; </span>'; // 1일은 0이기 때문에 +1
						}
					}
				}
			}
			$('#days').append(days);

			$('.click').click(function() { // 해당 날짜(일)을 선택했을 때
				setDate = $('#selectMonth').val() + '-' + $(this).text().trim(); // 해당 날짜를 연-월-일로 선언
				$('#zero_config').DataTable().destroy(); // DataTables 초기화(해당 부분을 empty() 하기 전)
				$('#taBody').empty();
				getTaList(setDate); // 해당 날짜 근태목록 가져오기
				$('#days').empty();
				selectMonth(moment($('#selectMonth').val()).month(), setDate); // 해당 월의 일수 재조정
			})
		}
	})
	
</script>