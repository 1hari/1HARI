package kr.coo.onehari.ta.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.ta.service.TAService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class TARestController {

	@Autowired
	private TAService taService;

	// 형남 0112 사원 출근 기능, DB에 출근시간 업데이트 및 출근여부 리턴
	@RequestMapping(value = "startWork.hari", method = RequestMethod.POST)
	public boolean startWork(Principal pri) {
		int result = 0;
		// 지각 구분시간
		String tardyDateStr = "110000";
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");

		try {
			Date tardyDate = dateFormat.parse(tardyDateStr);
			long tardyDateTime = tardyDate.getTime();
			curDate = dateFormat.parse(dateFormat.format(curDate));
			long curDateTime = curDate.getTime();

			// 현재시간과 지각구분시간 비교
			if (curDateTime > tardyDateTime) {
				// 지각
				result = taService.insertStartWorkTardyTA(pri.getName());
			} else {
				// 정상출근
				result = taService.insertStartWorkTA(pri.getName());
			}
		} catch (Exception e) {
			log.debug("startWork 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0112 사원 퇴근 기능, DB에 퇴근시간 업데이트 및 퇴근여부 리턴
	@RequestMapping(value = "endWork.hari", method = RequestMethod.POST)
	public boolean endWork(Principal pri) {
		int result = 0;
		try {
			result = taService.insertEndWorkTA(pri.getName());
		} catch (Exception e) {
			log.debug("endWork 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0112 오늘 날짜에 퇴근기록이 있는지 체크, 헤더에 출퇴근 버튼 띄어주는데 사용
	@RequestMapping(value = "todayEndWorkCheck.hari", method = RequestMethod.POST)
	public boolean todayEndWorkCheck(Principal pri) {
		int result = 0;
		try {
			result = taService.todayEndWorkCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayEndWorkCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0112 오늘 날짜에 결근기록이 있는지 체크, 있으면 출 퇴근 버튼 숨김
	@RequestMapping(value = "todayAbsentCheck.hari", method = RequestMethod.POST)
	public boolean todayAbsentCheck(Principal pri) {
		int result = 0;
		try {
			result = taService.todayAbsentCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayAbsentCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0112 오늘 날짜에 출근기록이 있는지 체크, 헤더에 출퇴근 버튼 띄어주는데 사용
	@RequestMapping(value = "todayStartWorkCheck.hari", method = RequestMethod.POST)
	public boolean todayStartWorkCheck(Principal pri) {
		int result = 0;
		try {
			result = taService.todayStartWorkCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayStartWorkCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0113 사원의 현재까지 총 근무일, 근태현황 총 근무일 출력
	@RequestMapping(value = "getTotalTA.hari", method = RequestMethod.POST)
	public int getTotalTA(Principal pri) {
		int result = 0;
		try {
			result = taService.getTotalTA(pri.getName());
		} catch (Exception e) {
			log.debug("getTotalTA 예외발생: " + e.getMessage());
		}
		return result;
	}

	// 형남 0113 사원의 오늘 퇴근 전 현재까지 근무시간(현재시간 - 출근시각)
	@RequestMapping(value = "getWorkTime.hari", method = RequestMethod.POST)
	public String getWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 사원의 오늘 퇴근 후 근무시간(퇴근시각 - 출근시각)
	@RequestMapping(value = "getTodayTotalTime.hari", method = RequestMethod.POST)
	public String getTodayTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getTodayTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTodayTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 이번주 현재까지 총 근무시간(이번주 + (현재시간 - 출근시각)) => 퇴근 전
	@RequestMapping(value = "getWeekTotalTime.hari", method = RequestMethod.POST)
	public String getWeekTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getWeekTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWeekTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 이번주 총 근무시간 => 퇴근 후
	@RequestMapping(value = "getWeekWorkTime.hari", method = RequestMethod.POST)
	public String getWeekWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getWeekWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWeekWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 현재까지 총 근무시간(어제까지 총 근무시간 + (현재시간 - 출근시각)) => 퇴근 전
	@RequestMapping(value = "getTotalTime.hari", method = RequestMethod.POST)
	public String getTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 총 근무시간(오늘까지 총 근무시간) => 퇴근 후
	@RequestMapping(value = "getTotalWorkTime.hari", method = RequestMethod.POST)
	public String getTotalWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = taService.getTotalWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTotalWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 오늘 날짜 풀캘린더에 들어가 있는 기본 날짜값 포맷 형식으로 받아오기 => yyyy-mm-dd
	@RequestMapping(value = "getDataDate.hari", method = RequestMethod.POST)
	public String getDataDate(Principal pri) {
		String dataDate = null;
		try {
			dataDate = taService.getDataDate(pri.getName());
			if (dataDate == null) {
				dataDate = "empty";
			}
		} catch (Exception e) {
			log.debug("getDataDate 예외발생: " + e.getMessage());
		}
		return dataDate;
	}

	// 형남 0114 이번달 출근일 풀캘린더에 들어가 있는 기본 날짜값 포맷 형식으로 받아오기 => yyyy-mm-dd
	@RequestMapping(value = "getStartList.hari", method = RequestMethod.POST)
	public String getStartList(Principal pri) {
		List<String> startList = null;
		List<String> tardyList = null;
		JSONObject jsonObject = new JSONObject();
		try {
			startList = taService.getStartList(pri.getName());
			tardyList = taService.getTardyList(pri.getName());
			jsonObject.put("startList", startList);
			jsonObject.put("tardyList", tardyList);
		} catch (Exception e) {
			log.debug("getStartList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0202 풀캘린더 월 이동 시 해당 연, 월의 출근, 지각 날짜 가져오기
	@RequestMapping(value = "getStartList.hari", method = RequestMethod.POST, params = { "calYear", "calMonth" })
	public String getStartList(Principal pri, @RequestParam("calYear") String calYear,
			@RequestParam("calMonth") String calMonth) {
		System.out.println(calYear);
		System.out.println(calMonth);
		List<String> startList = null;
		List<String> tardyList = null;
		JSONObject jsonObject = new JSONObject();
		try {
			startList = taService.getStartList(pri.getName(), calYear, calMonth);
			tardyList = taService.getTardyList(pri.getName(), calYear, calMonth);
			jsonObject.put("startList", startList);
			jsonObject.put("tardyList", tardyList);
		} catch (Exception e) {
			log.debug("getStartList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0114 이번달 퇴근일, 결근일, 연차사용일 풀캘린더에 들어가 있는 기본 날짜값 포맷 형식으로 받아오기 => yyyy-mm-dd
	@RequestMapping(value = "getEndList.hari", method = RequestMethod.POST)
	public String getEndList(Principal pri) {
		JSONObject jsonObject = new JSONObject();
		List<String> endList = null;
		List<String> absentList = null;
		List<String> annList = null;

		try {
			endList = taService.getEndList(pri.getName());
			absentList = taService.getAbsentList(pri.getName());
			annList = taService.getAnntList(pri.getName());
			jsonObject.put("endList", endList);
			jsonObject.put("absentList", absentList);
			jsonObject.put("annList", annList);
		} catch (Exception e) {
			log.debug("getEndList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0202 풀캘린더 월 이동 시 해당 연, 월의 퇴근, 연차, 결근 날짜 가져오기
	@RequestMapping(value = "getEndList.hari", method = RequestMethod.POST, params = { "calYear", "calMonth" })
	public String getEndList(Principal pri, @RequestParam("calYear") String calYear,
			@RequestParam("calMonth") String calMonth) {
		JSONObject jsonObject = new JSONObject();
		List<String> endList = null;
		List<String> absentList = null;
		List<String> annList = null;

		try {
			endList = taService.getEndList(pri.getName(), calYear, calMonth);
			absentList = taService.getAbsentList(pri.getName(), calYear, calMonth);
			annList = taService.getAnntList(pri.getName(), calYear, calMonth);
			jsonObject.put("endList", endList);
			jsonObject.put("absentList", absentList);
			jsonObject.put("annList", annList);
			System.out.println("endList: " + endList.toString());
			System.out.println("absentList: " + absentList.toString());
			System.out.println("annList: " + annList.toString());
		} catch (Exception e) {
			log.debug("getEndList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0121 출근, 지각, 결근 연차, 조퇴 횟수 가져오기(사원 대시보드 근태차트, chart.js dataset 형식으로 가공)
	@RequestMapping(value = "getTA.hari", method = RequestMethod.POST)
	public String getTA(Principal pri) {
		List<Integer> TAList = new ArrayList<Integer>();
		JSONObject jsonObject = new JSONObject();
		try {
			int work = taService.getWork(pri.getName()); // 출근
			int tardy = taService.getTardy(pri.getName()); // 지각
			int absent = taService.getAbsent(pri.getName()); // 결근
			int annual = taService.getAnnual(pri.getName()); // 연차
			int early = taService.getEarly(pri.getName()); //
			TAList.add(work);
			TAList.add(tardy);
			TAList.add(absent);
			TAList.add(annual);
			TAList.add(early);
			jsonObject.put("TAList", TAList);
		} catch (Exception e) {
			log.debug("getTA 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0122 팀 별 근무시간 가져오기(전월, 사원 대시보드 근태차트, chart.js dataset)
	@RequestMapping(value = "getAllEmpTA.hari", method = RequestMethod.POST)
	public String getAllEmpTA() {
		JSONArray root = new JSONArray();
		JSONArray jsonArray = null;
		List<Integer> teamCodeList = new ArrayList<Integer>();
		List<String> teamNameList = new ArrayList<String>();
		List<String> teamWorkTimeList = null;
		String teamWorkTime = null;
		JSONObject jsonObject = null;
		int count = 0;
		try {
			// 현재 존재하는 팀코드 가져오기
			teamCodeList = taService.getTeamCodeList();
			// JSON Data에 넣을 label 값(팀 이름)
			teamNameList = taService.getTeamNameList();
			// 모든 팀에 전월 근무시간 가져오기
			for (int teamCode : teamCodeList) {

				// 차트에 들어갈 json 데이터 형식으로 추가
				jsonObject = new JSONObject();
				jsonObject.put("label", teamNameList.get(count));
				jsonObject.put("borderWidth", 1);

				// 팀별 + 월별 근무시간 리스트
				teamWorkTimeList = new ArrayList<String>();
				for (int i = 1; i < 13; i++) {
					jsonArray = new JSONArray();
					teamWorkTime = taService.getTeamMonthWorkTime(teamCode, i);// 2001/1,2,3,4,5..
					if (teamWorkTime == null) {
						teamWorkTime = "0";
					}
					// 000:000:000
					String[] timeSplit = teamWorkTime.split(":");
					// 시간 단위만 뽑아서 add
					teamWorkTimeList.add(timeSplit[0]);
				}
				count++;// 팀 이름 가져올 때 인덱스값
				jsonObject.put("data", teamWorkTimeList);
				root.add(jsonObject);
			}
		} catch (Exception e) {
			log.debug("getAllEmpTA 예외발생: " + e.getMessage());
		}
		return root.toJSONString();
	}

	// 형남 0123 팀 별 근무시간 가져오기(월별)
	@RequestMapping(value = "getEmpTAMonth.hari", method = RequestMethod.POST)
	public String getEmpTAMonth(String monthStr) {
		int month = Integer.parseInt(monthStr);
		JSONArray root = new JSONArray();
		JSONArray jsonArray = null;
		List<Integer> teamCodeList = new ArrayList<Integer>();
		List<String> teamNameList = new ArrayList<String>();
		List<String> teamWorkTimeList = null;
		String teamWorkTime = null;
		JSONObject jsonObject = null;
		int count = 0;
		try {
			// 현재 존재하는 팀코드 가져오기
			teamCodeList = taService.getTeamCodeList();
			// JSON Data에 넣을 label 값(팀 이름)
			teamNameList = taService.getTeamNameList();
			// 모든 팀에 전월 근무시간 가져오기
			for (int teamCode : teamCodeList) {
				// 차트에 들어갈 json 데이터 형식으로 추가
				jsonObject = new JSONObject();
				jsonObject.put("label", teamNameList.get(count));
				jsonObject.put("borderWidth", 1);
				// 팀별 + 월별 근무시간 리스트
				teamWorkTimeList = new ArrayList<String>();
				jsonArray = new JSONArray();
				teamWorkTime = taService.getTeamMonthWorkTime(teamCode, month);
				if (teamWorkTime == null) {
					teamWorkTime = "0";
				}
				// 000:000:000
				String[] timeSplit = teamWorkTime.split(":");
				// 시간 단위만 뽑아서 add
				teamWorkTimeList.add(timeSplit[0]);
				jsonObject.put("data", teamWorkTimeList);
				root.add(jsonObject);
				count++;// 팀 이름 가져올 때 인덱스값
			}
		} catch (Exception e) {
			log.debug("getEmpTAMonth 예외발생: " + e.getMessage());
		}
		return root.toJSONString();
	}

	// 형남 0128 대시보드 부서별 연봉통계 차트 연도 셀렉트박스
	@RequestMapping(value = "getSalYear.hari", method = RequestMethod.POST)
	public List<String> getSalYear() {
		List<String> yearList = null;
		try {
			yearList = taService.getSalYear();
		} catch (Exception e) {
			log.debug("getSalYear 예외발생: " + e.getMessage());
		}
		return yearList;
	}

	// 형남 0128 대시보드 부서별 연봉차트
	@RequestMapping(value = "getTeamSalList.hari", method = RequestMethod.POST)
	public String getTeamSalList(String year) {
		JSONArray root = new JSONArray(); // 가장 바깥쪽 배열 - dataset
		JSONArray teamAvgSalArray = null; // data 값
		List<Integer> teamCodeList = new ArrayList<Integer>(); // 팀코드 리스트
		List<String> teamNameList = new ArrayList<String>(); // 라벨에 넣어줄 팀 이름
		String teamAvgSal = null; // 팀 별 평균 연봉
		JSONObject jsonObject = null;
		int count = 0;
		try {
			// 현재 존재하는 팀코드 가져오기
			teamCodeList = taService.getTeamCodeList();
			// JSON Data에 넣을 label 값(팀 이름)
			teamNameList = taService.getTeamNameList();
			// 모든 팀의 평균연봉 가져와 배열에 하나씩 넣음(dataset 형식에 맞춤)
			for (int teamCode : teamCodeList) {
				// 차트에 들어갈 json 데이터 형식으로 추가
				jsonObject = new JSONObject();
				jsonObject.put("label", teamNameList.get(count));
				jsonObject.put("borderWidth", 1);
				teamAvgSalArray = new JSONArray();
				teamAvgSal = taService.getTeamAvgSal(teamCode, year); // 팀 별 평균연봉
				// 팀에 연봉 데이터가 없으면 0 처리
				if (teamAvgSal == null) {
					teamAvgSal = "0";
				}
				teamAvgSalArray.add(teamAvgSal);
				jsonObject.put("data", teamAvgSalArray);
				root.add(jsonObject);
				count++; // 팀 이름 가져올 때 인덱스값
			}
		} catch (Exception e) {
			log.debug("getEmpTAMonth 예외발생: " + e.getMessage());
		}
		return root.toJSONString();
	}

}