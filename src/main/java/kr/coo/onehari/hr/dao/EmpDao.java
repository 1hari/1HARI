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

	// 사원목록(주 table) 김정하 / 2020. 1. 9
	public List<EmpDto> empDefaultList() throws ClassNotFoundException, SQLException;

	// 사원정보(기안자) 김정하 / 2020. 1. 10
	public EmpDto empDefault(String empNum) throws ClassNotFoundException, SQLException;

	// 형남 0127 CEO 정보 가져오기(급여 명세서)
	public EmpDto getCEO() throws ClassNotFoundException, SQLException;

	// 연차정보 등록 김정하 2020. 1. 27
	public int insertAnnUse(AnnUse annUse) throws ClassNotFoundException, SQLException;

	// 연차정보 확정(승인) 김정하 2020. 1. 27
	public int updateAnnUse(String signNum) throws ClassNotFoundException, SQLException;

	// 연차사용목록 List 김정하 2020. 1. 27
	public List<AnnUse> getAnnUseList(String empNum) throws ClassNotFoundException, SQLException;

	// 연차정보 김정하 2020. 1. 28
	public EmpAnn getEmpAnn(String empNum) throws ClassNotFoundException, SQLException;

	// 사원목록 page 김정하 / 2020. 1. 29
	public List<EmpDto> empListPage(Map<String, String> map) throws ClassNotFoundException, SQLException;

	// 사원목록 page처리 김정하 / 2020. 1. 29
	public int empListPageCount(Map<String, String> map) throws ClassNotFoundException, SQLException;

	// 연차목록 1건조회 김정하 2020. 1. 30
	public AnnUse getAnnUse(String signNum) throws ClassNotFoundException, SQLException;

	// 연차정보 근태목록에 추가 김정하 2020. 1. 30
	public int setAnnUseTaList(Map map) throws ClassNotFoundException, SQLException;
}