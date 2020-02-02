package kr.coo.onehari.ta.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;

/*
작성자: 오형남
시작: 2020. 2. 2 
완료: 
내용: 근태관련 작업
*/
public interface TADao {
	//사원 출근 오형남 / 2020. 1. 12
	public int insertStartWorkTA(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 출근 오형남 / 2020. 1. 12
	public int insertStartWorkTardyTA(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 퇴근 오형남 / 2020. 1. 12
	public int insertEndWorkTA(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 퇴근기록 조회 오형남 / 2020. 1. 12
	public int todayEndWorkCheck(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 출근기록 조회 오형남 / 2020. 1. 12
	public int todayStartWorkCheck(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 출근기록 조회 오형남 / 2020. 1. 20
	public int todayAbsentCheck(int empNum) throws ClassNotFoundException, SQLException;
	
	//사원 출근기록 조회 오형남 / 2020. 1. 12
	public int getTotalTA(int empNum) throws ClassNotFoundException, SQLException;
	
    //사원 출근시간 가져오기 오형남 / 2020. 1. 13
    public Date getStartWorkTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //현재까지 근무시간 오형남 / 2020. 1. 13
    public String getWorkTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //오늘 퇴근시간 오형남 / 2020. 1. 13
    public String getTodayTotalTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번주 현재까지 총  근무시간 오형남 / 2020. 1. 13
    public String getWeekTotalTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //현재까지 총 근무시간 오형남 / 2020. 1. 13
    public String getTotalTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번주 총 근무시간 오형남 / 2020. 1. 13
    public String getWeekWorkTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //총 근무시간 오형남 / 2020. 1. 13
    public String getTotalWorkTime(int empNum) throws ClassNotFoundException, SQLException;
    
    //dataDate 오형남 / 2020. 1. 14
    public String getDataDate(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 출근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getStartList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 출근기록 yyyy-mm-dd  캘린더 월 변경시 오형남 / 2020. 2. 22
    public List<String> getStartListCal(int empNum, String calYear, String calMonth) throws ClassNotFoundException, SQLException;
    
    //이번달 지각기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getTardyList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 지각기록 yyyy-mm-dd  캘린더 월 변경시 오형남 / 2020. 2. 22
    public List<String>getTardyListCal(int empNum, String calYear, String calMonth) throws ClassNotFoundException, SQLException;
    
    //이번달 퇴근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getEndList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 결근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getAbsentList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 연차기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getAnntList(int empNum) throws ClassNotFoundException, SQLException;
    
    //사용자 테마 색 가져오기
    public String getThemeColor(int empNum) throws ClassNotFoundException, SQLException;
    
    //사용자 테마 색 세팅하기
    public int setThemeColor(int empNum, String color) throws ClassNotFoundException, SQLException;
    
    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public Integer getWork(int empNum) throws ClassNotFoundException, SQLException;
    
    //형남 0121 지각 횟수 가져오기(사원 대시보드 차트)
    public Integer getTardy(int empNum) throws ClassNotFoundException, SQLException;
    
    //형남 0121 결근 횟수 가져오기(사원 대시보드 차트)
    public Integer getAbsent(int empNum) throws ClassNotFoundException, SQLException;
    
    //형남 0121 조퇴 횟수 가져오기(사원 대시보드 차트)
    public Integer getAnnual(int empNum) throws ClassNotFoundException, SQLException;
    
    //형남 0121 연차 횟수 가져오기(사원 대시보드 차트)
    public Integer getEarly(int empNum) throws ClassNotFoundException, SQLException;

    //현재 존재하는 팀 목록(팀 코드) 가져오기
    public List<Integer> getTeamCodeList() throws ClassNotFoundException, SQLException;
    
    //현재 존재하는 팀 목록(팀 이름) 가져오기
    public List<String> getTeamNameList() throws ClassNotFoundException, SQLException;
    
    //형남 0122 팀 별 근무시간(월)
    public String getTeamMonthWorkTime(int teamCode, int month) throws ClassNotFoundException, SQLException;
    
 
    
    //대시보드 부서별 연봉 연도 셀렉트박스 2020. 1. 28
    public List<String> getSalYear() throws ClassNotFoundException, SQLException;
    
    //대시보드 부서별 연봉
    public String getTeamAvgSal(int teamCode, String year) throws ClassNotFoundException, SQLException;
}