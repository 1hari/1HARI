package kr.coo.onehari.hr.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;

/*
작성자: 김진호
시작: 2020. 1. 7
완료: 
내용: 사원등록 empJoin 작업 시작
*/
public interface EmpDao {

	// 사원목록 김진호 / 2020. 1. 7
	public List<EmpDto> empList() throws ClassNotFoundException, SQLException;
	
	// 사원등록 김진호 / 2020. 1. 7
	public int empJoin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원등록 김진호 / 2020. 1. 10
	public int subempJoin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정화면(관리자 권한) 양찬식 / 2020. 1. 8
	public EmpDto empModify(int empNum) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(관리자권한) 양찬식 / 2020. 1. 9
	public int empUpdate(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(관리자권한) 김진호 / 2020. 1. 10
	public int subempUpdate(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(권한추가) 김진호 / 2020. 1. 12
	public int insertRoleaAdmin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(권한추가) 김진호 / 2020. 1. 12
	public int insertRoleaPersonnel(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(권한제거) 김진호 / 2020. 1. 13
	public int deleteRoleAdmin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(권한제거) 김진호 / 2020. 1. 13
	public int deleteRolePersonnel(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	//사원목록(주 table) 김정하 / 2020. 1. 9
	public List<EmpDto> empDefaultList() throws ClassNotFoundException, SQLException;
	
	//사원정보(기안자) 김정하 / 2020. 1. 10
	public EmpDto empDefault(String empNum) throws ClassNotFoundException, SQLException;
	
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
    
    //이번달 출근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getTardyList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 퇴근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getEndList(int empNum) throws ClassNotFoundException, SQLException;
    
    //이번달 결근기록 yyyy-mm-dd 오형남 / 2020. 1. 14
    public List<String> getAbsentList(int empNum) throws ClassNotFoundException, SQLException;
    
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
    
    //형남 0127 CEO 정보 가져오기(급여 명세서)
    public EmpDto getCEO() throws ClassNotFoundException, SQLException;
    
    // 관리자 사원근태관리 김진호 2020. 1. 24
    public String taManagement() throws ClassNotFoundException, SQLException;
    
    //연차정보 등록 김정하 2020. 1. 27
    public int insertAnnUse(AnnUse annUse) throws ClassNotFoundException, SQLException;
    
    //연차정보 확정(승인) 김정하 2020. 1. 27
    public int updateAnnUse(String signNum) throws ClassNotFoundException, SQLException;
    
    //연차사용목록 List 김정하 2020. 1. 27
    public List<AnnUse> getAnnUseList(String empNum) throws ClassNotFoundException, SQLException;
    
    // 관리자 근태목록 김진호 2020. 1. 27
    public List<EmpDto> getTaList() throws ClassNotFoundException, SQLException;
    
    //연차정보 김정하 2020. 1. 28
    public EmpAnn getEmpAnn(String empNum) throws ClassNotFoundException, SQLException;
    
    //대시보드 부서별 연봉 연도 셀렉트박스 2020. 1. 28
    public List<String> getSalYear() throws ClassNotFoundException, SQLException;
    
    //대시보드 부서별 연봉
    public String getTeamAvgSal(int teamCode, String year) throws ClassNotFoundException, SQLException;
    
    //사원목록 page 김정하 / 2020. 1. 29
 	public List<EmpDto> empListPage(Map<String, String> map) throws ClassNotFoundException, SQLException;
 	
 	//사원목록 page처리 김정하 / 2020. 1. 29
 	public int empListPageCount() throws ClassNotFoundException, SQLException;
 	
    //연차정보 김진호 2020. 1. 29
    public EmpDto getEmpTa(int empNum) throws ClassNotFoundException, SQLException;
}